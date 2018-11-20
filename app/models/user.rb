class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :auctions

  enum isPremium: { si: 0, solicitado: 1, no: 2 }

  scope :admins, -> {where(isAdmin: 1)}
end
