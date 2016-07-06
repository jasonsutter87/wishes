class CreateWishes < ActiveRecord::Migration
  def change
  	create_table :wishes do |t|
  		t.string :title, presence: true
  		t.string :content, presence: true
  		t.integer :price, presence: true
  		t.timestamps null: false
  	end
  end
end
