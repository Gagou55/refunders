class Announce < ActiveRecord::Base

  after_create :send_unpublished_announce_email

  belongs_to :company
  belongs_to :user
  belongs_to :kind

  validates :title, presence: true
  validates :price, presence: true
  validates :number_of_share, presence: true
  validates :published, default: false


  def self.search(search)
    if search
      find(:all, :conditions => ['company_id.sector_id LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  private

  def send_unpublished_announce_email
    UserMailer.unpublished_announce(self).deliver
  end

end
