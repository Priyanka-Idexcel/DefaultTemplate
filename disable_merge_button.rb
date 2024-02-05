require 'octokit'

# Set up Octokit client with your GitHub token
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

# Get pull request details
pr_details = client.pull_request(ENV['GITHUB_REPOSITORY'], ENV['GITHUB_EVENT_NUMBER'])

# Check if any workflow checks failed
checks_failed = pr_details.statuses.any? { |status| status.state == 'failure' }

if checks_failed
  puts "At least one workflow check failed"
  exit 1
end

# Disable merge button if any workflow checks failed
pr_number = ENV['GITHUB_EVENT_NUMBER']
repo = ENV['GITHUB_REPOSITORY']

client.update_pull_request(repo, pr_number, restrictions: { users: [], teams: [], apps: ["pull-request-checker"] })
