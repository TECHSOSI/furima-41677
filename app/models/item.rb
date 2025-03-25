class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :product_name, presence: true                    
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000, message: 'must be between ¥300 and ¥9,999,999 (half-width numbers only)' }
  validates :product_information, presence: true                    
  validates :image, presence: true

  validates :category_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_date_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
end