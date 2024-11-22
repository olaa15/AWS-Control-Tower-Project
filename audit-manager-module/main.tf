# AWS Audit Manager Framework Creation
resource "aws_auditmanager_framework" "test" {
  name        = var.framework_name
  description = var.framework_description

  compliance_type = var.compliance_type

  control_sets {
    name = var.control_set_name

    dynamic "controls" {
      for_each = var.controls
      content {
        control_id   = controls.value.control_id
        control_name = controls.value.control_name
        control_description = controls.value.control_description
        control_data_source = controls.value.control_data_source
      }
    }
  }
}

# AWS Audit Manager Assessment Creation
resource "aws_auditmanager_assessment" "test" {
  assessment_name = var.assessment_name
  framework_id   = aws_auditmanager_framework.test.id

  # You can specify additional settings for assessment as necessary.
}