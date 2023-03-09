class Item < ApplicationRecord
  belongs_to :user
  # has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :situation

  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
