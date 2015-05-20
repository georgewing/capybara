require 'capybara'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

session = Capybara::Session.new(:selenium)

session.visit "http://www.baidu.com"

puts "I'm visit Baidu.com"

exit(-1)
