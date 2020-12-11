class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :invitor_users, foreign_key: :invitor_id, class_name: "Friendship"
  has_many :invitees, through: :invitor_users

  has_many :invitee_users, foreign_key: :invitee_id, class_name: "Friendship"
  has_many :invitees, through: :invitee_users
end
