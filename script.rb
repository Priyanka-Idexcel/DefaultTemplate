puts "This is a Ruby script running through a GitHub workflow"

require 'octokit'
require 'json'

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

def get_changed_files(client, owner, pull_number)
  response = client.pull_request_files(owner, pull_number)
  file_names = response.map { |file| file.filename }
  return response.size, file_names
end

def run_brakeman(file)
 output = system("brakeman  --force #{file}")
p 11111111111111111111111111111111111111111111111111111111111
  # Print the output
  puts "Brakeman output for #{file}:"
  puts "breakman outut #{output}"
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
pull_number = 185 

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
