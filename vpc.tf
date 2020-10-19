resource "aws_vpc" "compliance-test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name    = "compliance vpc",
    Purpose = "Testing compliance integration"
  }
}
# data "aws_s3_bucket" "flowlog" {
#   bucket = "rahul.jenkins.test"
# }
# resource "aws_flow_log" "example" {
#   log_destination      = data.aws_s3_bucket.flowlog.arn
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.compliance-test.id
# }
