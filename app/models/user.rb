class User < ApplicationRecord
  # викликається після створення користувача
  after_create :create_userparam

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :userparam
  has_many :comments
  has_many :posts
  has_many :questions
  has_many :answers
  has_many :comment, as: :activeuser

  def create_userparam
    # cтворює юзеру його парамси .
    @userparam = Userparam.create(user_id: id)
    @userparam.save
   end
end
