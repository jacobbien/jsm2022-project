# Generated from create-jsm2022.Rmd: do not edit by hand

#' Export events to a .ics file that can be imported to Google Calendar, etc.
#' 
#' This will represent the events in the standardized iCalendar format and export
#' as a .ics file that can then be imported into most calendar apps (including 
#' Google Calendar). To do so, go to 
#' https://calendar.google.com/calendar/u/0/r/settings/export
#' and then click "Select file from your computer", and find the file created by
#' this function. Then choose which calendar you want these events added to and
#' click "Import."
#' 
#' @param schedule output of a call to `get_talks()`
#' @param file filename (should end with .ics) that will be created
#' 
#' @export
export_calendar_to_ics <- function(schedule, file = NULL) {
  if (is.null(file)) 
    file <- paste0("jsm2022-cal-", 
                   stringr::str_replace_all(Sys.time(), " ", "-"),
                   ".ics")
  cal <- schedule %>% 
    dplyr::rowwise() %>% 
    dplyr::mutate(
      event = calendar::ic_event(
        start_time = .data$start_time,
        end_time = as.numeric(difftime(time1 = .data$end_time,
                                       time2 = .data$start_time,
                                       units = "hours")),
        summary = paste0(.data$speaker, ": ", .data$title)
      )
    )
  cal$event$LOCATION <- schedule$room
  cal$event$DESCRIPTION <- stringr::str_glue_data(
    schedule, 
    "Authors: {author}\\nSession {session_number}: {session_title} ({session_type})\\nOrganizer: {organizer}; Chair: {chair}")
  cal$event %>% 
    calendar::ic_character() %>%
    stringr::str_replace_all("^DTSTART", "DTSTART;TZID=America/New_York") %>% 
    stringr::str_replace_all("^DTEND", "DTEND;TZID=America/New_York") %>% 
    writeLines(file)
}
