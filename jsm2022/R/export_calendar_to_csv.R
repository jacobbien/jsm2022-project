# Generated from create-jsm2022.Rmd: do not edit by hand

#' Export events to a .csv format that can be imported to Google Calendar
#' 
#' This will create a .csv file that can then be imported into Google Calendar.
#' To do so, go to https://calendar.google.com/calendar/u/0/r/settings/export
#' and then click "Select file from your computer", and find the file created by
#' this function. Then choose which calendar you want these events added to and
#' click "Import."  The disadvantage of this approach is that the times (which are
#' ET) will be entered in the local time of your calendar.  So if your calendar is
#' in a different time zone when you enter these, the events will be at the wrong 
#' time.  Using `export_calendar_to_ics()` does not have this problem so is the 
#' recommended function to use rather than this one.
#' 
#' @param schedule output of a call to `get_talks()`
#' @param file filename of .csv that will be created
#' 
#' @seealso [`export_calendar_to_ics`]
#' @export
export_calendar_to_csv <- function(schedule, file = NULL) {
  schedule %>% 
    dplyr::transmute(
      Subject = paste0(.data$speaker, ": ", .data$title),
      `Start Date` = .data$day,
      `All Day Event` = FALSE,
      `Start Time` = .data$start_time,
      `End Time` = .data$end_time,
      Location = .data$room,
      Description = stringr::str_glue("Authors: {.data$author}\nSession {.data$session_number}: {.data$session_title} ({.data$session_type})\nOrganizer: {.data$organizer}; Chair: {.data$chair}")
    ) %>% 
    readr::write_csv(file)
}
