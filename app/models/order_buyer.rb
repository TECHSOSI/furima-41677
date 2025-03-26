class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :building, :telephone, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :street_address, :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly"}
    validates :telephone, format: { with: /\A[0-9]+\z/, message: 'input only number' }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_code:, prefecture_id:, city:, street_address:, building:, telephone:, order_id: order.id)
  end
end