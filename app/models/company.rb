class Company < ActiveRecord::Base
  belongs_to :ipo_company

  has_many :announces

  # validates :name, presence: true
  # validates :summary, presence: true
  # validates :general_information, presence: true
  # validates :logo, presence: true
end
