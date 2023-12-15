data "archive_file" "main" {
  type       = "zip"
  source_dir = var.lambda_source_dir
  # TODO sorry, this module is a mess!
  excludes = [
    ".aws-sam",
    ".venv",
    "tests",
    "events"
  ]
  output_path = var.path_to_output_zip
}
