class Wish < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :price, presence: true
	validates :user_id, presence: true

	belongs_to :user
end
