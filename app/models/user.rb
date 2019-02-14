class User < ApplicationRecord
  # викликається після створення користувача
  after_create :create_userparam

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :userparam, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :chosens, dependent: :destroy

  def create_userparam
    # cтворює юзеру його парамси .
    @userparam = Userparam.create(user_id: id)
    @userparam.save
  end

  def nickname
    userparam.nickname
  end
end
