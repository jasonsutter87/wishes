put '/wishes/:id/buy' do
  @wish = Wish.find(params[:id])
  @user = User.find(@wish.user_id)
  if @wish.user_id != current_user.id
     buyers_wallet = current_user.wallet - @wish.price
     sellers_wallet = @user.wallet + @wish.price
     new_price = @wish.price + 1
     @user.update(wallet: sellers_wallet)
     @current_user.update(wallet: buyers_wallet)
     @wish.update(user_id: current_user.id ,price: new_price)

  end
  redirect '/'  
end

#index of all wishes
get '/wishes' do
  redirect "/"
end

# returns a form to create a new wish
get '/wishes/new' do
  erb :'wishes/new' 
end

# Create a new wish
post '/wishes' do
  if params["wish"]["private"] == nil
    @cat = Cat.new
    @wish = Wish.new(user_id: current_user.id, title: params[:wish][:title], content: params[:wish][:content], :private => false, price: 1 , url: "#{@cat.format["response"]["data"]["images"]["image"]["url"]}")
  else
    @wish = Wish.new(user_id: current_user.id, title: params[:wish][:title], content: params[:wish][:content], :private => true, price: 1, url: "#{@cat.format["response"]["data"]["images"]["image"]["url"]}")
  end


  if @wish.save
    redirect "/"
  else
    flash[:error] = "Invalid information"
    erb :"/wishes/new"
  end
end

#display a wish by id
get '/wishes/:id' do
  @wish = Wish.find(params[:id])
  erb :'wishes/show' 
end

#returns a form to edit a wish
get '/wishes/:id/edit' do
  @wish = Wish.find(params[:id])
  erb :'wishes/edit'
end

#edit a wish by an id
put '/wishes/:id' do
  @wish = Wish.find(params[:id])
  @wish.update(params[:wish])
  redirect '/users/show'  
end

#delete a wish by an id
delete '/wishes/:id' do
  @wish = Wish.find(params[:id])
  @wish.destroy
  redirect '/users/show' 
end

