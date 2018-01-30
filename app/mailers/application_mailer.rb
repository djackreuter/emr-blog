class ApplicationMailer < ActionMailer::Base
  default from: 'test@emrblog.com'
  layout 'mailer'
  def first_post_notification(user)
    @user = user
    mail to: @user.email, subject: 'Congrats On Your First Post!!'
  end
end
