\name{ps_listidentifiers}
\alias{ps_listidentifiers}
\title{Gets all OAI Pensoft identifiers.}
\usage{
  ps_listidentifiers(tor = "r", set = "zookeys",
    metadataPrefix = "oai_dc", num = 10,
    verb = "ListIdentifiers", from = NA,
    url = "http://oai.pensoft.eu", ...,
    curl = getCurlHandle())
}
\arguments{
  \item{tor}{Return list of identifiers to R ('r'), or to
  your directory at '~/.' ('dir') (character).}

  \item{set}{journal, one of
  'zookeys','biorisk','phytokeys','neobiota',
  'jhr','ijm','compcytogen','subtbiol','natureconservation','mycokeys'}

  \item{metadataPrefix}{one of 'oai_dc' or 'mods'}

  \item{num}{number of identifiers to return (defaults to
  10), or 'all' to download the complete set of
  identifiers}

  \item{url}{the base url for the function (should be left
  to default).}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  List of OAI identifiers for each dataset.
}
\description{
  Gets all OAI Pensoft identifiers.
}
\examples{
\dontrun{
identifiers <- ps_listidentifiers(from = '2012-03-10')
ps_listidentifiers
}
}

