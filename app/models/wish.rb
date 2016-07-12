class Wish < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	validates :price, presence: true
	validates :user_id, presence: true
	validates :private, inclusion: { in: [true, false] }

	belongs_to :user
end
