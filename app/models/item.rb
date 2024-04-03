class Item < ApplicationRecord

  # 空文字チェック（nameの文字数が最小値1であることを検証）
  validates :name, presence: { message: "nameは空で登録できません" }, length: { minimum: 1 }
  validates :image, presence: true

  has_many :ingredient_items
  has_many :ingredients, through: :ingredient_items, class_name: 'Ingredient'

end
