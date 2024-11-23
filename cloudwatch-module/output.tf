output "log_group_name" {
  description = "The name of the CloudWatch Log Group."
  value       = aws_cloudwatch_log_group.test[0].name
  depends_on  = [aws_cloudwatch_log_group.test]
}

output "log_stream_name" {
  description = "The name of the CloudWatch Log Stream."
  value       = aws_cloudwatch_log_stream.test[0].name
  depends_on  = [aws_cloudwatch_log_stream.test]
}

output "metric_filter_name" {
  description = "The name of the created Metric Filter."
  value       = aws_cloudwatch_log_metric_filter.test[0].name
  depends_on  = [aws_cloudwatch_log_metric_filter.test]
}

output "alarm_name" {
  description = "The name of the created CloudWatch Alarm."
  value       = aws_cloudwatch_alarm.test.alarm_name
}