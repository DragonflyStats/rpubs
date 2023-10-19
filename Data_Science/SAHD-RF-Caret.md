

```R
## install randomForest Package
```


```R
install.packages("randomForest")
```

    Installing package into ‘/home/nbuser/R’
    (as ‘lib’ is unspecified)



```R
library(randomForest)
```

    randomForest 4.6-14
    Type rfNews() to see new features/changes/bug fixes.



```R
install.packages("ElemStatLearn")
```

    Installing package into ‘/home/nbuser/R’
    (as ‘lib’ is unspecified)



```R
library(ElemStatLearn)
data(SAheart )
```


```R
help(SAheart)
```


```R
head(SAheart)
```


<table>
<thead><tr><th>sbp</th><th>tobacco</th><th>ldl</th><th>adiposity</th><th>famhist</th><th>typea</th><th>obesity</th><th>alcohol</th><th>age</th><th>chd</th></tr></thead>
<tbody>
	<tr><td>160    </td><td>12.00  </td><td>5.73   </td><td>23.11  </td><td>Present</td><td>49     </td><td>25.30  </td><td>97.20  </td><td>52     </td><td>1      </td></tr>
	<tr><td>144    </td><td> 0.01  </td><td>4.41   </td><td>28.61  </td><td>Absent </td><td>55     </td><td>28.87  </td><td> 2.06  </td><td>63     </td><td>1      </td></tr>
	<tr><td>118    </td><td> 0.08  </td><td>3.48   </td><td>32.28  </td><td>Present</td><td>52     </td><td>29.14  </td><td> 3.81  </td><td>46     </td><td>0      </td></tr>
	<tr><td>170    </td><td> 7.50  </td><td>6.41   </td><td>38.03  </td><td>Present</td><td>51     </td><td>31.99  </td><td>24.26  </td><td>58     </td><td>1      </td></tr>
	<tr><td>134    </td><td>13.60  </td><td>3.50   </td><td>27.78  </td><td>Present</td><td>60     </td><td>25.99  </td><td>57.34  </td><td>49     </td><td>1      </td></tr>
	<tr><td>132    </td><td> 6.20  </td><td>6.47   </td><td>36.21  </td><td>Present</td><td>62     </td><td>30.77  </td><td>14.14  </td><td>45     </td><td>0      </td></tr>
</tbody>
</table>




```R
SAglm <- glm(chd~.,data=SAheart,family=binomial)
summary(SAglm)
```


    
    Call:
    glm(formula = chd ~ ., family = binomial, data = SAheart)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.7781  -0.8213  -0.4387   0.8889   2.5435  
    
    Coefficients:
                     Estimate Std. Error z value Pr(>|z|)    
    (Intercept)    -6.1507209  1.3082600  -4.701 2.58e-06 ***
    sbp             0.0065040  0.0057304   1.135 0.256374    
    tobacco         0.0793764  0.0266028   2.984 0.002847 ** 
    ldl             0.1739239  0.0596617   2.915 0.003555 ** 
    adiposity       0.0185866  0.0292894   0.635 0.525700    
    famhistPresent  0.9253704  0.2278940   4.061 4.90e-05 ***
    typea           0.0395950  0.0123202   3.214 0.001310 ** 
    obesity        -0.0629099  0.0442477  -1.422 0.155095    
    alcohol         0.0001217  0.0044832   0.027 0.978350    
    age             0.0452253  0.0121298   3.728 0.000193 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 596.11  on 461  degrees of freedom
    Residual deviance: 472.14  on 452  degrees of freedom
    AIC: 492.14
    
    Number of Fisher Scoring iterations: 5




```R
SAHD <- glm(chd~age+ldl+typea+tobacco,data=SAheart,family=binomial)
summary(SAHD)
```


    
    Call:
    glm(formula = chd ~ age + ldl + typea + tobacco, family = binomial, 
        data = SAheart)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -2.0444  -0.8718  -0.4645   0.9741   2.5118  
    
    Coefficients:
                 Estimate Std. Error z value Pr(>|z|)    
    (Intercept) -6.334452   0.897809  -7.055 1.72e-12 ***
    age          0.055040   0.009948   5.533 3.15e-08 ***
    ldl          0.179891   0.055027   3.269  0.00108 ** 
    typea        0.037914   0.011885   3.190  0.00142 ** 
    tobacco      0.075031   0.025699   2.920  0.00350 ** 
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 596.11  on 461  degrees of freedom
    Residual deviance: 492.09  on 457  degrees of freedom
    AIC: 502.09
    
    Number of Fisher Scoring iterations: 4




```R
prediction <- floor(2*predict(SAHD,SAheart,type="response"))
```


```R
coef(SAHD)
```


<dl class="dl-horizontal">
	<dt>(Intercept)</dt>
		<dd>-6.33445206198199</dd>
	<dt>age</dt>
		<dd>0.0550401684873124</dd>
	<dt>ldl</dt>
		<dd>0.179890515018726</dd>
	<dt>typea</dt>
		<dd>0.0379144104974741</dd>
	<dt>tobacco</dt>
		<dd>0.0750312929675156</dd>
</dl>




```R
case1 <- c(1,50,02,1,1)
```


```R
exp(sum(coef(SAHD)*case1))
```


0.0446135834746485



```R
table(prediction,SAheart$chd)
```


              
    prediction   0   1
             0 260  85
             1  42  75



```R
summary(SAheart)
```


          sbp           tobacco             ldl           adiposity    
     Min.   :101.0   Min.   : 0.0000   Min.   : 0.980   Min.   : 6.74  
     1st Qu.:124.0   1st Qu.: 0.0525   1st Qu.: 3.283   1st Qu.:19.77  
     Median :134.0   Median : 2.0000   Median : 4.340   Median :26.11  
     Mean   :138.3   Mean   : 3.6356   Mean   : 4.740   Mean   :25.41  
     3rd Qu.:148.0   3rd Qu.: 5.5000   3rd Qu.: 5.790   3rd Qu.:31.23  
     Max.   :218.0   Max.   :31.2000   Max.   :15.330   Max.   :42.49  
        famhist        typea         obesity         alcohol            age       
     Absent :270   Min.   :13.0   Min.   :14.70   Min.   :  0.00   Min.   :15.00  
     Present:192   1st Qu.:47.0   1st Qu.:22.98   1st Qu.:  0.51   1st Qu.:31.00  
                   Median :53.0   Median :25.80   Median :  7.51   Median :45.00  
                   Mean   :53.1   Mean   :26.04   Mean   : 17.04   Mean   :42.82  
                   3rd Qu.:60.0   3rd Qu.:28.50   3rd Qu.: 23.89   3rd Qu.:55.00  
                   Max.   :78.0   Max.   :46.58   Max.   :147.19   Max.   :64.00  
          chd        
     Min.   :0.0000  
     1st Qu.:0.0000  
     Median :0.0000  
     Mean   :0.3463  
     3rd Qu.:1.0000  
     Max.   :1.0000  



```R
SARF <- randomForest(chd~.,data=SAheart)
```

    Warning message in randomForest.default(m, y, ...):
    “The response has five or fewer unique values.  Are you sure you want to do regression?”


```R
library(dplyr)
glimpse(SAheart)
```

    
    Attaching package: ‘dplyr’
    
    The following object is masked from ‘package:randomForest’:
    
        combine
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    


    Observations: 462
    Variables: 10
    $ sbp       <int> 160, 144, 118, 170, 134, 132, 142, 114, 114, 132, 206, 13...
    $ tobacco   <dbl> 12.00, 0.01, 0.08, 7.50, 13.60, 6.20, 4.05, 4.08, 0.00, 0...
    $ ldl       <dbl> 5.73, 4.41, 3.48, 6.41, 3.50, 6.47, 3.38, 4.59, 3.83, 5.8...
    $ adiposity <dbl> 23.11, 28.61, 32.28, 38.03, 27.78, 36.21, 16.20, 14.60, 1...
    $ famhist   <fct> Present, Absent, Present, Present, Present, Present, Abse...
    $ typea     <int> 49, 55, 52, 51, 60, 62, 59, 62, 49, 69, 72, 65, 59, 49, 5...
    $ obesity   <dbl> 25.30, 28.87, 29.14, 31.99, 25.99, 30.77, 20.81, 23.11, 2...
    $ alcohol   <dbl> 97.20, 2.06, 3.81, 24.26, 57.34, 14.14, 2.62, 6.72, 2.49,...
    $ age       <int> 52, 63, 46, 58, 49, 45, 38, 58, 29, 53, 60, 40, 17, 15, 5...
    $ chd       <int> 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, ...



```R
SARF <- randomForest(factor(chd)~.,data=SAheart)
```


```R
predict(SARF)
```


<dl class="dl-horizontal">
	<dt>1</dt>
		<dd>1</dd>
	<dt>2</dt>
		<dd>0</dd>
	<dt>3</dt>
		<dd>0</dd>
	<dt>4</dt>
		<dd>1</dd>
	<dt>5</dt>
		<dd>0</dd>
	<dt>6</dt>
		<dd>1</dd>
	<dt>7</dt>
		<dd>0</dd>
	<dt>8</dt>
		<dd>0</dd>
	<dt>9</dt>
		<dd>0</dd>
	<dt>10</dt>
		<dd>1</dd>
	<dt>11</dt>
		<dd>1</dd>
	<dt>12</dt>
		<dd>0</dd>
	<dt>13</dt>
		<dd>0</dd>
	<dt>14</dt>
		<dd>0</dd>
	<dt>15</dt>
		<dd>1</dd>
	<dt>16</dt>
		<dd>0</dd>
	<dt>17</dt>
		<dd>0</dd>
	<dt>18</dt>
		<dd>1</dd>
	<dt>19</dt>
		<dd>1</dd>
	<dt>20</dt>
		<dd>1</dd>
	<dt>21</dt>
		<dd>0</dd>
	<dt>22</dt>
		<dd>0</dd>
	<dt>23</dt>
		<dd>1</dd>
	<dt>24</dt>
		<dd>0</dd>
	<dt>25</dt>
		<dd>1</dd>
	<dt>26</dt>
		<dd>0</dd>
	<dt>27</dt>
		<dd>0</dd>
	<dt>28</dt>
		<dd>1</dd>
	<dt>29</dt>
		<dd>1</dd>
	<dt>30</dt>
		<dd>1</dd>
	<dt>31</dt>
		<dd>0</dd>
	<dt>32</dt>
		<dd>0</dd>
	<dt>33</dt>
		<dd>1</dd>
	<dt>34</dt>
		<dd>0</dd>
	<dt>35</dt>
		<dd>0</dd>
	<dt>36</dt>
		<dd>0</dd>
	<dt>37</dt>
		<dd>0</dd>
	<dt>38</dt>
		<dd>0</dd>
	<dt>39</dt>
		<dd>0</dd>
	<dt>40</dt>
		<dd>1</dd>
	<dt>41</dt>
		<dd>0</dd>
	<dt>42</dt>
		<dd>0</dd>
	<dt>43</dt>
		<dd>0</dd>
	<dt>44</dt>
		<dd>0</dd>
	<dt>45</dt>
		<dd>0</dd>
	<dt>46</dt>
		<dd>0</dd>
	<dt>47</dt>
		<dd>1</dd>
	<dt>48</dt>
		<dd>0</dd>
	<dt>49</dt>
		<dd>0</dd>
	<dt>50</dt>
		<dd>0</dd>
	<dt>51</dt>
		<dd>0</dd>
	<dt>52</dt>
		<dd>0</dd>
	<dt>53</dt>
		<dd>0</dd>
	<dt>54</dt>
		<dd>0</dd>
	<dt>55</dt>
		<dd>0</dd>
	<dt>56</dt>
		<dd>0</dd>
	<dt>57</dt>
		<dd>0</dd>
	<dt>58</dt>
		<dd>0</dd>
	<dt>59</dt>
		<dd>0</dd>
	<dt>60</dt>
		<dd>1</dd>
	<dt>61</dt>
		<dd>0</dd>
	<dt>62</dt>
		<dd>0</dd>
	<dt>63</dt>
		<dd>1</dd>
	<dt>64</dt>
		<dd>0</dd>
	<dt>65</dt>
		<dd>0</dd>
	<dt>66</dt>
		<dd>1</dd>
	<dt>67</dt>
		<dd>0</dd>
	<dt>68</dt>
		<dd>0</dd>
	<dt>69</dt>
		<dd>1</dd>
	<dt>70</dt>
		<dd>0</dd>
	<dt>71</dt>
		<dd>0</dd>
	<dt>72</dt>
		<dd>0</dd>
	<dt>73</dt>
		<dd>0</dd>
	<dt>74</dt>
		<dd>0</dd>
	<dt>75</dt>
		<dd>0</dd>
	<dt>76</dt>
		<dd>0</dd>
	<dt>77</dt>
		<dd>0</dd>
	<dt>78</dt>
		<dd>0</dd>
	<dt>79</dt>
		<dd>0</dd>
	<dt>80</dt>
		<dd>1</dd>
	<dt>81</dt>
		<dd>0</dd>
	<dt>82</dt>
		<dd>1</dd>
	<dt>83</dt>
		<dd>1</dd>
	<dt>84</dt>
		<dd>0</dd>
	<dt>85</dt>
		<dd>0</dd>
	<dt>86</dt>
		<dd>0</dd>
	<dt>87</dt>
		<dd>1</dd>
	<dt>88</dt>
		<dd>0</dd>
	<dt>89</dt>
		<dd>0</dd>
	<dt>90</dt>
		<dd>0</dd>
	<dt>91</dt>
		<dd>0</dd>
	<dt>92</dt>
		<dd>0</dd>
	<dt>93</dt>
		<dd>0</dd>
	<dt>94</dt>
		<dd>0</dd>
	<dt>95</dt>
		<dd>0</dd>
	<dt>96</dt>
		<dd>0</dd>
	<dt>97</dt>
		<dd>0</dd>
	<dt>98</dt>
		<dd>0</dd>
	<dt>99</dt>
		<dd>1</dd>
	<dt>100</dt>
		<dd>1</dd>
	<dt>101</dt>
		<dd>1</dd>
	<dt>102</dt>
		<dd>0</dd>
	<dt>103</dt>
		<dd>0</dd>
	<dt>104</dt>
		<dd>0</dd>
	<dt>105</dt>
		<dd>0</dd>
	<dt>106</dt>
		<dd>1</dd>
	<dt>107</dt>
		<dd>0</dd>
	<dt>108</dt>
		<dd>1</dd>
	<dt>109</dt>
		<dd>0</dd>
	<dt>110</dt>
		<dd>0</dd>
	<dt>111</dt>
		<dd>0</dd>
	<dt>112</dt>
		<dd>1</dd>
	<dt>113</dt>
		<dd>0</dd>
	<dt>114</dt>
		<dd>0</dd>
	<dt>115</dt>
		<dd>1</dd>
	<dt>116</dt>
		<dd>1</dd>
	<dt>117</dt>
		<dd>0</dd>
	<dt>118</dt>
		<dd>0</dd>
	<dt>119</dt>
		<dd>1</dd>
	<dt>120</dt>
		<dd>0</dd>
	<dt>121</dt>
		<dd>0</dd>
	<dt>122</dt>
		<dd>0</dd>
	<dt>123</dt>
		<dd>0</dd>
	<dt>124</dt>
		<dd>0</dd>
	<dt>125</dt>
		<dd>0</dd>
	<dt>126</dt>
		<dd>1</dd>
	<dt>127</dt>
		<dd>0</dd>
	<dt>128</dt>
		<dd>0</dd>
	<dt>129</dt>
		<dd>0</dd>
	<dt>130</dt>
		<dd>1</dd>
	<dt>131</dt>
		<dd>1</dd>
	<dt>132</dt>
		<dd>0</dd>
	<dt>133</dt>
		<dd>0</dd>
	<dt>134</dt>
		<dd>0</dd>
	<dt>135</dt>
		<dd>0</dd>
	<dt>136</dt>
		<dd>1</dd>
	<dt>137</dt>
		<dd>0</dd>
	<dt>138</dt>
		<dd>0</dd>
	<dt>139</dt>
		<dd>0</dd>
	<dt>140</dt>
		<dd>0</dd>
	<dt>141</dt>
		<dd>1</dd>
	<dt>142</dt>
		<dd>0</dd>
	<dt>143</dt>
		<dd>0</dd>
	<dt>144</dt>
		<dd>1</dd>
	<dt>145</dt>
		<dd>0</dd>
	<dt>146</dt>
		<dd>0</dd>
	<dt>147</dt>
		<dd>0</dd>
	<dt>148</dt>
		<dd>0</dd>
	<dt>149</dt>
		<dd>0</dd>
	<dt>150</dt>
		<dd>1</dd>
	<dt>151</dt>
		<dd>0</dd>
	<dt>152</dt>
		<dd>0</dd>
	<dt>153</dt>
		<dd>0</dd>
	<dt>154</dt>
		<dd>0</dd>
	<dt>155</dt>
		<dd>0</dd>
	<dt>156</dt>
		<dd>1</dd>
	<dt>157</dt>
		<dd>0</dd>
	<dt>158</dt>
		<dd>1</dd>
	<dt>159</dt>
		<dd>0</dd>
	<dt>160</dt>
		<dd>0</dd>
	<dt>161</dt>
		<dd>0</dd>
	<dt>162</dt>
		<dd>1</dd>
	<dt>163</dt>
		<dd>0</dd>
	<dt>164</dt>
		<dd>0</dd>
	<dt>165</dt>
		<dd>0</dd>
	<dt>166</dt>
		<dd>1</dd>
	<dt>167</dt>
		<dd>0</dd>
	<dt>168</dt>
		<dd>0</dd>
	<dt>169</dt>
		<dd>0</dd>
	<dt>170</dt>
		<dd>1</dd>
	<dt>171</dt>
		<dd>1</dd>
	<dt>172</dt>
		<dd>0</dd>
	<dt>173</dt>
		<dd>0</dd>
	<dt>174</dt>
		<dd>0</dd>
	<dt>175</dt>
		<dd>0</dd>
	<dt>176</dt>
		<dd>0</dd>
	<dt>177</dt>
		<dd>0</dd>
	<dt>178</dt>
		<dd>0</dd>
	<dt>179</dt>
		<dd>0</dd>
	<dt>180</dt>
		<dd>1</dd>
	<dt>181</dt>
		<dd>0</dd>
	<dt>182</dt>
		<dd>1</dd>
	<dt>183</dt>
		<dd>1</dd>
	<dt>184</dt>
		<dd>0</dd>
	<dt>185</dt>
		<dd>0</dd>
	<dt>186</dt>
		<dd>0</dd>
	<dt>187</dt>
		<dd>1</dd>
	<dt>188</dt>
		<dd>0</dd>
	<dt>189</dt>
		<dd>1</dd>
	<dt>190</dt>
		<dd>0</dd>
	<dt>191</dt>
		<dd>0</dd>
	<dt>192</dt>
		<dd>1</dd>
	<dt>193</dt>
		<dd>0</dd>
	<dt>194</dt>
		<dd>0</dd>
	<dt>195</dt>
		<dd>0</dd>
	<dt>196</dt>
		<dd>0</dd>
	<dt>197</dt>
		<dd>0</dd>
	<dt>198</dt>
		<dd>0</dd>
	<dt>199</dt>
		<dd>1</dd>
	<dt>200</dt>
		<dd>0</dd>
	<dt>201</dt>
		<dd>0</dd>
	<dt>202</dt>
		<dd>0</dd>
	<dt>203</dt>
		<dd>0</dd>
	<dt>204</dt>
		<dd>0</dd>
	<dt>205</dt>
		<dd>1</dd>
	<dt>206</dt>
		<dd>0</dd>
	<dt>207</dt>
		<dd>0</dd>
	<dt>208</dt>
		<dd>1</dd>
	<dt>209</dt>
		<dd>0</dd>
	<dt>210</dt>
		<dd>1</dd>
	<dt>211</dt>
		<dd>0</dd>
	<dt>212</dt>
		<dd>1</dd>
	<dt>213</dt>
		<dd>0</dd>
	<dt>214</dt>
		<dd>0</dd>
	<dt>215</dt>
		<dd>0</dd>
	<dt>216</dt>
		<dd>0</dd>
	<dt>217</dt>
		<dd>0</dd>
	<dt>218</dt>
		<dd>0</dd>
	<dt>219</dt>
		<dd>0</dd>
	<dt>220</dt>
		<dd>1</dd>
	<dt>221</dt>
		<dd>0</dd>
	<dt>222</dt>
		<dd>0</dd>
	<dt>223</dt>
		<dd>1</dd>
	<dt>224</dt>
		<dd>0</dd>
	<dt>225</dt>
		<dd>0</dd>
	<dt>226</dt>
		<dd>0</dd>
	<dt>227</dt>
		<dd>0</dd>
	<dt>228</dt>
		<dd>0</dd>
	<dt>229</dt>
		<dd>0</dd>
	<dt>230</dt>
		<dd>1</dd>
	<dt>231</dt>
		<dd>0</dd>
	<dt>232</dt>
		<dd>1</dd>
	<dt>233</dt>
		<dd>0</dd>
	<dt>234</dt>
		<dd>0</dd>
	<dt>235</dt>
		<dd>0</dd>
	<dt>236</dt>
		<dd>0</dd>
	<dt>237</dt>
		<dd>0</dd>
	<dt>238</dt>
		<dd>1</dd>
	<dt>239</dt>
		<dd>0</dd>
	<dt>240</dt>
		<dd>0</dd>
	<dt>241</dt>
		<dd>0</dd>
	<dt>242</dt>
		<dd>0</dd>
	<dt>243</dt>
		<dd>0</dd>
	<dt>244</dt>
		<dd>1</dd>
	<dt>245</dt>
		<dd>1</dd>
	<dt>246</dt>
		<dd>0</dd>
	<dt>247</dt>
		<dd>0</dd>
	<dt>248</dt>
		<dd>1</dd>
	<dt>249</dt>
		<dd>0</dd>
	<dt>250</dt>
		<dd>1</dd>
	<dt>251</dt>
		<dd>0</dd>
	<dt>252</dt>
		<dd>0</dd>
	<dt>253</dt>
		<dd>0</dd>
	<dt>254</dt>
		<dd>1</dd>
	<dt>255</dt>
		<dd>1</dd>
	<dt>256</dt>
		<dd>1</dd>
	<dt>257</dt>
		<dd>0</dd>
	<dt>258</dt>
		<dd>0</dd>
	<dt>259</dt>
		<dd>1</dd>
	<dt>260</dt>
		<dd>1</dd>
	<dt>261</dt>
		<dd>0</dd>
	<dt>263</dt>
		<dd>0</dd>
	<dt>264</dt>
		<dd>0</dd>
	<dt>265</dt>
		<dd>0</dd>
	<dt>266</dt>
		<dd>1</dd>
	<dt>267</dt>
		<dd>0</dd>
	<dt>268</dt>
		<dd>0</dd>
	<dt>269</dt>
		<dd>1</dd>
	<dt>270</dt>
		<dd>0</dd>
	<dt>271</dt>
		<dd>0</dd>
	<dt>272</dt>
		<dd>0</dd>
	<dt>273</dt>
		<dd>0</dd>
	<dt>274</dt>
		<dd>0</dd>
	<dt>275</dt>
		<dd>0</dd>
	<dt>276</dt>
		<dd>0</dd>
	<dt>277</dt>
		<dd>1</dd>
	<dt>278</dt>
		<dd>1</dd>
	<dt>279</dt>
		<dd>0</dd>
	<dt>280</dt>
		<dd>0</dd>
	<dt>281</dt>
		<dd>0</dd>
	<dt>282</dt>
		<dd>0</dd>
	<dt>283</dt>
		<dd>0</dd>
	<dt>284</dt>
		<dd>1</dd>
	<dt>285</dt>
		<dd>0</dd>
	<dt>286</dt>
		<dd>1</dd>
	<dt>287</dt>
		<dd>0</dd>
	<dt>288</dt>
		<dd>0</dd>
	<dt>289</dt>
		<dd>0</dd>
	<dt>290</dt>
		<dd>0</dd>
	<dt>291</dt>
		<dd>0</dd>
	<dt>292</dt>
		<dd>0</dd>
	<dt>293</dt>
		<dd>0</dd>
	<dt>294</dt>
		<dd>0</dd>
	<dt>295</dt>
		<dd>1</dd>
	<dt>296</dt>
		<dd>0</dd>
	<dt>297</dt>
		<dd>0</dd>
	<dt>298</dt>
		<dd>0</dd>
	<dt>299</dt>
		<dd>0</dd>
	<dt>300</dt>
		<dd>0</dd>
	<dt>301</dt>
		<dd>0</dd>
	<dt>302</dt>
		<dd>0</dd>
	<dt>303</dt>
		<dd>0</dd>
	<dt>304</dt>
		<dd>0</dd>
	<dt>305</dt>
		<dd>1</dd>
	<dt>306</dt>
		<dd>0</dd>
	<dt>307</dt>
		<dd>0</dd>
	<dt>308</dt>
		<dd>1</dd>
	<dt>309</dt>
		<dd>0</dd>
	<dt>310</dt>
		<dd>0</dd>
	<dt>311</dt>
		<dd>0</dd>
	<dt>312</dt>
		<dd>1</dd>
	<dt>313</dt>
		<dd>0</dd>
	<dt>314</dt>
		<dd>0</dd>
	<dt>315</dt>
		<dd>0</dd>
	<dt>316</dt>
		<dd>0</dd>
	<dt>317</dt>
		<dd>0</dd>
	<dt>318</dt>
		<dd>0</dd>
	<dt>319</dt>
		<dd>0</dd>
	<dt>320</dt>
		<dd>1</dd>
	<dt>321</dt>
		<dd>0</dd>
	<dt>322</dt>
		<dd>0</dd>
	<dt>323</dt>
		<dd>0</dd>
	<dt>324</dt>
		<dd>0</dd>
	<dt>325</dt>
		<dd>0</dd>
	<dt>326</dt>
		<dd>0</dd>
	<dt>327</dt>
		<dd>0</dd>
	<dt>328</dt>
		<dd>0</dd>
	<dt>329</dt>
		<dd>0</dd>
	<dt>330</dt>
		<dd>0</dd>
	<dt>331</dt>
		<dd>0</dd>
	<dt>332</dt>
		<dd>0</dd>
	<dt>333</dt>
		<dd>0</dd>
	<dt>334</dt>
		<dd>1</dd>
	<dt>335</dt>
		<dd>0</dd>
	<dt>336</dt>
		<dd>0</dd>
	<dt>337</dt>
		<dd>0</dd>
	<dt>338</dt>
		<dd>0</dd>
	<dt>339</dt>
		<dd>0</dd>
	<dt>340</dt>
		<dd>0</dd>
	<dt>341</dt>
		<dd>0</dd>
	<dt>342</dt>
		<dd>0</dd>
	<dt>343</dt>
		<dd>1</dd>
	<dt>344</dt>
		<dd>1</dd>
	<dt>345</dt>
		<dd>0</dd>
	<dt>346</dt>
		<dd>0</dd>
	<dt>347</dt>
		<dd>0</dd>
	<dt>348</dt>
		<dd>0</dd>
	<dt>349</dt>
		<dd>0</dd>
	<dt>350</dt>
		<dd>0</dd>
	<dt>351</dt>
		<dd>0</dd>
	<dt>352</dt>
		<dd>0</dd>
	<dt>353</dt>
		<dd>0</dd>
	<dt>354</dt>
		<dd>1</dd>
	<dt>355</dt>
		<dd>1</dd>
	<dt>356</dt>
		<dd>1</dd>
	<dt>357</dt>
		<dd>0</dd>
	<dt>358</dt>
		<dd>0</dd>
	<dt>359</dt>
		<dd>0</dd>
	<dt>360</dt>
		<dd>0</dd>
	<dt>361</dt>
		<dd>0</dd>
	<dt>362</dt>
		<dd>1</dd>
	<dt>363</dt>
		<dd>0</dd>
	<dt>364</dt>
		<dd>0</dd>
	<dt>365</dt>
		<dd>0</dd>
	<dt>366</dt>
		<dd>1</dd>
	<dt>367</dt>
		<dd>0</dd>
	<dt>368</dt>
		<dd>0</dd>
	<dt>369</dt>
		<dd>0</dd>
	<dt>370</dt>
		<dd>0</dd>
	<dt>371</dt>
		<dd>0</dd>
	<dt>372</dt>
		<dd>1</dd>
	<dt>373</dt>
		<dd>1</dd>
	<dt>374</dt>
		<dd>0</dd>
	<dt>375</dt>
		<dd>1</dd>
	<dt>376</dt>
		<dd>0</dd>
	<dt>377</dt>
		<dd>0</dd>
	<dt>378</dt>
		<dd>0</dd>
	<dt>379</dt>
		<dd>0</dd>
	<dt>380</dt>
		<dd>0</dd>
	<dt>381</dt>
		<dd>1</dd>
	<dt>382</dt>
		<dd>0</dd>
	<dt>383</dt>
		<dd>0</dd>
	<dt>384</dt>
		<dd>1</dd>
	<dt>385</dt>
		<dd>0</dd>
	<dt>386</dt>
		<dd>0</dd>
	<dt>387</dt>
		<dd>1</dd>
	<dt>388</dt>
		<dd>0</dd>
	<dt>389</dt>
		<dd>0</dd>
	<dt>390</dt>
		<dd>0</dd>
	<dt>391</dt>
		<dd>0</dd>
	<dt>392</dt>
		<dd>0</dd>
	<dt>393</dt>
		<dd>0</dd>
	<dt>394</dt>
		<dd>0</dd>
	<dt>395</dt>
		<dd>0</dd>
	<dt>396</dt>
		<dd>1</dd>
	<dt>397</dt>
		<dd>0</dd>
	<dt>398</dt>
		<dd>1</dd>
	<dt>399</dt>
		<dd>0</dd>
	<dt>400</dt>
		<dd>1</dd>
	<dt>401</dt>
		<dd>0</dd>
	<dt>402</dt>
		<dd>0</dd>
	<dt>403</dt>
		<dd>0</dd>
	<dt>404</dt>
		<dd>1</dd>
	<dt>405</dt>
		<dd>1</dd>
	<dt>406</dt>
		<dd>1</dd>
	<dt>407</dt>
		<dd>1</dd>
	<dt>408</dt>
		<dd>1</dd>
	<dt>409</dt>
		<dd>1</dd>
	<dt>410</dt>
		<dd>0</dd>
	<dt>411</dt>
		<dd>0</dd>
	<dt>412</dt>
		<dd>0</dd>
	<dt>413</dt>
		<dd>0</dd>
	<dt>414</dt>
		<dd>1</dd>
	<dt>415</dt>
		<dd>1</dd>
	<dt>416</dt>
		<dd>0</dd>
	<dt>417</dt>
		<dd>0</dd>
	<dt>418</dt>
		<dd>1</dd>
	<dt>419</dt>
		<dd>0</dd>
	<dt>420</dt>
		<dd>0</dd>
	<dt>421</dt>
		<dd>0</dd>
	<dt>422</dt>
		<dd>0</dd>
	<dt>423</dt>
		<dd>0</dd>
	<dt>424</dt>
		<dd>1</dd>
	<dt>425</dt>
		<dd>1</dd>
	<dt>426</dt>
		<dd>0</dd>
	<dt>427</dt>
		<dd>0</dd>
	<dt>428</dt>
		<dd>1</dd>
	<dt>429</dt>
		<dd>0</dd>
	<dt>430</dt>
		<dd>0</dd>
	<dt>431</dt>
		<dd>0</dd>
	<dt>432</dt>
		<dd>0</dd>
	<dt>433</dt>
		<dd>0</dd>
	<dt>434</dt>
		<dd>0</dd>
	<dt>435</dt>
		<dd>0</dd>
	<dt>436</dt>
		<dd>0</dd>
	<dt>437</dt>
		<dd>0</dd>
	<dt>438</dt>
		<dd>0</dd>
	<dt>439</dt>
		<dd>0</dd>
	<dt>440</dt>
		<dd>0</dd>
	<dt>441</dt>
		<dd>0</dd>
	<dt>442</dt>
		<dd>0</dd>
	<dt>443</dt>
		<dd>0</dd>
	<dt>444</dt>
		<dd>0</dd>
	<dt>445</dt>
		<dd>0</dd>
	<dt>446</dt>
		<dd>0</dd>
	<dt>447</dt>
		<dd>0</dd>
	<dt>448</dt>
		<dd>0</dd>
	<dt>449</dt>
		<dd>0</dd>
	<dt>450</dt>
		<dd>0</dd>
	<dt>451</dt>
		<dd>0</dd>
	<dt>452</dt>
		<dd>0</dd>
	<dt>453</dt>
		<dd>0</dd>
	<dt>454</dt>
		<dd>0</dd>
	<dt>455</dt>
		<dd>1</dd>
	<dt>456</dt>
		<dd>0</dd>
	<dt>457</dt>
		<dd>0</dd>
	<dt>458</dt>
		<dd>1</dd>
	<dt>459</dt>
		<dd>1</dd>
	<dt>460</dt>
		<dd>0</dd>
	<dt>461</dt>
		<dd>0</dd>
	<dt>462</dt>
		<dd>0</dd>
	<dt>463</dt>
		<dd>0</dd>
</dl>

&lt;details&gt;
	<summary style="display: list-item; cursor: pointer;">
		<strong>Levels</strong>:
	</summary>
	<ol class="list-inline">
		<li>'0'</li>
		<li>'1'</li>
	</ol>
&lt;/details&gt;



```R
table(SAheart$chd,predict(SARF))
```


       
          0   1
      0 253  49
      1  94  66



```R
install.packages("caret")
```

    Installing package into ‘/home/nbuser/R’
    (as ‘lib’ is unspecified)
    also installing the dependencies ‘ddalpha’, ‘recipes’
    
    Warning message in install.packages("caret"):
    “installation of package ‘ddalpha’ had non-zero exit status”Warning message in install.packages("caret"):
    “installation of package ‘recipes’ had non-zero exit status”Warning message in install.packages("caret"):
    “installation of package ‘caret’ had non-zero exit status”


```R
library(caret)
data(SAheart)
Train <- createDataPartition(SAheart$chd, p=0.6, list=FALSE)
training <- SAheart[ Train, ]
testing <- SAheart[ -Train, ]



```


    Error in library(caret): there is no package called ‘caret’
    Traceback:


    1. library(caret)

    2. stop(txt, domain = NA)



```R
mod_fit <- train(factor(chd) ~ . ,  data=training, method="rf")


```


```R
str(SAheart)
```


```R
mod_fit
```


```R
importance(mod_fit)
```


```R

```
