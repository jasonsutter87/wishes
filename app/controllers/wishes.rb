get '/wishes/:id' do
	p @wish = Wish.find(params[:id])
	erb :'wishes/show' 
end