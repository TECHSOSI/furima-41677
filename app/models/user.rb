class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}\z/, message: "は6文字以上の半角英数字を含める必要があります。" }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/, message: "はカタカナのみを入力してください。" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/, message: "はカタカナのみを入力してください。" }
  validates :birth_date, presence: true
  
end
