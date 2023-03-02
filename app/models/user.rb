class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX}
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX}
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format { with: VALID_NAME_KANA_REGEX}
  validates :first_name_kana, presence: true, format { with: VALID_NAME_KANA_REGEX}
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freez            
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  
end
