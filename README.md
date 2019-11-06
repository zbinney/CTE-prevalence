# CTE-prevalence
Data and code for calculating CTE prevalence in NFL (and other pro football) retirees

This repo contains two files pertaining to the paper <a href="http://n.neurology.org/lookup/doi/10.1212/WNL.0000000000006699">"Estimating the prevalence at death of CTE neuropathology among professional football players</a>" by Binney and Bachynski (2018) in the journal <i>Neurology</i>.

The first is a CSV of professional football deaths from pro-football-reference.com. <a href="https://www.pro-football-reference.com/years/2016/deaths.htm">Here</a> is a link to example data from 2016. Please note to get from the data to our count of 1,142 you must exclude entries whose only position is "Coach" and who died in months outside the original BU study's timeframe (0's in the column named "Include" in the CSV).

The second is the R script used to generate the figure and estimates in the paper. This version of the figure also includes a 95% confidence interval.

## FAQs and Comments

<b>What year and how old were the players who died?</b>

We do not have data from the brain bank administrators on the details of the 111 specifically NFL brains they autopsied. Of the 1,142 deaths listed in PFR, the mean age at death was 73.9 years. The deaths were roughly evenly distributed from 2008 through 2016.

<b>When did these players play?</b>

Again, we do not have the specific years for the 111 autopsied players. Among the 1,142 deaths listed in PFR, the median retirement year was 1963 (10th percentile 1947, 90th percentile 1987). The mean and median career lengths were 4.6 and 3 years, respectively.

<b>Is it possible CTE rates now are different now than when these players played?</b>

Yes. It may be that players playing today are at lower risk than those from earlier eras due to some positive safety-related rule and equipment changes in the NFL. However, we believe it is at least equally likely that the older era actually would actually understate the CTE prevalence for current players because players today are bigger, faster, and stronger than ever before, imparting greater forces to the brain with each collision.

<b>Are you confident 1,142 is an accurate death count? Could PFR be undercounting deaths?</b>

We are reasonably confident in its accuracy. PFR lists 156 players retiring in 1963 (227 in 1947 and 208 in 1986 (the 1987 numbers would be meaningless because of the strike and subsequent replacement players)). Of the 156 retirements in 1963, PFR coded 27 as dying from 2008-2016 (17.3%). In the general population using male SSA life tables - assuming these players were all born in 1940 - we would have expected ~22.3% to die during this time period (i.e. between age 68 and 76). Given the rough assumptions of this method, the health differences between NFL players and the general population, and random error, we do not feel this difference suggests a large undercounting of deaths. Others may prefer to inflate our number of deaths by 25-30% (plugging in, say, 1,500 deaths from 2008-2016 instead of 1,142) to account for underreporting. Note, however, that even in this rosier scenario our conclusion - a very high rate of CTE in NFL retirees - remains unchanged.
