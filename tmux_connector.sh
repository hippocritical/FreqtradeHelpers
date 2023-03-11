#!/bin/bash

function calculate_tunnel_args() {
    local start_port="$1"
    local end_port="$2"
    local tunnel_args=""
    for i in $(seq "$start_port" "$end_port"); do
        tunnel_args+=" -L $i:localhost:$i"
    done
    echo "$tunnel_args"
}

function start_ssh_tunnel() {
    local keyfolder="[Path/To/Your/Keyfolders]"
    local tmux_name="$1"
    local keyfile="$keyfolder/$2"
    local user="$3"
    local ip="$4"
    local start_port="$5"
    local end_port="$6"
    local user_ip="$user@$ip"

    if [ "$user" = "" ]; then
        user_ip=$ip
    fi

    local tunnel_args="$(calculate_tunnel_args "$start_port" "$end_port")"
    echo "tunnel args: $tunnel_args"
    
    local tmux_variables="$tmux_name \"tmux send-keys -t $tmux_name: 'btop' Enter; ssh -o IdentitiesOnly=yes -i $keyfile $user_ip $tunnel_args \""
    # Check if tmux session exists
    if tmux has-session -t "$tmux_name" 2>/dev/null; then
        # If it exists, split the window
        local tmux_cmd="tmux split-window -t $tmux_variables"
        echo "$tmux_cmd"
        if ! eval "$tmux_cmd"; then
            echo "Error: Failed to create split window in tmux session $tmux_name" >&2
            exit 1
        fi

        # Set layout to tiled
        tmux_cmd="tmux select-layout -t $tmux_name tiled"
        echo "$tmux_cmd"
        if ! eval "$tmux_cmd"; then
            echo "Error: Failed to set tiled layout in tmux session $tmux_name" >&2
            exit 1
        fi
    else
        # If it doesn't exist, create a new session
        local tmux_cmd="tmux new-session -d -s $tmux_variables"
        echo "$tmux_cmd"
        if ! eval "$tmux_cmd"; then
            echo "Error: Failed to create new tmux session $tmux_name" >&2
            exit 1
        fi
    fi

    sleep 0.1
}




session_name= [Name / identifier of the session]
#kill old session if exists
tmux kill-session -t $session_name
sleep 1

start_ssh_tunnel $session_name [keyfile_without_folder.key] [LoginUser] [IP] [StartPort_Frequi] [EndPort_Frequi]
start_ssh_tunnel $session_name [keyfile_without_folder.key] [LoginUser] [IP] [StartPort_Frequi] [EndPort_Frequi]

gnome-terminal --tab -e "tmux attach -dt $session_name"
