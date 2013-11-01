class CreateJoin < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
    
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :posts_tags, id: false do |t|
      t.integer :post_id 
      t.integer :tag_id 
      t.timestamps
    end  
    
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :post_id
      t.timestamps
    end  

  end
end
