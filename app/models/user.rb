class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :invitor_users, foreign_key: :invitor_id, class_name: 'Friendship'
  has_many :invitees, through: :invitor_users

  has_many :invitee_users, foreign_key: :invitee_id, class_name: 'Friendship'
  has_many :invitees, through: :invitee_users

  has_many :send_invitations, foreign_key: :sender_id, class_name: 'Invitation'
  has_many :recievers, through: :send_invitations

  has_many :received_invitations, foreign_key: :reciever_id, class_name: 'Invitation'
  has_many :senders, through: :received_invitations
end
