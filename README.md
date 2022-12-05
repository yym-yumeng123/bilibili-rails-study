# README

> 跟着哔哩哔哩 rails5 系统学习 rails 知识

### 创建项目

```bash
rails new ProjectName

# 默认3000
rails s(erver) -p 4000
```

### 命名空间路由

```bash
bin/rails g controller admin::users
```

### 关联关系

```rb
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
  end
end
```
