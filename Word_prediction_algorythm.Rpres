<style>
.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}
</style>
<style>
.footer {
    color: black; background: #77a8a8;
    position: fixed; top: 90%;
    text-align:left; width:100%;
}
</style>
<style>
body {
    background-color: #d9ecd0;
}
</style>
<style>
div#before-column p.forceBreak {
    break-before: column;
}
div#after-column p.forceBreak {
    break-after: column;
}
</style>

Next Word Prediction Algorithm
========================================================
author: Karl Eiholzer
date: 18 June 2017
autosize: true
css: word_predict.css
transition: fade

<div class="midcenter" style="margin-left:20px; margin-top:-50px;">
<img src="./Images/cover.png" style="background-color:transparent; border:0px; box-shadow:none;"></img>
</div>


The Challenge
========================================================
class: small-code

Build a Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.

- For the raw material, the challenge begins with a body of raw text typed into twitter, blogs, or new articles.
- By analyzing trends in the raw text data, thge application must be able to make predictions about what word the user intends to come next. 

For myself I added the goal that the App be modular and scalable, so that limitations of the initial draft can be more easily remedied with future builds. 

<div class="footer" style="margin-top:-225px;font-size:90%;">
&nbsp; &nbsp; Coursera Capstone Project - A Word Prdiction Application Using Shiny<br>
&nbsp; &nbsp; Created by <b>Karl Eiholzer</b>. &nbsp; &nbsp; See my <a href="https://www.linkedin.com/in/karleiholzer">LinkedIn Profile.</a></div>

Approach
========================================================
class: small-code

<big>“William the Conqueror, it is said, began by eating a mouthful of English sand.” </big> &nbsp; &nbsp;
<i>Salman Rushdie, The Satanic Verses</i>

- *Start Small* <br>
My first objective is to get an application running. Further refinement can be done once the scope of the work end-to-end is understood
<p class="forceBreak"></p>
- *Hunspell Package* <br>
 The Hunspell Package in R is spell checker and analyzer library that can check and analyze individual words as well as search for incorrect words within a text. The hunspell_parse() function was used to extract the ngrams from the text.  The hunspell_check() frunction was used to clean the words that would appear as predictions to ensure only real English words appear.
<p class="forceBreak"></p>
- *Bulk Data Sampling* <br>
  The processors and memory available to operate on large data sets was limited. The limitation was overcome by splitting the source text into over 4,000 files. Lines within the files were sampled repeatedly to create a large body of ngrams with counts equaling frequency. 



<div class="footer" style="margin-top:-225px;font-size:90%;">
&nbsp; &nbsp; Coursera Capstone Project - A Word Prdiction Application Using Shiny<br>
&nbsp; &nbsp; Created by <b>Karl Eiholzer</b>. &nbsp; &nbsp; See my <a href="https://www.linkedin.com/in/karleiholzer">LinkedIn Profile.</a></div>

The Application
========================================================
class: small-code

The final application was developed with the following features:
- The application is very simple: a text box and a response area, in keeping with our agile approach
- Additional cleaning of input is done to ensure a clean string is passed to the predictor function
- If the text requires cleaning, the revised text used for prediction is shown to the user, which also assists in development of the application
- The underlying data set is simple: an ngram, a predicted word, and a score

To access and use the application please visit <https://karl-eiholzer.shinyapps.io/data_science_capstone_app/>.

_NOTE: All source code can be found in <a href="https://github.com/Karl-Eiholzer/Capstone">my git repository</a>._



<div class="footer" style="margin-top:-225px;font-size:90%;">
&nbsp; &nbsp; Coursera Capstone Project - A Word Prdiction Application Using Shiny<br>
&nbsp; &nbsp; Created by <b>Karl Eiholzer</b>. &nbsp; &nbsp; See my <a href="https://www.linkedin.com/in/karleiholzer">LinkedIn Profile.</a></div>

Next Stages of Development
========================================================
type: exclaim

No first attempt is perfect and more resources are required to refine the application. The logical next steps would be:
- _More sophisticated scoring_: because the underlying data set is simple, scoring could be refined by updating the data file. That means work can be one to implement more refined scores (using statistical models) without constantly updating the app
- _Larger Sample Sets_: the sample data is very scalable. Sampling from larger sets of text can easily be incoproated into the existing structure for increased range of prediction (i.e., les common phrases will be included successfully).
- _Handling of Punctuation_: the methods used to clean the data did not handle the apostrophe character. This is a known bug that will need to be addressed. An alternative sampling method can append ngrams with apostrophes into the data set without losing any existing prediction power.


<div class="footer" style="margin-top:-225px;font-size:90%;">
&nbsp; &nbsp; Coursera Capstone Project - A Word Prdiction Application Using Shiny<br>
&nbsp; &nbsp; Created by <b>Karl Eiholzer</b>. &nbsp; &nbsp; See my <a href="https://www.linkedin.com/in/karleiholzer">LinkedIn Profile.</a></div>


