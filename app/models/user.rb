class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  extend Dragonfly::Model
  include Avatarable

  dragonfly_accessor :photo

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = nil
    end
  end

  def avatar_text
    name.chr
  end

  def update_with_password(params={})
  if params[:password].blank?
    params.delete(:password)
    params.delete(:password_confirmation) if params[:password_confirmation].blank?
  end
  update_attributes(params)
end
end
