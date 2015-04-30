class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from: 'mickael.giami@gmail.com'
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Refunders')
    # This will render a view in `app/views/user_mailer`!
  end

  def unpublished_announce(announce)
    @announce = announce

    mail(to: @announce.user.email, subject: 'Refunders Announce', cc: 'contact@refunders.com')
  end

end
