require 'sinatra'
require 'sendgrid-ruby'

def email_sending
  user_email = params["email"]
  user_name = params["name"]
  user_body = params["message"]
  from = SendGrid::Email.new(email: user_email)
  subject = 'Hello #{user_name}'
  to = SendGrid::Email.new(email: 'test@example.com')
  content = SendGrid::Content.new(type: 'text/plain', value: user_body)
  mail = SendGrid::Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  p response.status_code
  p response.body
end

get "/" do
  erb :index
end

post "/contact-us" do
  p params
  email_sending
end
