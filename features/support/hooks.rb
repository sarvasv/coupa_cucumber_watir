# 
#  Thu Sep  1 00:32:09 IST 2011, ramonrails
#   * cucumber hooks

#   * after each sscenario, these steps execute
After do |s| 
  #
  #   * bail out on the first failure
  if( ENV[ 'QUICKFAIL'])
    Cucumber.wants_to_quit = true if s.failed?
  end
  
  @browser.close if @browser  # close the browser instance
end

