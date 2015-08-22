# See https://github.com/voltrb/volt#routes for more info on routes

client '/about', action: 'about'
client '/dashboard', action: 'index', controller: 'dashboard'

post '/api/report', controller: 'reporter', action: 'recieve_from_api'
get '/api/sms/receive', controller: 'reporter', action: 'recieve_from_sms'
get '/api/sms/reply', controller: 'reporter', action: 'reply_to_sms'

client '/', {}
