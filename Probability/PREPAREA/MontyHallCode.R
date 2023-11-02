# Monty Hall Problem
# R implementation 

##############################################
# PART 1
# - We have 3 doors to choose from.
# - Define a numeric sequence between 1 and 3

Doors = 1:3 

# The command sample(,n) takes a sample of size n from our set of values.
# Here we just want to select one door to be our "correct door" 
# and another to be the door the contestant selects.
# These selections are independent so we perform the selection for both seperately.

Correct = sample(Doors,1)
Choice = sample(Doors,1)


# Equivalently we could use the uniform distribution to pick numbers.
# Choice=floor(runif(1,1,3))

#############################################
# PART 2 
# - A wrong door must be selected to be opened. 
# - The door selected by the contestant can not be chosen.
# - First lets select the doors that must stay closed.
# - Then find the ones we can choose from to open.


StayClosed = union(Correct, Choice)
CanOpen = setdiff(Doors, StayClosed)

#############################################
# The R command "sample()" poses an interesting problem. 
# Lets look at the help file to see what it is.



if(length(CanOpen)>1)
   {
   Open = sample(CanOpen,1) 
   }else {Open=CanOpen}

NotOpen = setdiff(Doors,Open)

Stick = Choice
Switch = setdiff(NotOpen,Choice)

Stick==Choice
Switch==Choice


StickCount = 0
SwitchCount = 0

for(i in 1:1000)
{
#Define a numeric sequence between 1 and 3
Doors = 1:3 
Correct = sample(Doors,1)
# Door 1 :  Correct answer
# Which door does the contestant choose?
Choice=floor(runif(1,1,3))

# Equivalently
# Choice = sample(Doors,1)


# A wrong door must be selected to be opened. 
# The door selected by the contestant can not be chosen.
# First lets select the doors that must stay closed 

StayClosed = union(Correct, Choice)


CanOpen = setdiff(Doors, StayClosed)




if(length(CanOpen)>1)
{
Open = sample(CanOpen,1) #Problem here
}else {Open=CanOpen}

NotOpen = setdiff(Doors,Open)

Stick = Choice

Switch = setdiff(NotOpen,Choice)



StickCount = StickCount + as.numeric(Stick  ==  Correct)
SwitchCount = SwitchCount + as.numeric(Switch  ==  Correct)

}


StickCount
SwitchCount

