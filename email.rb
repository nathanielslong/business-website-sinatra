def email_sending
  user_name = "#{params["fname"]} #{params["lname"]}"
  user_email = params["email"]
  user_phone = params["phone"]
  user_company = params["company"]
  user_body = params["message"]
  user_country = params["country"]
  from = SendGrid::Email.new(email: user_email)
  subject = 'Consulting interest from #{user_name} at #{user_company} in #{user_country}, phone contact #{user_phone}'
  to = SendGrid::Email.new(email: 'test@example.com')
  content = SendGrid::Content.new(type: 'text/plain', value: user_body)
  mail = SendGrid::Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  p response.status_code
end
