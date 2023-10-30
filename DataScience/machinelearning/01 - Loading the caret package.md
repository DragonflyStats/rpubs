

```R
system("mkdir -p ~/.R", intern = TRUE)
system("cp ~/library/MakeVars ~/.R/Makevars", intern = TRUE)

```










```R
T1 <- Sys.time()
install.packages("caret",verbose=TRUE)
library(caret)
cat(Sys.time()-T1)
```

    Installing package into '/home/nbuser/R'
    (as 'lib' is unspecified)
    system (cmd0): /opt/microsoft/ropen/3.4.1/lib64/R/bin/R CMD INSTALL
    foundpkgs: caret, /tmp/RtmpBQ3tDB/downloaded_packages/caret_6.0-78.tar.gz
    files: /tmp/RtmpBQ3tDB/downloaded_packages/caret_6.0-78.tar.gz
    1): succeeded '/opt/microsoft/ropen/3.4.1/lib64/R/bin/R CMD INSTALL -l '/home/nbuser/R' /tmp/RtmpBQ3tDB/downloaded_packages/caret_6.0-78.tar.gz'


    14.61169

*** That was easy, wasn't it ***

While we are here, lets read in some data.

* We will use a couple of data sets that are stored on github repositories.
* A slight variation of the usual `read.csv()` approach will do fine.


```R
SAhearts <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/SAheart.csv")
```


```R
dim(SAhearts)
```


<ol class="list-inline">
	<li>462</li>
	<li>11</li>
</ol>




```R

```
