
psmatch2  microfinance lnconsumption employment_status hhsize north central male age_head single married separated divorced widow  traditional christianity islam other_religion income, kernel caliper(0.5) com logit
gen sample=0
replace sample=1 if _support==1

eststo means: quietly estpost summarize financial_literacy lnconsumption employment_status hhsize north central south male age_head single married separated divorced widow never_married none_religious traditional christianity islam other_religion income if sample==1

eststo microfinance: quietly estpost summarize financial_literacy lnconsumption employment_status hhsize north central south male age_head single married separated divorced widow never_married none_religious traditional christianity islam other_religion income if microfinance==1 & sample==1

eststo No_microfinance: quietly estpost summarize financial_literacy lnconsumption employment_status hhsize north central south male age_head single married separated divorced widow never_married none_religious traditional christianity islam other_religion income if microfinance==0 & sample==1

eststo diff: quietly estpost ttest financial_literacy lnconsumption employment_status hhsize north central south male age_head single married separated divorced widow never_married none_religious traditional christianity islam other_religion income if sample==1, by(microfinance)unequal

esttab means microfinance No_microfinance diff using "newdesc_seasonal.rtf",  replace cells("mean(pattern(1 1 1 0)fmt(3))b(star pattern(0 0 0 1) fmt(3))")nonum mtitles("Full sample" "microfinance""No microfinance" "Differences") nogaps compress title(Means and differences in means by microfinance)