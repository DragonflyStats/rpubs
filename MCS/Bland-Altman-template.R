

#################
A = 0.5*(X+Y)
D = X-Y

plot(A,D, 
pch =17, 
col="black",
xlim=c(-20,160),
ylim=c(-20,20), ylab=expression(bold("Casewise Differences (D) m")),
xlab=expression(bold("Casewise Averages (A) ")),

main=c("Bland-Altman Plot"),sub=c("Zhang et al. (1986)"),
)

abline(mean(D),0,lty=1,col="red")
abline( (mean(D) - 2*sd(D)), 0,lty=2,col="blue")
abline( (mean(D) + 2*sd(D)), 0,lty=2,col="blue")

temp <- legend("topleft", legend = c("Inter-method bias", "Limits of agreement"), text.font = 2,
               text.width = strwidth("Limits of agreement  "),
               lty = 1:2,col=c("red","blue"), xjust = 1, yjust = 1,
              )

ggsave(device="eps","ZhangDeming_2.eps")

