# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "test" {
  count               = var.create_log_group ? 1 : 0
  name                = var.log_group_name
  retention_in_days   = var.retention_in_days
}

# Create CloudWatch Log Stream
resource "aws_cloudwatch_log_stream" "test" {
  count          = var.create_log_group ? 1 : 0
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.test[0].name
}

# Create CloudWatch Metric Filter
resource "aws_cloudwatch_log_metric_filter" "test" {
  count          = var.create_metric_filter ? 1 : 0
  log_group_name = aws_cloudwatch_log_group.test[0].name
  name           = var.metric_filter_name
  pattern        = var.metric_filter_pattern
  
  metric_transformation {
    name      = var.metric_transformation_name
    namespace = var.metric_namespace
    value     = var.metric_transformation_value
  }
}

# Create CloudWatch Alarm
resource "aws_cloudwatch_alarm" "test" {
  alarm_name                = var.alarm_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.metric_namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  actions_enabled           = var.actions_enabled
  
  alarm_actions             = var.alarm_actions
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions                = var.ok_actions
}