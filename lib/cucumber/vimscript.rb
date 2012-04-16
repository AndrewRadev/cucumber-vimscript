require 'tmpdir'
require 'tempfile'
require 'fileutils'
require 'vimrunner/runner'

Around do |scenario, block|
  Dir.mktmpdir do |tmpdir|
    Dir.chdir(tmpdir) do
      block.call
    end
  end
end

After do
  @vim.kill if @vim
end

Given /^Vim is running$/ do
  @vim = Vimrunner::Runner.start_gvim
end

Given /^I'm editing a file named "([^"]*)"$/ do |filename|
  @vim.edit filename
end

Given /^I'm editing a file named "([^"]*)" with the following contents:$/ do |filename, text|
  File.open(filename, 'w') { |f| f.write(text) }
  @vim.edit filename
end

Given /^"([^"]*)" is set$/ do |boolean_setting|
  @vim.set boolean_setting
end

Given /^"([^"]*)" is set to "([^"]*)"$/ do |setting, value|
  @vim.set setting, value
end

When /^I insert the text "([^"]*)"$/ do |text|
  @vim.insert text
end

When /^I save$/ do
  @vim.write
end

Then /^the file "([^"]*)" should contain "([^"]*)"$/ do |filename, text|
  File.exists?(filename).should be_true
  File.read(filename).should include text
end

Then /^the file "([^"]*)" should contain the following text:$/ do |filename, text|
  File.exists?(filename).should be_true
  File.read(filename).should include text
end

Given /^the cursor is positioned on "([^"]*)"$/ do |text|
  @vim.search text
end
