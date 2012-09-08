#' Gets all OAI Pensoft identifiers.
#' 
#' @import RCurl XML
#' @param tor Return list of identifiers to R ('r'), or to your directory
#'    at '~/.' ('dir') (character).
#' @param set journal, one of 'zookeys','biorisk','phytokeys','neobiota',
#'    'jhr','ijm','compcytogen','subtbiol','natureconservation','mycokeys'
#' @param metadataPrefix one of 'oai_dc' or 'mods'
#' @param num number of identifiers to return (defaults to 10), or 'all'
#'    to download the complete set of identifiers
#' @param url the base url for the function (should be left to default).
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass
#'    the returned value in here (avoids unnecessary footprint)
#' @return List of OAI identifiers for each dataset.
#' @export
#' @examples \dontrun{
#' identifiers <- ps_listidentifiers(from = '2012-03-10')
#' ps_listidentifiers
#' }
ps_listidentifiers <- function(tor = 'r', set = 'zookeys', metadataPrefix = 'oai_dc',
  num = 10, verb = 'ListIdentifiers', from = NA, 
  url = "http://oai.pensoft.eu", ..., curl = getCurlHandle()) {
  
  args <- list(verb = verb)
  if(!is.na(set))
    args$set <- set
  if(!is.na(metadataPrefix))
    args$metadataPrefix <- metadataPrefix
  if(!is.na(from))
    args$from <- from
  message(paste(url,'/?verb=',verb,'&set=',set, # display query to user
    '&from=',from,'&metadataPrefix=',metadataPrefix,sep=''))
  litidsout <- list()
  while( !is.null(resumptionToken) ){
    if(!is.null(resumptionToken))
      args$resumptionToken <- resumptionToken
    out <- getForm(url, .params = args, 
#                    ..., 
                   curl = curl)
    tt <- xmlParse(out)
    tt_ <- xmlToList(tt)
    litidsout[[i]] <- lapply(tt_[[3]], function(x) x$identifier)
    resumptionToken <- tt_$ListIdentifiers$resumptionToken$text
  }
  litidsout
}
# http://oai.pensoft.eu/?verb=ListIdentifiers&set=zookeys&from=1998-01-15&metadataPrefix=mods