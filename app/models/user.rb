class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :dislikes
  before_destroy :delete_related_orders

  private

  def delete_related_orders
    self.orders.destroy_all
  end
end
