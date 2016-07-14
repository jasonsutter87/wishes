class CreateWishes < ActiveRecord::Migration
  def change
  	create_table :wishes do |t|
  		t.integer :user_id
  		t.string :title, presence: true
  		t.string :content, presence: true
  		t.integer :price, presence: true
  		t.boolean :private, default: false
  		t.integer :new_user, default: 0
      t.string :url
  		t.timestamps null: false
  	end
  end
end
