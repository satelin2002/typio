class User < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  
  # Scopes
  scope :created_before, ->(time) { where("created_at < ?", time) }
  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :updated_before, ->(time) { where("updated_at < ?", time) }
  scope :updated_after, ->(time) { where("updated_at > ?", time) }
  
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  validates_uniqueness_of :email
	validates :email, length: { in: 6..100 }
	validates :email, format: { with: /@/ }
	validates :email, presence: true
	validates :first_name, length: { maximum: 100 }
	validates :last_name, length: { maximum: 100 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable


  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    user = User.where(:email => auth.info.email).first
    if user  
      user.provider = auth.provider
      user.uid = auth.uid
      user.confirm! unless user.confirmed?
    else
      user = User.new(:email => auth.info.email, 
        :password =>  Devise.friendly_token[0,20],
        :provider => auth.provider,
        :uid => auth.uid,
        :first_name => auth.info.first_name,
        :last_name => auth.info.last_name)
      
      user.remote_avatar_url = auth.info.image
      user.skip_confirmation!
      user.save!
    end
    user
  rescue => e
    logger.error e.message
    logger.error e.backtrace
  end
  
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  role                   :string(255)
#  company_name           :string(255)
#  bio                    :text
#  time_zone              :string(255)      default("UTC")
#  created_at             :datetime
#  updated_at             :datetime
#  avatar                 :string(255)
#

