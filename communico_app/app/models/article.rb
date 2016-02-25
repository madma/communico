class Article < ActiveRecord::Base
  has_many :subjects, as: :taggable
  has_and_belongs_to_many :users
end
