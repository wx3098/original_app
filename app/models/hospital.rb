class Hospital < ApplicationRecord
  has_many :medical_departments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  scope :name_search, -> (name) { where('name LIKE ?', "%#{params[:hospital][:name]}%")}
end
