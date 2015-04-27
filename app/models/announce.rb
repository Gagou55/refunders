class Announce < ActiveRecord::Base
  belongs_to :company
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :kind, presence: true
  validates :number_of_share, presence: true
  validates :published, default: false
end
