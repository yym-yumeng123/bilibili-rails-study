class Tag < ApplicationRecord
  # has_and_belongs_to_many :blogs
  has_many :blogs_tags, class_name: 'BlogsTags'
  has_many :blogs, through: :blogs_tags

  validates_presence_of :title, message: '标签不能为空'
  validates_uniqueness_of :title, message: "标签不能重复"
end
