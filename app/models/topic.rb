class Topic < ApplicationRecord

  belongs_to :user
  has_many :posts

  # 入力必須項目の設定 バリデーション設定
  validates :title, presence:true

end
