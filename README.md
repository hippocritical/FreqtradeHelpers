# FreqtradeHelpers
General collection of anything that I deemed cool or helpful

Be careful when trying to run that script, it is 3 month of timerange for a single backtest including timeframe-detail of 1 minute, meaning that it will blow up your ram!
dont use it with anything less than 16gb of ram and multiple GB of swap enabled.
My 24gb VPS uses swap too, if you got less ram then just reduce the timerange for a single backtest. The backtest static pairs can be taken from 
https://github.com/GeorgeMurAlkh/freqtrade-stuff/tree/main/user_data/pairlists
which you can just easily copy in.

Those backtests can be merged into graphs with the repo https://github.com/GrantWise/Freqtrade_Backtest_Analysis with some effort.
