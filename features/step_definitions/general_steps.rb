# 
#  Thu Sep  1 00:40:47 IST 2011, ramonrails
#   * we need these libraries
require "watir-webdriver"
require "rspec/expectations"
require "ruby-debug"

# ==========
# = givens =
# ==========

#   * new instance of webdriver browser
Given /^I have a test browser running$/ do
  @browser ||= Watir::Browser.new :firefox
end

Given /^I debug$/ do
  debugger
end

# =========
# = whens =
# =========

When /^I visit "([^"]*)"$/ do |_url|
  @browser.goto _url
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |_text_field, _value|
  @browser.text_field( :id => _text_field).set( _value)
end

When /^I press the button$/ do
  @browser.button.click
end

# =========
# = thens =
# =========

