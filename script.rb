puts "This is a Ruby script running through a GitHub workflow"

require 'octokit'
require 'json'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

def get_changed_files(client, owner, pull_number)
  response = client.pull_request_files(owner, pull_number)
  file_names = response.map { |file| file.filename }
  return response.size, file_names
end

# def run_brakeman(file)
#  output = 'brakeman  --force #{file}'
# p 11111111111111111111111111111111111111111111111111111111111
#   # Print the output
#   puts "Brakeman output for #{file}:"
#   puts "breakman outut #{output}"
# end

def run_brakeman(file)
  output = `brakeman --force "#{file}"`
  p 11111111111111111111111111111111111111
  puts "Brakeman output for #{file}:"
  puts output
end


# def run_brakeman(file)
#   output_file = "#{file}_brakeman_output.txt"
#   system("brakeman --force #{file} > #{output_file}")
#   output = File.read(output_file)
#   puts "Brakeman output for #{file}:"
#   puts output
#   File.delete(output_file)
# end

owner = 'Priyanka-Idexcel/DefaultTemplate'


require 'json'

# Extract pull request number from environment variables or GitHub event payload
def get_pull_request_number
  return ENV['PULL_REQUEST_NUMBER'] if ENV['PULL_REQUEST_NUMBER']

  event_path = ENV['GITHUB_EVENT_PATH']
  if event_path && File.exist?(event_path)
    event = JSON.parse(File.read(event_path))
    return event['number'] if event['number']
  end

  nil
end

pull_number = get_pull_request_number

if pull_number.nil?
  puts "Pull request number couldn't be determined. Exiting."
  exit 1
end

# Now use the retrieved pull request number
puts "Pull request number: #{pull_number}"


begin
  num_files_changed, file_names = get_changed_files(client, owner, pull_number)
  puts "Number of files changed: #{num_files_changed}"
  puts "Files changed: #{file_names}"

  if num_files_changed.positive?
    puts "Running Brakeman on each changed file:"
    file_names.each do |file|
      puts "Running Brakeman on #{file}"
      run_brakeman(file)
    end
  else
    puts "No files changed. Skipping Brakeman analysis."
  end
rescue StandardError => e
  puts "Error: #{e.message}"
end
