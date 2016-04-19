class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  extend Dragonfly::Model
  include Avatarable
  dragonfly_accessor :photo
  has_many :messages
  has_many :memberships
  has_many :projects, through: :memberships

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = nil
    end
  end

  def avatar_text
    email.chr
  end
end
