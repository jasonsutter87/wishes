put '/wishes/:id/buy' do
  @wish = Wish.find(params[:id])
  if @wish.user_id != current_user.id
     @wish.update(user_id: current_user.id)
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
  @wish = Wish.new(user_id: current_user.id, title: params[:wish][:title], content: params[:wish][:content],  price: 1)

  @error = @wish.errors.full_messages

  if @wish.save
    redirect "/"
  else
    @error = "Invalid information, double check your email is correct or that you have not already created an account with this email"
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

