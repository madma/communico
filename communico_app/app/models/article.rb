class Article < ActiveRecord::Base
  has_many :subjects
  has_many :users, through: :subjects
end
