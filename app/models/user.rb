class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :looks
  has_many :events

  has_many :orders, dependent: :destroy
  has_many :get_fitteds ,through: :looks

###### sms functionality ####### 
  # def self.send_text_message
  # 	#raise "hi"
  #   number_to_send_to = "+918600584746"
  #   twilio_sid = "AC8c3453bcd97314eea20b996c94e44c56"
  #   twilio_token = "795dd5ff31906865a13cd364c6483c0a"
  #   twilio_phone_number = "15677034351"

  #   @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  #   @twilio_client.account.sms.messages.create(
  #     from: "#{twilio_phone_number}",
  #     to: number_to_send_to,
  #     body: "This is a message. It gets sent to #{number_to_send_to}"
  #     )
  # end

  ################# ends here ####################



end
