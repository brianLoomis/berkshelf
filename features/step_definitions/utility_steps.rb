Given /^skip\s+"([^\"]+)"$/ do |msg|
  skip
end

Then /the output from \`(.+)\` should be the same as \`(.+)\`/ do |actual, expected|
  run(actual)
  actual_output = last_command_started.stdout
  run(expected)
  expected_output = last_command_started.stdout
  expect(actual_output).to eql(expected_output)
end

When(/^I run `(.*?)`(?: for up to ([\d.]+) seconds)? printing output$/) do |cmd, secs|
  cmd = sanitize_text(cmd)
  cmd = run_command(cmd, :fail_on_error => true, :exit_timeout => secs && secs.to_f)
  puts cmd.output
end
