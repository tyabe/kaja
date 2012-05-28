Admin.mailer :notifier do

  email :registration do |account|
    to account.email
    subject 'Welcome to RubyKaja Admin'
    locals  account: account
    render  'notifier/registration'
  end

end
