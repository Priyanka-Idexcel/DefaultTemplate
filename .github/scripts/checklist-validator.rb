
require 'fileutils'
require 'octokit'

begin
  pr_template_path = '.github/PULL_REQUEST_TEMPLATE.md'
  pr_template_content = File.read(pr_template_path, encoding: 'utf-8')

  checkbox_pattern = /^- \[x\]/
  checkbox_matches = pr_template_content.scan(checkbox_pattern)

  required_checkbox_count = # specify the required checkbox count here

  if checkbox_matches.empty?
    puts 'error: PR checklist is missing. Please add checkboxes to your template.'
    exit 1
  elsif checkbox_matches.length < required_checkbox_count
    puts 'error: PR checklist is incomplete. Please mark all checkboxes.'
    exit 1
  else
    puts 'PR checklist is complete.'
  end
rescue StandardError => error
  puts "An error occurred: #{error.message}"
  exit 1
end
