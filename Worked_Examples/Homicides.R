## Step 1 : read in data set
## Use readLines() function
homicides <- readLines("homicides.txt");

## How many cases?
length(homicides)

## Lets Look at first case
homicides[1]
nchar(homicides[1])

## Lets break it up into readable chunks

substr(homicides[1],1,70)
substr(homicides[1],71,140)
substr(homicides[1],141,210)
substr(homicides[1],211,nchar(homicides[1]))


##########################################

# Key piece of information comes at the end.
# "Cause: ......."
# > substr(homicides[1],241,nchar(homicides[1]))
# [1] "</dd><dd>Cause: shooting</dd></dl>'"

##########################################

# Some cases dont list causes of death
# Which ones?

SetA=1:length(homicides)  # Set of all case numbers
SetB=grep("Cause",homicides) # Set of cases with "Cause" listed

setdiff(SetA,SetB)

#  No Cause of death: 212 213 236 238 515
#  Advise reading these cases to make sure.

# > homicides[515]
# [1] "\t\t\t\t\t\t"
grep(homicides,"Cause")
