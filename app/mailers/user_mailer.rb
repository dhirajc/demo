class UserMailer < ApplicationMailer

def send_invite(user1 , user2)
	@user1 = user1
	@user2 = user2
	mail(:to => [@user1,@user2],  subject: 'Welcome to BAD Online tuxedos')
end

end
