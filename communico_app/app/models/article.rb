class Article < ActiveRecord::Base
  has_many :subjects
  has_many :users, -> { distinct }, through: :subjects
end
