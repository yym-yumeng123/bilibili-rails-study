class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.boolean :is_public, default: true
      # t.integer :user_id, 
      t.belongs_to :user
      t.timestamps
    end

    add_index :blogs, [:user_id]
    #Ex:- add_index("admin_users", "username")
  end
end
