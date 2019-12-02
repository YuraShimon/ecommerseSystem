class User < ApplicationRecord
  #викликається після створення користувача
  after_create :create_userparam

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :userparam, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments

  def create_userparam
    #cтворює юзеру його парамси .
    @userparam = Userparam.create(user_id: self.id)
    @userparam.save
  end
end
