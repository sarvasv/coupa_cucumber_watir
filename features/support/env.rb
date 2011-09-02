# 
#  Thu Sep  1 00:28:45 IST 2011, ramonrails
#   * cucumber environemnt

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
end

at_exit do
  if ENV['HEADLESS']
    headless.destroy
  end
end
