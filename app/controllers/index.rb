get '/' do
  @wishes = Wish.all 
  erb :'index' 
end

get '/cats' do
	@cat = Cat.new
	if request.xhr?
		erb :'_show', layout: false
	else
		erb :'cat'
	end	
end