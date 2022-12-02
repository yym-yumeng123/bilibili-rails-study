class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: {message: '标题不能为空'}
  validates :content, presence: {message: '内容不能为空'}
  validates :user_id, presence: {message: '用户不能为空'}
end