class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role, :created_at, :updated_at
  has_many :posts
  has_many :comments
  has_many :likes
end
