#index of all wishes
get '/wishes' do
	erb :'wishes/index'
end

# returns a form to create a new wish
get 'wishes/new' do
	erb :'wishes/new' 
end


# Create a new wish
post '/wishes' do
	redirect '/' 
end

#display a wish by id
get '/wishes/:id' do
	p @wish = Wish.find(params[:id])
	erb :'wishes/show' 
end

#returns a form to edit a wish
get '/wishes/:id/edit' do
	erb :'wishes/edit'
end

#edit a wish by an id
put '/wishes/:id' do
	redirect '/' 
end

#delete a wish by an id
delete '/wishes/:id' do
 	redirect '/' 
end


