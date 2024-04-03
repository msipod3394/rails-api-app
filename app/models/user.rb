class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  before_destroy :delete_related_orders

  private

  def delete_related_orders
    self.orders.destroy_all
  end
end
