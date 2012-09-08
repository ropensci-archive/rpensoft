#' Learn about the Pensoft OAI-PMH service.
#' 
#' @import OAIHarvester
#' @param url Base URL for the service.
#' @return List of information describing the Pensoft OAI-PMH services.
#' @export
#' @examples \dontrun{
#' ps_identify()
#' }
ps_identify <- function(url = "http://oai.pensoft.eu", transform = FALSE) 
{
    oaih_identify(url, transform = transform)
}
