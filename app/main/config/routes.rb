# See https://github.com/voltrb/volt#routes for more info on routes

client '/about', action: 'about'
client '/dashboard', action: 'index', controller: 'dashboard'

client '/', {}
