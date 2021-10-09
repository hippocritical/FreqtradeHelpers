#!/bin/bash

commandorig="docker-compose run freqtrade backtesting --timeframe TFRAME TIMEFRAMEDETAIL --config user_data/config_5Trades_allPairsCURRENCY_TIMERANGESTART.json --timerange TIMERANGESTART-TIMERANGEEND --export-filename=user_data/backtest_results/MetaBacktest_STRATEGYCHUNKINDEX_TIMERANGESTART-TIMERANGEEND_CURRENCY_TFRAME.json --strategy-list STRATEGIES > RESULTS"

#outputErrors="/home/ubuntu/backtests/user_data/backtest_results/OUTPUT_NFI_TIMERANGESTART-TIMERANGEEND_CURRENCY_TFRAME_errors.txt"
outputResult="/home/ubuntu/backtests/user_data/backtest_results/OUTPUT_MetaBacktest_STRATEGYCHUNKINDEX_TIMERANGESTART-TIMERANGEEND_CURRENCY_TFRAME_results.txt"

#strategiesList="NostalgiaForInfinityNextGen_0b2f4ef_20210927"
#strategiesList="NostalgiaForInfinityV7 NostalgiaForInfinityV7_2_1 NostalgiaForInfinityV7_3_1 NostalgiaForInfinityV7_6_3 NostalgiaForInfinityV7_7_2 NostalgiaForInfinityV7_9_5 NostalgiaForInfinityV7_10_2 NostalgiaForInfinityV7_11_3 NostalgiaForInfinityV7_12_1 NostalgiaForInfinityV7_13_0 NostalgiaForInfinityV7_14_0 NostalgiaForInfinityV7_15_0 NostalgiaForInfinityV7_15_1 NostalgiaForInfinityV7_15_2 NostalgiaForInfinityV7_15_3 NostalgiaForInfinityV7_15_4 NostalgiaForInfinityV7_15_5"
 
strategiesChunks=("CryptoFrogHO CryptoFrogHO2 CryptoFrogHO2A CryptoFrogHO3A1 CryptoFrogHO3A2 CryptoFrogHO3A3 CryptoFrogHO3A4 CryptoFrogHO3A5 CryptoFrogNFI CryptoFrogNFIHO1A CryptoFrogOffset BinHV45HO BinHV45 CatBBRSI CatPeakValley_katzenmalen_20210811 CatPV CatSMI CatSteps CCIStrategy CombinedBinHAndClucHyper CombinedBinHAndClucHyperV3_Adriance_20210729 FollowTheGreenRabbitV1 Low_BB RabbitV2_1mTimeFrame ReinforcedSmoothScalp_HOMay ReinforcedSmoothScalp Scalp" "BearBull3 strato" "ASDTSRockwellTrading bbrsi_naive_strategy bbrsichop_Kalilz_20210912 bestV2 BigTrader_czarus_20210727 BigTrader BigZ03 BigZ03HO BigZ04_TSL2_Perkmeister_20210723 BigZ04_TSL3_buytag BigZ04_TSL3_Perkmeister_20210726 BigZ04_TSL3 BigZ04_TSL4_Perkmeister_20210810 BigZ04 BigZ04HO BigZ04HO2 BigZ07_fix BigZ07 BinHModWhiteHOV0 BinHV27 BoomHunter BreakEven BuyAllSellAllStrategy CHTP_vtest ClucMay72018 CofiBitStrategy Combined_NFIv7_SMA_Rallipanos_20210707 Combined_NFIv7_SMA CombinedBinHAndCluc CombinedBinHAndClucHyperStrategy CombinedBinHAndClucV2 CombinedBinHAndClucV3 CombinedBinHAndClucV4 CombinedBinHAndClucV4Hyperoptable CombinedBinHAndClucV5_Original CombinedBinHAndClucV5_with_confirm_trade_entry CombinedBinHAndClucV5 CombinedBinHAndClucV5Hyperoptable_2021025_to_20210425_SortinoHyperOptLossDaily CombinedBinHAndClucV5Hyperoptable CombinedBinHAndClucV6 CombinedBinHAndClucV6H CombinedBinHAndClucV7 CombinedBinHAndClucV8 CombinedBinHAndClucV8Hyper CombinedBinHAndClucV8M1 CombinedBinHAndClucV8XH CombinedBinHAndClucV9 CombinedBinHClucAndMADV3 CombinedBinHClucAndMADV6 CombinedBinHClucAndMADV9 CombinedBinHClucAndSMAOffset Diamond discordsocialist ElliotV2 ElliotV3_20210724 ElliotV3 ElliotV4_20210724 ElliotV4 ElliotV5 ElliotV5HO_pluxury_20210901 ElliotV6 ElliotV7 ElliotV8_orginal ElliotV8_original_ichiv2 ElliotV8_original_ichiv3 ElliotV8 EMASkipPump ewt2 FrankenStrat GodStraNew_IcHiAT_20210801 GodStraNew_SMAonly HybridMonster IchisV1 IchiV1_Fixed_HK_Close InformativeSample LuxOSC MACDStrategy_crossed MACDStrategy MADisplaceV3_orig MAOffsetsCombinedV0 MiEstrategia29_v101_edited MiEstrategia29_v101 MiEstrategia29 MomStrategy MrMeanV1 MultiMA_TSL_karibikkarlos_20210917 MultiMA_TSL MultiRSI my_suck_strategy_ROI_v2_irfan_20210728 NASOSv4 NASOSv5 NASOSvBUSDv4_Reinuvader_20210923" "NFI46 NFI46Offset NFI46OffsetHOA1 NFI46Z NFI47 NFI4Frog NFI5MOHO_WIP_ExZork_20210729 NFI7HO2_TA4TAR_20210715 NFI7HO2 NostalgiaForInfinity_V7_6_CTT_1 NostalgiaForInfinity_V7_6_CTT NostalgiaForInfinity7_12_1 NostalgiaForInfinity7_hyperopted_ChangeToTower_20210710 NostalgiaForInfinityNext_ChangeToTower_V3 NostalgiaForInfinityNext_ChangeToTower_V4_1 NostalgiaForInfinityNext_ChangeToTower_V5_2 NostalgiaForInfinityNext_ChangeToTower_V5_3 NostalgiaForInfinityNext_ChangeToTower_V5 NostalgiaForInfinityNext_ChangeToTower_V6 NostalgiaForInfinityNextS NostalgiaForInfinityV1 NostalgiaForInfinityV2 NostalgiaForInfinityV3 NostalgiaForInfinityV4 NostalgiaForInfinityV4HO NostalgiaForInfinityV5 NostalgiaForInfinityV5MultiOffsetAndHO_ExZork_20210724 NostalgiaForInfinityV5MultiOffsetAndHO NostalgiaForInfinityV5MultiOffsetAndHO2 NostalgiaForInfinityV6 NostalgiaForInfinityV6HO NostalgiaForInfinityV7_1_0 NostalgiaForInfinityV7_1_TweakV4 NostalgiaForInfinityV7_10_0 NostalgiaForInfinityV7_10_1 NostalgiaForInfinityV7_10_2 NostalgiaForInfinityV7_11_0 NostalgiaForInfinityV7_11_1 NostalgiaForInfinityV7_11_2 NostalgiaForInfinityV7_11_3 NostalgiaForInfinityV7_12_0 NostalgiaForInfinityV7_12_1 NostalgiaForInfinityV7_13_0 NostalgiaForInfinityV7_14_0 NostalgiaForInfinityV7_15_0 NostalgiaForInfinityV7_15_1 NostalgiaForInfinityV7_15_2 NostalgiaForInfinityV7_15_3 NostalgiaForInfinityV7_15_4 NostalgiaForInfinityV7_15_5 NostalgiaForInfinityV7_2_0 NostalgiaForInfinityV7_2_1 NostalgiaForInfinityV7_3_0 NostalgiaForInfinityV7_3_1 NostalgiaForInfinityV7_4_0 NostalgiaForInfinityV7_4_1 NostalgiaForInfinityV7_4_2 NostalgiaForInfinityV7_5_0 NostalgiaForInfinityV7_5_1 NostalgiaForInfinityV7_6_0 NostalgiaForInfinityV7_6_1 NostalgiaForInfinityV7_6_2 NostalgiaForInfinityV7_6_3 NostalgiaForInfinityV7_7_0 NostalgiaForInfinityV7_7_1 NostalgiaForInfinityV7_7_2 NostalgiaForInfinityV7_8_0 NostalgiaForInfinityV7_9_0 NostalgiaForInfinityV7_9_1 NostalgiaForInfinityV7_9_2 NostalgiaForInfinityV7_9_3 NostalgiaForInfinityV7_9_4 NostalgiaForInfinityV7_9_5 NostalgiaForInfinityV7_ChangeToTower_V3_20210728 NostalgiaForInfinityV7_ChangeToTower_V6_20210815 NostalgiaForInfinityV7" "NotAnotherSMAOffsetStrategy_uzi NotAnotherSMAOffsetStrategy_uzi2_20210816 NotAnotherSMAOffsetStrategy_uzi2 NotAnotherSMAOffsetStrategy_uzi3 NotAnotherSMAOffSetStrategy_V2 NotAnotherSMAOffsetStrategy NotAnotherSMAOffsetStrategyHO NotAnotherSMAOffsetStrategyHOv3_pluxury_20210822 NotAnotherSMAOffsetStrategyLite NotAnotherSMAOffsetStrategyModHO_LamineDz_20210901 NotAnotherSMAOffsetStrategyModHO_pluxury_20210807 NotAnotherSMAOffsetStrategyX1_Perkmeister_20210815 NotAnotherSMAOffsetStrategyX1 Obe Obelisk_Ichimoku_ZEMA_v1 PumpDetector QuickieHyperStrategy RalliV1 ReinforcedQuickie rsiDivexperimental SarScalper ScalpHO SlowPotato SMA1CTE1 SMA1CTE2 SMA1Sell SMAIP3 SMAIP3v2_boschje_20210805 SMAOffset_20201205_20210405_SortinoHyperOptLossDaily SMAOffset SMAOffsetBZed SMAOffsetHyperoptable_v20210506 SMAOffsetHyperoptable SMAOffsetNaive SMAOffsetProtect_LamborghiniAvenator_20210711 SMAOffsetProtectOptV0 SMAOffsetProtectOptV1_hanend_20210619 SMAOffsetProtectOptV1_kkeue_20210619 SMAOffsetProtectOptV1 SMAOffsetProtectOptV1HO1 SMAOffsetV2 SMAOG_Jooopieeert_20210816 SMAOG SMAOPv1_TTF SmoothOperator strat_suck_1a_stash86_20210728 Strategy001_custom_sell Sylv TakePUMP_052021 TDSequentialStrategy test_ema2 TheRealPullbackV2 TTF crsiv9" "A1 ADX2 adx_strategytsedit_Tonys_20210815 bbandrsi_lolno_20210724 BBRSIHyperStrategy BBRSIStochHyperStrategy BBRSIStrategy_darthvader666uk_20210729 BBRSIStrategy CMCWinner_Opt2 CMCWinner macd" "BandRSI3 wtc" "ADXMomentum AdxSmas AwesomeMacd BbandRsi BreakStrategy CustomStoplossWithPSAR DoubleEMACrossoverWithTrend EMAPriceCrossoverWithThreshold Freqtrade_backtest_validation_freqtrade1 Inverse MACDCrossoverWithTrend MFIStrategy MinmaxF NormalizerStrategyHO2 NormalizerStrategy Quickie RSIDirectionalWithTrend RSIDirectionalWithTrendSlow TSIHULLBOT" "AverageStrategy bnbHunter DevilStra GodStraNew Heracles hlhb Ichimoku_v25 InverseV2 mabStra ReinforcedAverageStrategy Zeus" "GodStra" "MacheteV8b_20210822 MacheteV8b")

timeranges=(20200101 20200401 20200701 20201001 20210101 20210401 20210701)
timeframes=("1m" "3m" "5m" "5m" "5m" "15m" "30m" "1h" "4h" "12h" "15m")

timeframeDetails=("" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "--timeframe-detail 1m" "")

for currency in USDT
	do
	for tframeArrayIndex in "${!timeframes[@]}"
		do
		for timerangeArrayIndex in "${!timeranges[@]}"
			do
			
			#this serves as a stopper not to EVER start anything that is at minute 0 5 10 [...] ... or even 59 04 09 [...] due to issues with backtest-start and existing query weight
			gotExecuted=false
			until [ $gotExecuted = true ]
				do
				currentMin=$(date "+%M")
				currentMin=${currentMin#0}
				modulo=$(( $currentMin  % 5 ))
				#echo $gotExecuted
				#echo $currentMin
				#echo $modulo
				
				if [[ ( "$modulo" > "0" ) && ( "$modulo" < "4" ) ]]
					then
					gotExecuted=true
					#echo "gotExecuted was set"
				else
					sleep 10
					echo "sleeping..."
				fi
			done
			
			currentTimeRangeValue=${timeranges[$timerangeArrayIndex]}
			nextTimeRangeValue=${timeranges[$timerangeArrayIndex+1]}

			currentTimeFrameValue=${timeframes[$tframeArrayIndex]}
			strategyChunk=${strategiesChunks[$tframeArrayIndex]}
			timeframeDetailValue=${timeframeDetails[$tframeArrayIndex]}

			command=$commandorig

			command=${command//ERRORS/$outputErrors}
			command=${command//RESULTS/$outputResult}
			command=${command//TFRAME/$currentTimeFrameValue}
			command=${command//CURRENCY/$currency}
			command=${command//STRATEGIES/$strategyChunk}
			command=${command//STRATEGYCHUNKINDEX/$tframeArrayIndex}
			command=${command//TIMERANGESTART/$currentTimeRangeValue}
			command=${command//TIMERANGEEND/$nextTimeRangeValue}
			command=${command//TIMEFRAMEDETAIL/$timeframeDetailValue}

			echo ""
			echo "started at:" 
			date +"%Y-%m-%d %T"
			echo $command
			#eval $command
			sleep 10 #just to avoid any possible "docker network still has active endpoints" if something goes wrong ...
		done
		wait
	done
done
