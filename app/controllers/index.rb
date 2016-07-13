get '/' do
  @wishes = Wish.all 
  erb :'index' 
end

get '/cats' do
	@cat = Cat.new
	erb :'cat'
end