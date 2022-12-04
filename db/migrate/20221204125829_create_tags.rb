class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end

    # 我们不需要这张表, 只需要这张表的关联关系
    create_table :blogs_tags do |t|
      t.integer :blog_id
      t.integer :tag_id
    end
  end
end
