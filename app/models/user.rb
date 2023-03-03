class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
  validates :last_name
  validates :first_name 
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
  validates :last_name_kana 
  validates :first_name_kana
  end

  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: VALID_PASSWORD_REGEX, message: 'は半角英数字を両方含む必要があります'}
  
end
