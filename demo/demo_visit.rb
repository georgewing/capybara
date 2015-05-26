require 'capybara/poltergeist'

session = Capybara::Session.new(:poltergeist)

session.visit "http://www.baidu.com"

puts "I'm visit Baidu.com"

exit(-1)
