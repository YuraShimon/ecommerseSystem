class Like < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true
  has_many :comments, as: :object
end
