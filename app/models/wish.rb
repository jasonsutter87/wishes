class Wish < ActiveRecord::Base
	validates :title, uniqueness: true
	validates :content, uniqueness: true
	validates :price, uniqueness: true
end
