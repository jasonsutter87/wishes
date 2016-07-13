# list of all users
get '/users' do
  erb :'users/index'
end

# registration route
get '/users/new' do
  erb :'users/new'
end

post "/users" do
  @user = User.new(params[:user])

  @error = @user.errors.full_messages

  if @user.save
    redirect "/authorization"
  else
    @error = "Invalid information, double check your email is correct or that you have not already created an account with this email"
    erb :"/users/new"
  end
end

get "/users/:id/money" do
  @user = current_user
  erb :"/users/money"
end

put '/users/:id/money' do
  @user = User.find(params[:id])
  @user.update(params['wish'])
  redirect '/'  
end


get "/users/:id" do
  @user = current_user
  @wishes =  @user.wishes
  erb :"/users/show"
end

