mountainplot(~y, data=sbp, group=meth,auto.key=list(columns=3),
par.settings = list(superpose.line = list(lwd=3)),
main=list(
label="Mountain Plot for the Systolic Blood Pressure Data set\n",
cex=1.25),
xlab=list(
label="Systolic Blood Pressure (by Method)",
cex=1.25),
ylab=list(
label="Folded Quantile",
cex=1.25),
scales=list(cex=1.25)
)
