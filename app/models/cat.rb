require 'httparty'
class Cat
 	include HTTParty
	base_uri "http://thecatapi.com/api/images/get"

	def size
		@cat = self.class.get("?size=med")
	end
end
