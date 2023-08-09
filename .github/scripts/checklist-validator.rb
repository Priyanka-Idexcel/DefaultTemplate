require 'rubygems'
require 'bundler/setup'

require 'fileutils'
require 'octokit'
require 'pry'

# Your code here

# This will start the interactive console


# begin
	ENV["GITHUB_WORKSPACE"] = "/home/ubuntu/Projects/testing/DefaultTemplate/"

pr_template_path = File.join(ENV["GITHUB_WORKSPACE"], '.github', 'PULL_REQUEST_TEMPLATE.md')
  # pr_template_path = '.github/PULL_REQUEST_TEMPLATE.md'
  pr_template_content = File.read(pr_template_path, encoding: 'utf-8')
# binding.pry
  # checkbox_pattern = /^- \[x\]/
  checkbox_pattern = pr_template_content.include?('[ ]')
  checkbox_matches = pr_template_content.scan('[ ]')

   required_checkbox_count = checkbox_matches

  if pr_template_content.include?('[ ]')
    puts 'error: PR checklist is missing. Please add checkboxes to your template.'
 
  # else checkbox_matches.length < required_checkbox_count
  #   puts 'error: PR checklist is incomplete. Please mark all checkboxes.'
  #   exit 1
  else
    puts 'PR checklist is complete.'
  end
# end
# rescue StandardError => error
#   puts "An error occurred: #{error.message}"
#   exit 1
# end
