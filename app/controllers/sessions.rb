get '/sessions/new' do
	erb :'/sessions/new'
end

post "/sessions" do
  @user = User.find_by(email: params[:user][:email])
  
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @error = "Sorry, try a new password or email!"
    redirect "/sessions/new"
  end
end

get "/sessions/delete" do
  session[:user_id] = nil
  redirect "/"
end

