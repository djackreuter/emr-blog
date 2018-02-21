require 'twilio-ruby'
# Class for sending SMS to users
class SendSMS
  def self.send_text(user)
    client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    client.api.account.messages.create(
      from: ENV['FROM_NUMBER'],
      to: "+1#{user.phone_number}",
      body: "Hey #{user.name}! Someone just commented on your post!!"
    )
  end
end
