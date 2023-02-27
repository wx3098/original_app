class User < ApplicationRecord

  has_many :medical_appointments, dependent: :destroy
  has_many :medical_appointment_departments , through: :medical_appointments, source: :medical_department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  validates :name, presence: true
  
         def social_profile(provider)
          social_profiles.select { |sp| sp.provider == provider.to_s }.first
        end
      
        def set_values(omniauth)
          return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
          credentials = omniauth["credentials"]
          info = omniauth["info"]
      
          access_token = credentials["refresh_token"]
          access_secret = credentials["secret"]
          credentials = credentials.to_json
          name = info["name"]
          # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
        end
      
        def set_values_by_raw_info(raw_info)
          self.raw_info = raw_info.to_json
          self.save!
        end

        def self.guest
          find_or_create_by!(email: 'guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.name = "ゲスト"
            user.admin = false
          end
        end


        def self.guest_admin
          find_or_create_by!(email: 'admin_guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.name = "ゲスト管理者"
            user.admin = true
        end
      end
  
end
