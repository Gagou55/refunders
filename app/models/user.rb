class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_messageable

  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [ :facebook, :linkedin ]

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: ActionController::Base.helpers.asset_path('Business-Businessman.ico')

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  has_many :announces
  has_many :purchases

  def self.find_for_linkedin_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
    end
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      # user.first_name = auth.info.name.split(" ").first
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      # user.picture = auth.info.image
      if auth.info.image.present?
        avatar_url = process_uri(auth.info.image)
        user.update_attribute(:picture, URI.parse(avatar_url))
      end
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def name
    first_name
  end

  def mailboxer_email(object)
    email
  end

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :zip_code, presence: true
  # validates :city, presence: true
  # validates :email, presence: true, uniqueness: true

    private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

  def self.process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

end
