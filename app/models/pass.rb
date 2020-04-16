class Pass < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :bild, presence: true
	validates :date, presence: true
	belongs_to :profile
end
