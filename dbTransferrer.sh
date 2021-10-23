#!/bin/bash

#this bash script is used to transfer files from multiple VPSes to your home pc to have it show up in a grafana database (or anything else you please).
#you could crontab -e the following command to let it run every hour:
#0 * * * * [path-to-location]/[filename.sh]
ssh-add ~/freqtrade/oracle.key #edit it to your liking
key_loc="/home/hippocrite/freqtrade/oracle.key" #not necessary if you did ssh-add but can never hurt.
fileCopier()
{
    USER=$1
    IP=$2
    SourceDir=$3
    TargetDir="/home/hippocrite/Grafana/DBs/" #edit it to your liking
    FileName=$4
    
    SourceFullPath=$SourceDir$FileName
    TargetFullPath=$TargetDir$FileName
    
    scp -i $key_loc $USER@$IP:$SourceFullPath $TargetFullPath
}

#example for a csv file to be transferred to your pc from a VPS
#fileCopier ubuntu [VPS_IP] [SOURCE_FOLDER] [FILE]
