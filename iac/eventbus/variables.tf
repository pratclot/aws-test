variable "jedi_lambda_function_name" {
  description = "Name of the Jedi lambda"
}
variable "jedi_lambda_function_arn" {
  description = "arn of the Jedi lambda"
}
variable "pattern_for_event_source" {
  description = "blah blah blah"
  default     = "custom-source"
}
variable "pattern_for_event_detail_type" {
  description = "I a, really tired of adding all these descriptions"
  default     = "custom-event"
}
variable "event_bus_name" {
  description = "How to call the bus"
}