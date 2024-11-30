variable "controls" {
  description = "A list of controls for the Audit Manager framework."
  type = list(object({
    control_id          = string
    control_name        = string
    control_description = string
    control_data_source  = string
  }))
}