class Topic < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_many :posts

  
  # 入力必須項目の設定 バリデーション設定
  validates :title, presence:true
  validates :category_id, numericality: { other_than: 1 } 

end
