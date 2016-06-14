class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string  :title      
      t.integer    :stars      
      t.string  :language      
      t.string  :url      
      t.integer :user_id
      t.string :username

      t.timestamps null: false
    end
  end
end
