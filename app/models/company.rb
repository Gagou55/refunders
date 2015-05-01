class Company < ActiveRecord::Base
  belongs_to :ipo_company
  belongs_to :sector

  has_many :announces

  has_attached_file :logo,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :logo,
    content_type: /\Aimage\/.*\z/

  # validates :name, presence: true
  # validates :summary, presence: true
  # validates :general_information, presence: true
  # validates :logo, presence: true
end
