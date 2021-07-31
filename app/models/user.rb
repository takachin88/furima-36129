class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  
    validates :nickname
    validates :first_name,
              format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '漢字・平仮名・カタカナ以外では登録できない'} 

    validates :last_name,
              format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '漢字・平仮名・カタカナ以外では登録できない'}
    validates :first_name_katakana,
              format: {with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力して下さい"}
    validates :last_name_katakana,
              format: {with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力して下さい"}
    validates :birth_day 
  end
  validates :password, 
             format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: '半角英数字でなければ登録できない' }
end
