class User < ApplicationRecord

  has_many :medical_appointments, dependent: :destroy
  has_many :medical_appointment_departments , through: :medical_appointments, source: :medical_department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def self.from_omniauth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    if user
      return user
    else
      registered_user = User.find_by(email: auth.info.email)
      if registered_user
        registered_user.update(provider: auth.provider, uid: auth.uid)
        return registered_user
      else
        user = User.create(
          name: auth.info.name,
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0, 20]
        )
      end
    end
  end
end
