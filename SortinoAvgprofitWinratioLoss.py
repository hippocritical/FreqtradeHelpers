from datetime import datetime
from pandas import DataFrame
from typing import Dict
from freqtrade.optimize.hyperopt import IHyperOptLoss
from freqtrade.optimize.hyperopt_loss.hyperopt_loss_sortino_daily import SortinoHyperOptLossDaily

# Adjust the parameters to your liking, it drastically depends on what your strategy needs or what you want to encourage / punish!
# Nothing is right, nothing is wrong. Feel free to experiment and change things!
# Adding new parameters to the calculations could be a valid option too.
class SortinoAvgprofitWinratioLoss(IHyperOptLoss):

    @staticmethod
    def hyperopt_loss_function(results: DataFrame, trade_count: int, min_date: datetime, max_date: datetime,
                               config: Dict, processed: Dict[str, DataFrame], *args, **kwargs) -> float:

        # Calculate the Sortino Ratio & Try to calculate the Max DrawDown
        sortino_ratio = \
            SortinoHyperOptLossDaily.hyperopt_loss_function(results, trade_count, min_date, max_date, *args, **kwargs)

        # Calculate the Average & Total Profit, Profit Threshold, Total Lose & Win, Average Trade Duration
        average_profit = results['profit_ratio'].mean() * 100

        total_lose = len(results[results['profit_ratio'] <= 0])
        total_lose = 1 if total_lose == 0 else total_lose
        total_win = len(results[results['profit_ratio'] > 0])

        win_lose = total_win / (total_lose + total_win)

        total_objective = pow(average_profit,1.8) * sortino_ratio * pow(win_lose,1.5)

        # neg makes the result if it is not derirable positive meaning bad.
        # a neg of -1 is desirable.

        return total_objective
