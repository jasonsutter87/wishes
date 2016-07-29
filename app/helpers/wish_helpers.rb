helpers do
  def buy_wish
	if @wish.user_id != current_user.id  && @wish.price <= current_user.wallet
     	buyers_wallet = current_user.wallet - @wish.price
     	sellers_wallet = @user.wallet + @wish.price
     	new_price = @wish.price + 1
     	@user.update(wallet: sellers_wallet)
    	@current_user.update(wallet: buyers_wallet)
     	@wish.update(user_id: current_user.id ,price: new_price)
  	end 
  end
end