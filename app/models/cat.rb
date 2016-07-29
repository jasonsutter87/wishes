require 'httparty'
class Cat
 	include HTTParty
	base_uri "http://thecatapi.com/api/images/get"

	def format
		@cat = self.class.get("?size=med&format=xml")
	end
end
