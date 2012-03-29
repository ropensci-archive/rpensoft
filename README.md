# `rpensoft`

Install using install_github within Hadley's devtools package.

```R
install.packages("devtools")
require(devtools)
install_github("rpensoft", "ropensci")
require(rpensoft)
```

This set of functions/package will access full text articles from the PENSOFT journals using their API. 

No API key required.

The PENSOFT API uses the OAI-PMH interface. Documentation for OAI-PMH [here](http://www.openarchives.org/pmh/). PENSFOT API docs [here](http://www.pensoft.net/page.php?P=25&SESID=2dabd03da7cafb46901ab4147f20e920).