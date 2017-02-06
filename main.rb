require 'sinatra'
require 'sendgrid-ruby'
require_relative 'email'

get "/" do
  erb :index
end

get "/about_us" do
  erb :about_us
end

get "/contact_us" do
  erb :contact_us
end

post "/contact-us" do
  email_sending
  erb :contact_us
end

get "/major_projects" do
  erb :major_projects
end
