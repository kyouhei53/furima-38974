class Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :tel_number, format: { with: /\A\d{10,11}\z/ } 
    validates :token
    validates :user_id
    validates :item_id
  end

   
  def save
   buy = Buy.create!(item_id: item_id, user_id: user_id)
   Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel_number: tel_number, buy_id: buy.id)
  end
end
