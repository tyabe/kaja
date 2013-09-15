##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount("blog").to('/blog')
#   Padrino.mount("blog", :app_class => "BlogApp").to('/blog')
#   Padrino.mount("blog", :app_file =>  "path/to/blog/app.rb").to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount("Admin").host("admin.example.org")
#   Padrino.mount("WebSite").host(/.*\.?example.org/)
#   Padrino.mount("Foo").to("/foo").host("bar.example.org")
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount("AppName", :app_file => "path/to/file", :app_class => "BlogApp").to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '4a06000bc28a572317f9bea2953ca6be932fec7a71f2b960e61c2455a89c2dd1'
  set :mailer_defaults, from: 'RubyKaja WebSite <noreply@kaja.rubyist.net>'
  if production?
    set :delivery_method, :smtp => {
      address: ENV['MAILGUN_SMTP_SERVER'],
      port: ENV['MAILGUN_SMTP_PORT'],
      user_name: ENV['MAILGUN_SMTP_LOGIN'],
      password: ENV['MAILGUN_SMTP_PASSWORD'],
      domain: "kaja.rubyist.net",
      transport_encoding: "8bit",
      authentication: :plain
    }
  else
    set :delivery_method, :test
  end
  set :host, production? ? "kaja.rubyist.net" : "localhost:3000"
end

# Mounts the core application for this project
Padrino.mount("Kaja").to('/')
