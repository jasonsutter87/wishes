get '/' do
  @wishes = Wish.all 
  erb :'index' 
end

get '/authorization' do
	erb :'/authorization/authorization'
end

get '/logged_in' do
  if session[:user_id]
    return "asdkjashkjdh"
  else
   false
 end
end
