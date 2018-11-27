# CTE-prevalence
Data and code for calculating CTE prevalence

This repo contains two files pertaining to the paper <a href="http://n.neurology.org/lookup/doi/10.1212/WNL.0000000000006699">"Estimating the prevalence at death of CTE neuropathology among professional football players</a>" by Binney and Bachynski (2018) in the journal <i>Neurology</i>.

The first is a CSV of professional football deaths from pro-football-reference.com. <a href="https://www.pro-football-reference.com/years/2016/deaths.htm">Here</a> is a link to example data from 2016.

The second is the R script used to generate the figure and estimates in the paper. This version of the figure also includes a 95% confidence interval.

<span style="text-decoration: underline;">FAQs and Comments</span>

<b>What year and how old were the players who died?</b>

We do not have data from the brain bank administrators on the details of the 111 specifically NFL brains they autopsied. Of the 1,142 deaths listed in PFR, the mean age at death was 73.9 years. The deaths were roughly evenly distributed from 2008 through 2016.

<b>When did these players play?</b>

Again, we do not have the specific years for the 111 autopsied players. Among the 1,142 deaths listed in PFR, the median retirement year was 1963 (10th percentile 1947, 90th percentile 1987).

<b>Is it possible CTE rates are different now than when these players played?</b>

Yes. It may be that players playing today are at lower risk than those from earlier eras due to some positive safety-related rule and equipment changes in the NFL. However, we believe it is at least equally likely that the older era provides an underestimate of the current CTE burden because players today are bigger, faster, and stronger than ever before, imparting greater forces with each collision.
