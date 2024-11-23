variable "create_log_group" {
  description = "Whether to create a CloudWatch Log Group."
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "The name of the CloudWatch Log Group."
  type        = string
}

variable "log_stream_name" {
  description = "The name of the CloudWatch Log Stream."
  type        = string
}

variable "create_metric_filter" {
  description = "Whether to create a CloudWatch Metric Filter."
  type        = bool
  default     = false
}

variable "metric_filter_name" {
  description = "The name of the Metric Filter."
  type        = string
}

variable "metric_filter_pattern" {
  description = "The pattern to use in the Metric Filter."
  type        = string
}

variable "metric_transformation_name" {
  description = "The name of the Metric Transformation."
  type        = string
}

variable "metric_namespace" {
  description = "The namespace for the metric."
  type        = string
}

variable "metric_transformation_value" {
  description = "The value for the Metric Transformation."
  type        = string
}

variable "alarm_name" {
  description = "The name of the alarm."
  type        = string
}

variable "comparison_operator" {
  description = "The comparison operator for the alarm."
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is evaluated."
  type        = number
}

variable "metric_name" {
  description = "The name of the metric to watch."
  type        = string
}

variable "metric_namespace" {
  description = "The namespace of the metric."
  type        = string
}

variable "period" {
  description = "The period in seconds over which the statistic is applied."
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
}

variable "actions_enabled" {
  description = "Indicates whether actions should be taken when this alarm's state changes."
  type        = bool
  default     = true
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions to the ALARM state."
  type        = list(string)
  default     = []
}

variable "insufficient_data_actions