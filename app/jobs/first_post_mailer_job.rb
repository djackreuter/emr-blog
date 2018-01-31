# class FirstPostMailerJob < ActiveJob::Base
#   queue_as :default

#   def perform(user)
#     ApplicationMailer.first_post_notification(user).deliver
#   end
# end
# class for mailer job
class FirstPostMailerJob < Struct.new(:user)
  attr_accessor :user_id

  def self.delay(user_id)
    f = FirstPostMailerJob.new
    f.user_id = user_id
    f
  end

  def perform
    user = User.find(self.user_id)
    ApplicationMailer.first_post_notification(user).deliver_now
  end
end
