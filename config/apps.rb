Padrino.configure_apps do
  set :session_secret, '3bfe345a630e08096e4f380d04758521fbecf3db2dddaeca915d42f9c4cc24a6'
  set :protection, true
  set :protect_from_csrf, true
end

Padrino.mount('Kaja::App', :app_file => Padrino.root('app/app.rb')).to('/')
