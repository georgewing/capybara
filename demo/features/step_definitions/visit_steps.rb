require 'rspec/expectations'
require 'capybara'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

session = Capybara::Session.new(:poltergeist)

Given /The Action is ([A-z]*)/ do |action|
    @action = action
end

When /The Subject is ([A-z][0-9]*)/ do |subject|
    @subject = subject
end

Then /The Greeting is (.*)/ do |greeting|
    session.visit "http://www.fever38.com"
    puts session.text
    greeting.should == "#{@action} #{@subject}"
end

