
output "lambda_function_zip" {
  value = data.archive_file.main.output_path
}
output "lambda_function_zip_md5" {
  value = data.archive_file.main.output_md5
}
