class Hospital < ApplicationRecord
  has_many :medical_departments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
        #  scope :name_search, -> (name) { where('name LIKE ?', "%#{params[:hospital][:name]}%")}

  # def self.guest
  #   find_or_create_by!(email: 'guest11@example.com') do |hospital|
  #     hospital.password = SecureRandom.urlsafe_base64
  #     hospital.password_confirmation = hospital.password
  #     # hospital.guest = true
  #     hospital.name = "Guest Hospital"
  #   end
  # end
  def self.guest
    guest_attributes = {
      email: 'guest11@example.com',
      password: SecureRandom.urlsafe_base64,
      # password_confirmation: SecureRandom.urlsafe_base64,
      name: 'Guest Hospital',
      # medical_departments_attributes: [
      #   { name: 'Guest Medical Department' }
      # ]
    }
    find_or_create_by!(email: guest_attributes[:email]) do |hospital|
      hospital.assign_attributes(guest_attributes)
    end
  end
end
