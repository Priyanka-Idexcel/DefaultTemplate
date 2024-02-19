

 # GITHUB_TOKEN = "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"

# client = Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])

puts "file changes are #{ENV['CHANGED_FILES']}"

# def get_changed_files(client, owner, pull_number)
#   response = client.pull_request_files(owner, pull_number)
#   file_names = response.map { |file| file.filename }
#   return response.size, file_names
#   puts "what is th eresponce #{response}"
#   puts "what are the file_names #{file_names}"
# end

# # def skip_brakeman?(pull_request_title)
# #   pull_request_title.include?("patch")
# # end

# def run_brakeman(file)
#   output = `brakeman --only-files "#{file}"`
#   puts "Brakeman output for #{file}:"
#   puts output
#   security_warnings = output[/Security Warnings: (\d+)/, 1].to_i
#   errors = output[/Errors: (\d+)/, 1].to_i
#   if security_warnings > 0 || errors > 0
#     puts "Brakeman detected issues for #{file}. Failing workflow."
#     exit 1
#   end
# end

# pull_number = get_pull_request_number

# if pull_number.nil?
#   puts "Pull request number couldn't be determined. Exiting."
#   exit 1
# end

# puts "Pull request number: #{pull_number}"

#   owner = ENV['GITHUB_REPOSITORY']
#   num_files_changed, file_names = get_changed_files(client, owner, pull_number)
#   changed_files = file_names.select { |file_name| File.extname(file_name) == '.rb' }
#   num_changed_rb_files = changed_files.count
#    puts "Number of .rb files changed: #{num_changed_rb_files}"
#   puts "Files changed: #{changed_files}"



# #   if skip_brakeman?(client.pull_request(owner, pull_number).title)
# #     puts "Pull request title contains 'patch'. Skipping Brakeman analysis."
# #   else
# #   # if num_files_changed.positive?
# #     puts "Running Brakeman on each changed file:"
# #     # final_changed_files.each do |file|
# #       # puts "Running Brakeman on #{file}"
# #       run_brakeman(final_changed_files)
# #     # end
# #   # else
# #     puts "No files changed. Skipping Brakeman analysis."
# #   # end
# # end



# pr = client.pull_request(owner, pull_number)
# if pr.title.include?('patch') || pr.body.include?('Reverts #')
#   puts "Skipping Brakeman analysis."
# else
#   changed_files.each do |file|
#     run_brakeman(file)
#   end
# end
