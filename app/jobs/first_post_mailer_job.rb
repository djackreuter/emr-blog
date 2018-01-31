class FirstPostMailerJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    ApplicationMailer.first_post_notification(user).deliver
  end
end

# class FirstPostMailer < Struct.new(:user)
#   attr_accessor :user_id

#   def deliver
#     ApplicationMailer.first_post_notification(@user).deliver_now
#   end

#   def self.delay(user_id)
#     f = FirstPostMailer.new
#     f.user_id = user_id
#     f
#   end

#   def perform
#     @user = User.find(self.user_id)
#     deliver
#   end
# end