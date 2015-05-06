class Announce < ActiveRecord::Base

  acts_as_messageable

  after_create :send_unpublished_announce_email

  belongs_to :company
  belongs_to :user
  belongs_to :kind
  has_one :purchase, dependent: :destroy

  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :number_of_share, presence: true
  validates :published, default: false
  validates :sku, presence: true, uniqueness: true

  def has_been_purchased?
    self.purchase.present?
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['company_id.sector_id LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def name
    user.first_name
  end

  def mailboxer_email(object)
    user.email
  end


  private

  def send_unpublished_announce_email
    UserMailer.unpublished_announce(self).deliver
  end

end
