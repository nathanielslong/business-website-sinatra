require 'sinatra'
require 'sinatra/flash'
require 'sendgrid-ruby'
require_relative 'email'

enable :sessions

get "/" do
  erb :index
end

get "/about-us" do
  erb :about_us
end

get "/contact-us" do
  erb :contact_us
end

post "/contact-us" do
  send_email
  flash[:message] = "Email sent!"
  redirect "/contact-us"
end

get "/major-projects" do
  erb :major_projects
end
