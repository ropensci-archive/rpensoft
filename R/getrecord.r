#' Retrieve an individual record from the Pensoft journals.
#' 
#' @import OAIHarvester
#' @param prefix The prefix to use, one of: "oa_dc" (Dublin Core metadata format), 
#' 		"mods" \link{http://www.loc.gov/standards/mods/}.
#' @examples \dontrun{
#' out <- getrecord("10.3897/zookeys.1.10", T)
#' out$metadata # get $identifier, $datestamp, $setSpec, or $metadata
#' oaih_transform(out$metadata) # transform only metadata to a list
#' 
#' # Using mods prefix
#' getrecord("10.3897/zookeys.1.10", T, "mods")
#' }
#' @export
getrecord <- function(id = NULL, transform = TRUE, prefix = "oai_dc",
  url = "http://oai.pensoft.eu") 
{
	oaih_get_record(
	  url, 
		id, 
		prefix = prefix, 
		transform = transform)
}