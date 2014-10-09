require 'json'

log = `git log --pretty=oneline`

array_of_logs = log.split("\n")

commits = []

array_of_logs.each_with_index do |line, index|
	strings = line.split " "
	sha = strings.shift
	message = strings.join " "
	commits << {commit: sha, instruction: message, source: "lib/fizzbuzz.rb", spec: "spec/fizzbuzz_spec.rb"} if index.odd?
end

File.open('tutorial.json', 'w') do |file|
	file.write commits.reverse.to_json
end
