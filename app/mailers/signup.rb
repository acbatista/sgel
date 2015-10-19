class Signup < ActionMailer::Base
  default from: 'no-reply@sgel.com'

  def confirm_email(user)
    @user = user
    @confirmation_link = confirmation_url({
      token: @user.confirmation_token
      })

    mail({
      to: user.email,
      bcc: ['sign ups <signups@sgel.com>'],
      subject: I18n.t('signup.confirm_email.subject')
    })
  end
end