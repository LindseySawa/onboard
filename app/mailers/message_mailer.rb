class MessageMailer < ApplicationMailer
  def send_mail(message)
    @message = message
    mail(
      from: 'from@example.com',
      to: '57.kanisawa.misako@gmail.com',
      subject: 'お問い合わせ'
    )
  end

end