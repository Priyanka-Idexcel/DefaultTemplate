puts "this is rubcop execution"






puts "This is a Ruby script running through a GitHub workflow"

require 'octokit'
require 'json'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

def get_changed_files(client, owner, pull_number)
  response = client.pull_request_files(owner, pull_number)
  file_names = response.map { |file| file.filename }
  return response.size, file_names
end

def run_rubocop(file)
  output = `rubocop #{file}`
  puts "RuboCop output for #{file}:"
  puts output
  offenses = output.lines.count
  if offenses > 0
    puts "RuboCop detected issues for #{file}. Failing workflow."
    exit 1
  end
end
def get_pull_request_number
  ENV['PULL_REQUEST_NUMBER'] ||
    (ENV['GITHUB_EVENT_NAME'] == 'pull_request' &&
    ENV['GITHUB_EVENT_PATH'] &&
    JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))['number'])
end

pull_number = get_pull_request_number

if pull_number.nil?
  puts "Pull request number couldn't be determined. Exiting."
  exit 1
end

puts "Pull request number: #{pull_number}"


  owner = ENV['GITHUB_REPOSITORY']
  num_files_changed, file_names = get_changed_files(client, owner, pull_number)
  puts "Number of files changed: #{num_files_changed}"
  puts "Files changed: #{file_names}"

  if num_files_changed.positive?
    puts "Running Brakeman on each changed file:"
    file_names.each do |file|
      puts "Running Brakeman on #{file}"
      run_rubocop(file)
    end
  else
    puts "No files changed. Skipping Brakeman analysis."
  end


