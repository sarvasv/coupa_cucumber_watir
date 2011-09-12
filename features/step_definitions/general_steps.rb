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

When /^I wait for DIV with text "([^"]*)"$/ do |_text|
  Watir::Wait.until { @browser.div( :text => _text) }
end

When /^I wait for DIV "([^"]*)" to be visible$/ do |_div_id|
  Watir::Wait.until { @browser.div( :id => _div_id).visible? }
end

When /^I click button "([^"]*)"$/ do |_button_id|
  @browser.button( :id => _button_id).click
end

When /^I wait for popup "([^"]*)"$/ do |_popup_class|
  # 
  #  Tue Sep 13 02:52:47 IST 2011, ramonrails
  #   * design flaw? page had multiple divs with that class
  #   * Upon submission, the DIVs stayed on page, invisible. This added to confusion why watir could not find the popup
  Watir::Wait.until { @browser.divs( :class => _popup_class).any?(&:visible?) }
end

When /^I click link in "([^"]*)"$/ do |_popup_class|
  @browser.divs( :class => _popup_class).each { |_div| _div.link.click if _div.visible? }
end

When /^I submit the (\d+)st product$/ do |_nth|
  @browser.div( :class => "search-line-fields").form().button().click
end

When /^I follow "([^"]*)" class link$/ do |_link_class|
  @browser.link( :class => _link_class).when_present.click
end

When /^I follow "([^"]*)"$/ do |_link_text|
  @browser.link( :text => _link_text).when_present.click
end

When /^I mouseover navigation "([^"]*)"$/ do |_menu_name|
  @browser.nav( :id => "secondary").a( :text => _menu_name).parent().fire_event("onmouseover")
end

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

Then /^DIV class "([^"]*)" contains "([^"]*)"$/ do |_div_class, _text|
  @browser.div( :class => _div_class).text.should include( _text)
end

Then /^I should see "([^"]*)"$/ do |text|
  text.split(',').compact.uniq.collect(&:strip).each {|e| @browser.text.should include("Sign Out") }
end
