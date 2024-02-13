puts "This is ruby script running through github workflow"


require 'octokit'
require 'json'
require 'uri'
require 'net/http'

# Initialize Octokit client
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

# Function to get changed files from a pull request
def get_changed_files(client, owner, repo, pull_number)
  uri = URI("https://api.github.com/repos/#{owner}/#{repo}/pulls/#{pull_number}/files")
  req = Net::HTTP::Get.new(uri)
  req['Authorization'] = "token #{client.access_token}"

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end

  if res.is_a?(Net::HTTPSuccess)
    files = JSON.parse(res.body)
    files.map { |file| file['filename'] }
  else
    raise "Error fetching changed files: #{res.code} - #{res.message}"
  end
end

# Example usage:
owner = 'owner'
repo = 'repository'
pull_number = 123
begin
  file_names = get_changed_files(client, owner, repo, pull_number)
  puts file_names
rescue StandardError => e
  puts "Error: #{e.message}"
end
