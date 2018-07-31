class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  attachment :image
  validates :name, presence: true, length: {minimum: 2, maximum: 20 }
  validates :email, presence: true
  validates :introduction, length: {maximum: 50 }
end
