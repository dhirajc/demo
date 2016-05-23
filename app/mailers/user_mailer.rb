class UserMailer < ApplicationMailer

def send_invite(user1 , user2)
	@user1 = user1
	@user2 = user2
	mail(:to => [@user1,@user2],  subject: 'Welcome to BAD Online tuxedos')
end

  def order_email(user, items)
    # a = items
    # binding.pry
    # raise items.inspect
    @current_order = JSON.parse(items)
    @user = user
    @order = @user.orders.last.id
    mail(:to => @user.email, :subject => "Your order:#{@order} is being processed")
  end

def welcome_email(user)
	@user = user
	mail(:to => @user.email, :subject => "Welcome to BAD tuxedos")
end

end
