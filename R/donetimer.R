#' Stop the timer
#'
#' This stops the timer and records the time for the project.
#' creates a global variable, 'ps' that is used to define the start
#' time of a project.
#'
#' @description Use a project name that you can reference.
#'
#' @param notes leave notes for yourself to be able to reference later
#' @param finished define this by using the percentage of hours (.50 = 30 minutes)
#' if you need to adjust when you finished working on a project
#' @param projectstart this is the record of the start time and project name
#' @param pf this is the project finish time defined by the time the 'done' function was called
#'
#' @import dplyr
#'
#' @export

donetimer <- function(notes = NA, finished = NA, projectstart = ps, pf = Sys.time()) {

  if(!is.na(finished)) {
    finished = finished*60*60
    pf = pf- finished
    }

  ps = projectstart

  ps <- ps %>%
    mutate(date = format(starttime, '%Y-%m-%d'),
           projectname = pn,
           started = format(starttime, '%H:%M'),
           finished = format(pf, '%H:%M'),
           dif = round(as.numeric(pf - starttime, units = "hours"), digits = 2)) %>%
    select(-starttime, -pn)


  ps <- ps %>% mutate(psatime =  ifelse(dif > .24 & dif < .75, .5,
                                               ifelse(dif >= .75 & dif < 1.25, 1.0,
                                                ifelse(dif >= 1.25 & dif < 1.75, 1.5,
                                                 ifelse(dif >= 1.75 & dif < 2.25, 2.0,
                                                  ifelse(dif >= 2.25 & dif < 2.75, 2.5,
                                                   ifelse(dif >= 2.75 & dif < 3.25, 3.0,
                                                    ifelse(dif >= 3.25 & dif < 3.75, 3.5,
                                                     ifelse(dif >= 3.75 & dif < 4.25, 4.0,
                                                      ifelse(dif >= 4.25 & dif < 4.75, 4.5,
                                                       ifelse(dif >= 4.75 & dif < 5.25, 5.0,
                                                        ifelse(dif >= 5.25 & dif < 5.75, 5.5,
                                                         ifelse(dif >= 5.75 & dif < 6.25, 6.0,
                                                          ifelse(dif >= 6.25 & dif < 6.75, 6.5,
                                                           ifelse(dif >= 6.75 & dif < 7.25, 7.0,
                                                            ifelse(dif >= 7.25 & dif < 7.75, 7.5,
                                                             ifelse(dif >= 7.75 & dif < 8.25, 8.0, dif)))))))))))))))))
  ps$notes <-  notes

  if(exists('timecard')) {
    timecard <-  rbind(timecard, ps)
    assign('timecard', timecard, envir = .GlobalEnv)
  } else {
    assign("timecard", ps, envir = .GlobalEnv)
  }
  write.csv(timecard, paste0(Sys.Date(),'_timecard.csv'))
}
