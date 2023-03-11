class Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tel_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 

  end

 
  def save
   buy = Buy.create!(item_id: item_id, user_id: user_id)
   Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel_number: tel_number, buy_id: buy.id)
  end
end
