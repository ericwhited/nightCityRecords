require 'sinatra'
require 'mailgun-ruby'
require 'sendgrid-ruby'

# saying at the root directory -- use the home.erb file
get '/' do
    erb :home
end

get '/contact' do
    erb :contact
end

get '/about' do
    erb :about
end

get '/music' do
    erb :music
end 

post '/sign-in' do
    puts params.inspect
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

# Define your message parameters
message_params =  { from: 'eejw93@gmail.com',
                    to:   'eejw93@gmail.com',
                    subject: 'This is a test from NYCDA CLASS',
                    text:    'This is a working email sent from Eric'
                  }

# Send your message through the client
mg_client.send_message 'sandbox5de09cdea4b04c9a9afc1228544224f0.mailgun.org', message_params
    "posted!"
    erb :messagesent
end


# post '/sign-in' do
#     puts params.inspect
# from = SendGrid::Email.new(email:'eejw93@gmail.com')
# subject = 'Hello World from the SendGrid Ruby Library!'
# to = SendGrid::Email.new(email:'eejw93@gmail.com')
# content = SendGrid::Content.new(type:'text/plain', value:'Hello, Email!')
# mail = SendGrid::Mail.new(from, subject, to, content)
# sg = SendGrid::API.new(api_key:ENV['SENDGRID_API_KEY'])
# response = sg.client.mail._('send').post(request_body: mail.to_json)
# puts response.status_code
# puts response.body
# end