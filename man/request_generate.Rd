% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_request.R
\name{request_generate}
\alias{request_generate}
\title{Build a request for the Google Calendar API}
\usage{
request_generate(
  endpoint = character(),
  params = list(),
  token = calendar_token()
)
}
\arguments{
\item{endpoint}{Character. Nickname for one of the selected Calendar v3 API
endpoints built into `gcal`. Learn more in [calendar_endpoints()].}

\item{params}{Named list. Parameters destined for endpoint URL substitution,
the query, or the body.}

\item{token}{Calendar token.}
}
\value{
`list()`\cr Components are `method`, `path`, `query`, `body`,
  `token`, and `url`, suitable as input for [request_make()].
}
\description{
Build a request, using knowledge of the [Calendar v3
  API](https://developers.google.com/calendar/v3/reference/) from its
  [Discovery
  Document](https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest).
  Most users should, instead, use higher-level wrappers that facilitate
  common tasks, such as reading calendar lists or calendar entries. The
  functions here are intended for internal use and for programming around the
  Calendar API.

`request_generate()` lets you provide the bare minimum of input.
  It takes a nickname for an endpoint and:

  * Uses the API spec to look up the `path`, `method`, and base URL.

  * Checks `params` for validity and completeness with respect to the
  endpoint. Separates parameters into those destined for the body, the query,
  and URL endpoint substitution (which is also enacted).
}
\examples{
\dontrun{
req <- request_generate(
  "drive.files.get",
  list(fileId = "abc"),
  token = calendar_token()
)
req
}
}
\seealso{
[gargle::request_develop()], [gargle::request_build()]

Other low-level API functions: 
\code{\link{calendar_token}()}
}
\concept{low-level API functions}
