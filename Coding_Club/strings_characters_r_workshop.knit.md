---
title: "R Workshop"
author: "Dublin R User Group"
date: "Last updated: August 28, 2021"
output:
  rmdformats::readthedown:
    toc_depth: 3
    use_bookdown: TRUE
    code_folding: hide
    fig_caption: TRUE


html_document:
  fig_caption: yes
  theme: sandstone #spacelab #flatly
  highlight: pygments
  number_sections: TRUE
  toc: TRUE
  toc_depth: 2
  toc_float:
    smooth_scroll: FALSE


---
  
  

```
## Warning: package 'tidygraph' was built under R version 4.0.5
```
`

Strings and Regular Expressions
Estimated time needed: 30 minutes

Objectives
After completing this lab you will be able to:

Understand and perform string operations in R
Understand and use regular expressions to find patterns in strings
You will be working on this lab in cloud-based RStudio hosted by IBM Skills Network Labs.

Note that your lab will be reset after about 1 hour inactive window. It's recommended to backup the files you created.

About the Dataset
In this lab, we are going to use The_Artist.txt file. This file contains text data which is basically summary of the The Artist movie and we are going to perform various operations on this data.

image

First, let's identify your current working directory

In the RStudio Console, run the following code snippet:
getwd()
then you should see the following result in console:

[1] "/resources/rstudio"
In the Files panel on the right, if you are not in /resources/rstudio, click resources folder and you should find a rstudio folder. This will be your current working directory in RStudio.

Now let's download the text file by copying the following code in the console, press the Enter key to run the code:
# code to download the dataset


```r
#if( !("The_Artist.txt" %in% list.files("getwd()"))){
#
#download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/The_Artist.txt", destfile="The_Artist.txt")
#  
#}  
```

# Reading Text Files
To read text files in R, we can use the built-in R function readLines(). This function takes file path as the argument and read the whole file.

Let's read the ***The_Artist.txt*** file and see how it looks like.

Copy and run following code snippet in the console

```r
my_data <- readLines("The_Artist.txt")
my_data
```

```
## [1] "The Artist is a 2011 French romantic comedy-drama in the style of a black-and-white silent film. It was written, directed, and co-edited by Michel Hazanavicius, produced by Thomas Langmann and starred Jean Dujardin and BÃ©rÃ©nice Bejo. The story takes place in Hollywood, between 1927 and 1932, and focuses on the relationship of an older silent film star and a rising young actress as silent cinema falls out of fashion and is replaced by the talkies."                                                                                                                                                            
## [2] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [3] "The Artist received highly positive reviews from critics and won many accolades. Dujardin won the Best Actor Award at the 2011 Cannes Film Festival, where the film premiered. The film was nominated for six Golden Globes, the most of any 2011 film, and won three: Best Motion Picture â\200“ Musical or Comedy, Best Original Score, and Best Actor â\200“ Motion Picture Musical or Comedy for Dujardin. In January 2012, the film was nominated for twelve BAFTAs, the most of any film from 2011 and won seven, including Best Film, Best Director and Best Original Screenplay for Hazanavicius, and Best Actor for Dujardin."
## [4] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## [5] ""
```
and you should see the text content shown in the console:

[1] "The Artist is a 2011 French romantic comedy-drama in the style of a black-and-white silent film. It was written, directed, and co-edited by Michel Hazanavicius, produced by Thomas Langmann and starred Jean Dujardin and Bérénice Bejo. The story takes place in Hollywood, between 1927 and 1932, and focuses on the relationship of an older silent film star and a rising young actress as silent cinema falls out of fashion and is replaced by the talkies."                                                                                                                                                          
[2] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
[3] "The Artist received highly positive reviews from critics and won many accolades. Dujardin won the Best Actor Award at the 2011 Cannes Film Festival, where the film premiered. The film was nominated for six Golden Globes, the most of any 2011 film, and won three: Best Motion Picture – Musical or Comedy, Best Original Score, and Best Actor – Motion Picture Musical or Comedy for Dujardin. In January 2012, the film was nominated for twelve BAFTAs, the most of any film from 2011 and won seven, including Best Film, Best Director and Best Original Screenplay for Hazanavicius, and Best Actor for Dujardin."
[4] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
[5] ""  
If you got an error message here, make sure that you run the code cell above first to download the dataset

So, we get a character vector which has several elements and these elements can be accessed as we access array.

Let's check the length of my_data variable:

length(my_data)
Length of my_data variable is 5 which means it contains 5 elements.

Similarly, we can check the size of the file by using the file.size() method of R and it takes file path as argument and returns the number of bytes.

By executing code snippet below, we will get 1065 at the output, which is the size of the file in bytes.
file.size("The_Artist.txt")
There is another method scan() which can be used to read .txt files.

The Difference in readLines() and scan() method is that, readLines() is used to read text files line by line whereas scan() method read the text files word by word.

scan() method takes two arguments. First is the file path and second argument is the string expression according to which we want to separate the words.

Like in example below, we pass an empty string as the separator argument.

```r
my_data1 <- scan("The_Artist.txt", "")
my_data1
```

```
##   [1] "The"             "Artist"          "is"              "a"              
##   [5] "2011"            "French"          "romantic"        "comedy-drama"   
##   [9] "in"              "the"             "style"           "of"             
##  [13] "a"               "black-and-white" "silent"          "film."          
##  [17] "It"              "was"             "written,"        "directed,"      
##  [21] "and"             "co-edited"       "by"              "Michel"         
##  [25] "Hazanavicius,"   "produced"        "by"              "Thomas"         
##  [29] "Langmann"        "and"             "starred"         "Jean"           
##  [33] "Dujardin"        "and"             "BÃ©rÃ©nice"      "Bejo."          
##  [37] "The"             "story"           "takes"           "place"          
##  [41] "in"              "Hollywood,"      "between"         "1927"           
##  [45] "and"             "1932,"           "and"             "focuses"        
##  [49] "on"              "the"             "relationship"    "of"             
##  [53] "an"              "older"           "silent"          "film"           
##  [57] "star"            "and"             "a"               "rising"         
##  [61] "young"           "actress"         "as"              "silent"         
##  [65] "cinema"          "falls"           "out"             "of"             
##  [69] "fashion"         "and"             "is"              "replaced"       
##  [73] "by"              "the"             "talkies."        "The"            
##  [77] "Artist"          "received"        "highly"          "positive"       
##  [81] "reviews"         "from"            "critics"         "and"            
##  [85] "won"             "many"            "accolades."      "Dujardin"       
##  [89] "won"             "the"             "Best"            "Actor"          
##  [93] "Award"           "at"              "the"             "2011"           
##  [97] "Cannes"          "Film"            "Festival,"       "where"          
## [101] "the"             "film"            "premiered."      "The"            
## [105] "film"            "was"             "nominated"       "for"            
## [109] "six"             "Golden"          "Globes,"         "the"            
## [113] "most"            "of"              "any"             "2011"           
## [117] "film,"           "and"             "won"             "three:"         
## [121] "Best"            "Motion"          "Picture"         "â\200“"            
## [125] "Musical"         "or"              "Comedy,"         "Best"           
## [129] "Original"        "Score,"          "and"             "Best"           
## [133] "Actor"           "â\200“"             "Motion"          "Picture"        
## [137] "Musical"         "or"              "Comedy"          "for"            
## [141] "Dujardin."       "In"              "January"         "2012,"          
## [145] "the"             "film"            "was"             "nominated"      
## [149] "for"             "twelve"          "BAFTAs,"         "the"            
## [153] "most"            "of"              "any"             "film"           
## [157] "from"            "2011"            "and"             "won"            
## [161] "seven,"          "including"       "Best"            "Film,"          
## [165] "Best"            "Director"        "and"             "Best"           
## [169] "Original"        "Screenplay"      "for"             "Hazanavicius,"  
## [173] "and"             "Best"            "Actor"           "for"            
## [177] "Dujardin."
```

If we will check length of my_data1 variable then we will get total number of elements at the output.


```r
length(my_data1)
```

```
## [1] 177
```
Coding Exercise: Get the frequency for each word in "TheArtist.txt" file. (HINT: convert mydata1 to factor and use summary() function)



```r
my_data1 <- scan("The_Artist.txt", ",")
word_factor <- factor(my_data1)
summary(word_factor)
```

```
##             and             the            Best            film             for 
##              13               9               8               5               5 
##              of            2011             The             won               a 
##               5               4               4               4               3 
##           Actor              by          silent             was             â\200“ 
##               3               3               3               3               2 
##             any          Artist        Dujardin       Dujardin.            from 
##               2               2               2               2               2 
##   Hazanavicius,              in              is            most          Motion 
##               2               2               2               2               2 
##         Musical       nominated              or        Original         Picture 
##               2               2               2               2               2 
##            1927           1932,           2012,      accolades.         actress 
##               1               1               1               1               1 
##              an              as              at           Award      BÃ©rÃ©nice 
##               1               1               1               1               1 
##         BAFTAs,           Bejo.         between black-and-white          Cannes 
##               1               1               1               1               1 
##          cinema       co-edited          Comedy    comedy-drama         Comedy, 
##               1               1               1               1               1 
##         critics       directed,        Director           falls         fashion 
##               1               1               1               1               1 
##       Festival,            Film           film,           Film,           film. 
##               1               1               1               1               1 
##         focuses          French         Globes,          Golden          highly 
##               1               1               1               1               1 
##      Hollywood,              In       including              It         January 
##               1               1               1               1               1 
##            Jean        Langmann            many          Michel           older 
##               1               1               1               1               1 
##              on             out           place        positive      premiered. 
##               1               1               1               1               1 
##        produced        received    relationship        replaced         reviews 
##               1               1               1               1               1 
##          rising        romantic          Score,      Screenplay          seven, 
##               1               1               1               1               1 
##             six            star         starred           story           style 
##               1               1               1               1               1 
##           takes        talkies.          Thomas          three:         (Other) 
##               1               1               1               1               4
```

# String Operations

There are many string operation methods in R which can be used to manipulate the data. We are going to use some basic string operations on the data that we read before.

## ``nchar()``
The first function is nchar() which will return the total number of characters in the given string. Let's find out how many characters are there in the first element of my_data variable.

nchar(my_data[1])

## ``toupper()``
Now, sometimes we need the whole string to be in Upper Case. To do so, there is a function called toupper() in R which takes a string as input and provides the whole string in upper case at output.

toupper(my_data[3])
In above code block, we convert the third element of the character vector in upper case.

## ``tolower()``
Similarly, tolower() method can be used to convert whole string into lower case. Let's convert the same string that we convert in upper case, into lower case.


```r
tolower(my_data[3])
```

```
## [1] "the artist received highly positive reviews from critics and won many accolades. dujardin won the best actor award at the 2011 cannes film festival, where the film premiered. the film was nominated for six golden globes, the most of any 2011 film, and won three: best motion picture â\200“ musical or comedy, best original score, and best actor â\200“ motion picture musical or comedy for dujardin. in january 2012, the film was nominated for twelve baftas, the most of any film from 2011 and won seven, including best film, best director and best original screenplay for hazanavicius, and best actor for dujardin."
```

We can clearly see the difference between the outputs of last two methods.

# ``chartr()``

what if we want to replace any characters in given string?

This operation can also be performed in R using chartr() method which takes three arguments. The first argument is the characters which we want to replace in string, second argument is the new characters and the last argument is the string on which operation will be performed.

Let's replace white spaces in the string with the hyphen (-) sign in the first element of the my_data variable.


```r
chartr(" ", "-", my_data[1])
```

```
## [1] "The-Artist-is-a-2011-French-romantic-comedy-drama-in-the-style-of-a-black-and-white-silent-film.-It-was-written,-directed,-and-co-edited-by-Michel-Hazanavicius,-produced-by-Thomas-Langmann-and-starred-Jean-Dujardin-and-BÃ©rÃ©nice-Bejo.-The-story-takes-place-in-Hollywood,-between-1927-and-1932,-and-focuses-on-the-relationship-of-an-older-silent-film-star-and-a-rising-young-actress-as-silent-cinema-falls-out-of-fashion-and-is-replaced-by-the-talkies."
```

# ``strsplit()``
Previously, we learned that we can read file word by word using scan() function. But what if we want to split the given string word by word?

This can be done using strsplit() method. Let's split the string according to the white spaces.

```e
character_list <- strsplit(my_data[1], " ")
my_word_list <- unlist(character_list)
my_word_list
```
In above code block, we separate the string word by word, but strsplit() method provides a list at the output which contains all the separated words as single element which is more complex to read. Thus, to make it more easy to read each word as single element, we used unlist() method which converts the list into character vector and now we can easily access each word as a single element.


# Coding Exercise

Coding Exercise: Replace the space characters in the 3rd element of my_data vector with underscore $\_$, then split the string by _



```r
new_third <- chartr(" ", "_", my_data[3])
new_third
```

```
## [1] "The_Artist_received_highly_positive_reviews_from_critics_and_won_many_accolades._Dujardin_won_the_Best_Actor_Award_at_the_2011_Cannes_Film_Festival,_where_the_film_premiered._The_film_was_nominated_for_six_Golden_Globes,_the_most_of_any_2011_film,_and_won_three:_Best_Motion_Picture_â\200“_Musical_or_Comedy,_Best_Original_Score,_and_Best_Actor_â\200“_Motion_Picture_Musical_or_Comedy_for_Dujardin._In_January_2012,_the_film_was_nominated_for_twelve_BAFTAs,_the_most_of_any_film_from_2011_and_won_seven,_including_Best_Film,_Best_Director_and_Best_Original_Screenplay_for_Hazanavicius,_and_Best_Actor_for_Dujardin."
```

```r
character_list <- strsplit(new_third, "_")
my_word_list <- unlist(character_list)
my_word_list
```

```
##   [1] "The"           "Artist"        "received"      "highly"       
##   [5] "positive"      "reviews"       "from"          "critics"      
##   [9] "and"           "won"           "many"          "accolades."   
##  [13] "Dujardin"      "won"           "the"           "Best"         
##  [17] "Actor"         "Award"         "at"            "the"          
##  [21] "2011"          "Cannes"        "Film"          "Festival,"    
##  [25] "where"         "the"           "film"          "premiered."   
##  [29] "The"           "film"          "was"           "nominated"    
##  [33] "for"           "six"           "Golden"        "Globes,"      
##  [37] "the"           "most"          "of"            "any"          
##  [41] "2011"          "film,"         "and"           "won"          
##  [45] "three:"        "Best"          "Motion"        "Picture"      
##  [49] "â\200“"           "Musical"       "or"            "Comedy,"      
##  [53] "Best"          "Original"      "Score,"        "and"          
##  [57] "Best"          "Actor"         "â\200“"           "Motion"       
##  [61] "Picture"       "Musical"       "or"            "Comedy"       
##  [65] "for"           "Dujardin."     "In"            "January"      
##  [69] "2012,"         "the"           "film"          "was"          
##  [73] "nominated"     "for"           "twelve"        "BAFTAs,"      
##  [77] "the"           "most"          "of"            "any"          
##  [81] "film"          "from"          "2011"          "and"          
##  [85] "won"           "seven,"        "including"     "Best"         
##  [89] "Film,"         "Best"          "Director"      "and"          
##  [93] "Best"          "Original"      "Screenplay"    "for"          
##  [97] "Hazanavicius," "and"           "Best"          "Actor"        
## [101] "for"           "Dujardin."
```

# ``sort()``
Sorting is also possible in R. Let's use sort() method to sort elements of the my_word_list character vector in ascending order.

my_sorted_list <- sort(my_word_list)
my_sorted_list

# ``paste()``
Now, we sort all the elements of my_word_list character vector. Let's use ``paste()`` function here, which is used to concatenate strings. This method takes two arguments, the strings we want to concatenate and collapse argument which defines the separator in the words.

Here, we are going to concatenate all words of my_sorted_list character vector into a single string.

paste(my_sorted_list, collapse = " ")

# ``substr()``
There is another function substr() in R which is used to get a sub section of the string.

Let's take an example to understand it more. In example below, we use the ``substr()`` method and provide it three arguments. First argument is the data string from which we want the sub string. Second argument is the starting point from where function will start reading the string and the third argument is the stopping point till where we want the function to read string.

my_sub_string <- substr(my_data[1], start = 4, stop = 50)
my_sub_string
So, from the character vector, we start reading the first element from 4th position and read the string till 50th position and at the output, we get the resulted string which we stored in my_sub_string variable.

# ``trimws()``
As the sub string that we get in code block above, have some white spaces at the initial and end points. So, to quickly remove them, we can use trimws() method of R like shown below.

trimws(my_sub_string)
So, at the output, we get the string which does not contain any white spaces at the both ends.

# ``str_sub()``
To read string from last, we are using stringr library. This library contains ``str_sub()`` method, which takes same arguments as sub_stirng method but read string from last.

Like in the example below, we provide a data string and both starting and end points with negative values which indicates that we are reading string from last.


```r
library(stringr)
str_sub(my_data[1], -8, -1)
```

```
## [1] "talkies."
```
So, we read string from -1 till -8 and it gives talkies. with full stop mark at the output.
