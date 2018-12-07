class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :auctions
  has_many :reservations

  enum isPremium: { si: 0, solicitado: 1, no: 2 }

  scope :admins, -> {where(isAdmin: 1)}
  scope :clients, -> {where(isAdmin: 0)}

  validate :age_is_invalid, :expiry_date_is_invalid

  #Deje el self.isAdmin porque current_user solo funciona cuando lo usas desde un controlador o una vista. NO funciona en modelos, para eso hay que usar el self.
  def age_is_invalid
    if self.isAdmin == false
      today = Date.today
      if today - self.birthday < 18
        errors.add(:birthday, "Necesita ser mayor de edad para registrarse")
      end
    end
  end

  def expiry_date_is_invalid
    if self.isAdmin == false
  	 if self.card_expiry_date.present? && card_expiry_date <= Date.today
      	 errors.add(:card_expiry_date, "La fecha de vencimiento de la tarjeta ha caducado o esta punto de vencer")
      end
    end
  end

end
