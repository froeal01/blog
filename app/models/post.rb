class Post < ActiveRecord::Base
belongs_to :user
has_many :posts_tags
has_many :tags, through: :posts_tags
validates :title, :presence => true
validates :body, :presence => true
end
