require 'tmpdir'
require 'fileutils'
require 'vimrunner/runner'

Before do
  @tmpdir = Dir.mktmpdir
  @original_dir = FileUtils.getwd
  FileUtils.cd @tmpdir
end

After do
  FileUtils.cd @original_dir
  @vim.kill if @vim
end

Given /^Vim is running$/ do
  @vim = Vimrunner::Runner.start_gvim
end

When /^I start editing a file named "([^"]*)"$/ do |filename|
  @vim.edit filename
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
