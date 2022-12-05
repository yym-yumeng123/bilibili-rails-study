class AddStyleToUsers < ActiveRecord::Migration[6.0]
  def change
    # 那张表, 第一个参数
    # 字段名 第二个参数
    add_column :users, :style, :string
  end
end
