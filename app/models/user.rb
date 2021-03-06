class User < ApplicationRecord
  has_many :items
  has_many :purchases
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birth_day, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }

  VALID_KANA_REGEX = /\A[ァ-ン]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }

end
