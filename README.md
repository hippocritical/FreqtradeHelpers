# FreqtradeHelpers
General collection of anything that I deemed cool or helpful

Be careful when trying to run that script, it is 3 month of timerange for a single backtest including timeframe-detail of 1 minute, meaning that it will blow up your ram!
dont use it with anything less than 16gb of ram and multiple GB of swap enabled.
My 24gb VPS uses swap too, if you got less ram then just reduce the timerange for a single backtest. The backtest static pairs can be taken from 
https://github.com/GeorgeMurAlkh/freqtrade-stuff/tree/main/user_data/pairlists
which you can just easily copy in.

Those backtests can be merged into graphs with the repo https://github.com/GrantWise/Freqtrade_Backtest_Analysis with some effort.

additional helpers are:
delist a pair that is announced to be delisted by binance (means drastic sentiment change)
https://github.com/leonardvdj/delist_util

when running multiple bots on a single IP, use proxy
https://github.com/abanchev/binance-proxy
example for 11 bots per IP:
  "internals": {"process_throttle_secs": 5},
  "rateLimit": 50

You can download data with the following command:
docker-compose run freqtrade download-data --config user_data/config_5Trades_allPairsBTC_202001-202107.json --timerange 20191201- --timeframe 1m 3m 5m 15m 30m 1h 2h 4h 12h 1d && docker-compose run freqtrade download-data --config user_data/config_5Trades_allPairsBUSD_202001-202107.json --timerange 20191201- --timeframe 1m 3m 5m 15m 30m 1h 2h 4h 12h 1d && docker-compose run freqtrade download-data --config user_data/config_5Trades_allPairsUSDT_202001-202107.json --timerange 20191201- --timeframe 1m 3m 5m 15m 30m 1h 2h 4h 12h 1d
as timeframe just pick & choose what you want.

dbtransferrer.sh:
a simple ssh script that downloads specific files onto your own pc, edit it to your liking. this should work with a few changes for you too if you are using an ssh key instead of a password login.


binance_weightwatcher.sh:
usage: [file] [output-csv-file] => ~/binance_weightwatcher.sh ~/output_csv.csv
This bash script executes in a loop every 58th second and writes the currently used query weight in a csv file for latter viewing in grafana or any other viewer.
This is useful for keeping track of the overall weight limit since u are not allowed to over-shoot the threshold of 1200 per minute since you will receive a timeout then.
Credits: https://github.com/leonardvdj
