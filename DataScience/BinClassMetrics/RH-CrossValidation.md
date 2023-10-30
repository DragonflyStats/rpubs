Cross-​​validation is pri­mar­ily a way of mea­sur­ing the pre­dic­tive per­for­mance of a sta­tis­ti­cal model. Every sta­tis­ti­cian knows that the model fit sta­tis­tics are not a good guide to how well a model will pre­dict: high R^2 does not nec­es­sar­ily mean a good model. It is easy to over-​​fit the data by includ­ing too many degrees of free­dom and so inflate R^2 and other fit sta­tis­tics. For exam­ple, in a sim­ple poly­no­mial regres­sion I can just keep adding higher order terms and so get bet­ter and bet­ter fits to the data. But the pre­dic­tions from the model on new data will usu­ally get worse as higher order terms are added.

One way to mea­sure the pre­dic­tive abil­ity of a model is to test it on a set of data not used in esti­ma­tion. Data min­ers call this a “test set” and the data used for esti­ma­tion is the “train­ing set”. For exam­ple, the pre­dic­tive accu­racy of a model can be mea­sured by the mean squared error on the test set. This will gen­er­ally be larger than the MSE on the train­ing set because the test data were not used for estimation.

How­ever, there is often not enough data to allow some of it to be kept back for test­ing. A more sophis­ti­cated ver­sion of training/​​test sets is **leave-​​one-​​out cross-​​​​validation (LOOCV)** in which the accu­racy mea­sures are obtained as fol­lows. Sup­pose there are n inde­pen­dent obser­va­tions, y_1,\dots,y_n.

Let obser­va­tion i form the test set, and fit the model using the remain­ing data. Then com­pute the error (e_{i}^*=y_{i}-\hat{y}_{i}) for the omit­ted obser­va­tion. This is some­times called a “pre­dicted resid­ual” to dis­tin­guish it from an ordi­nary residual.
Repeat step 1 for i=1,\dots,n.
Com­pute the MSE from e_{1}^*,\dots,e_{n}^*. We shall call this the CV.
This is a much more effi­cient use of the avail­able data, as you only omit one obser­va­tion at each step. How­ever, it can be very time con­sum­ing to imple­ment (except for lin­ear mod­els — see below).

Other sta­tis­tics (e.g., the MAE) can be com­puted sim­i­larly. A related mea­sure is the PRESS sta­tis­tic (pre­dicted resid­ual sum of squares) equal to n\timesMSE.

#### variations
Vari­a­tions on cross-​​validation include leave-​​k-​​out cross-​​validation (in which k obser­va­tions are left out at each step) and k-​​fold cross-​​validation (where the orig­i­nal sam­ple is ran­domly par­ti­tioned into k sub­sam­ples and one is left out in each iter­a­tion). Another pop­u­lar vari­ant is the .632+bootstrap of Efron & Tib­shi­rani (1997) which has bet­ter prop­er­ties but is more com­pli­cated to implement.

Min­i­miz­ing a CV sta­tis­tic is a use­ful way to do model selec­tion such as choos­ing vari­ables in a regres­sion or choos­ing the degrees of free­dom of a non­para­met­ric smoother. It is cer­tainly far bet­ter than pro­ce­dures based on sta­tis­ti­cal tests and pro­vides a nearly unbi­ased mea­sure of the true MSE on new observations.

How­ever, as with any vari­able selec­tion pro­ce­dure, it can be mis­used. Beware of look­ing at sta­tis­ti­cal tests after select­ing vari­ables using cross-​​validation — the tests do not take account of the vari­able selec­tion that has taken place and so the p-​​values can mislead.

It is also impor­tant to realise that it doesn’t always work. For exam­ple, if there are exact dupli­cate obser­va­tions (i.e., two or more obser­va­tions with equal val­ues for all covari­ates and for the y vari­able) then leav­ing one obser­va­tion out will not be effective.

Another prob­lem is that a small change in the data can cause a large change in the model selected. Many authors have found that k-​​fold cross-​​validation works bet­ter in this respect.

In a famous paper, Shao (1993) showed that leave-​​one-​​out cross val­i­da­tion does not lead to a con­sis­tent esti­mate of the model. That is, if there is a true model, then LOOCV will not always find it, even with very large sam­ple sizes. In con­trast, cer­tain kinds of leave-​​k-​​out cross-​​validation, where k increases with n, will be con­sis­tent. Frankly, I don’t con­sider this is a very impor­tant result as there is never a true model. In real­ity, every model is wrong, so con­sis­tency is not really an inter­est­ing property.
