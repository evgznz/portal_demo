class Profile < ApplicationRecord
	has_many :passes , dependent: :destroy
  validates_email_format_of :company_email ,messange: "Ошибка формата  email"

	validates :bild, presence: true
  belongs_to :user
  #rails_admin do
  #  configure :user do
  #      label 'Админка Profile'
  #  end
  #end
end
