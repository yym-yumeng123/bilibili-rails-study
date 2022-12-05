class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  # 第二个参数可以指定代码块, 关联关系查询参数
  has_many :piblic_blogs, -> { where(is_public: true) }, class_name: 'Blog'

  has_one :latest_blog, -> { order('id desc')},  class_name: :Blog

  validates :username, presence: { message: '用户名不能为空' }
  validates :username, uniqueness: { message: '用户名已经存在' }
  validates :password, presence: {message: '密码不能为空' }
  validates :password, length: {minimum: 6, message: '密码最小为 6 位'}
  
  has_many :staffs, class_name: :User, foreign_key: 'manage_id'
  belongs_to :manager, class_name: :User
end
