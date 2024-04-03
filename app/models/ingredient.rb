class Ingredient < ApplicationRecord
  has_many :items

  # 空文字チェック（nameの文字数が最小値1であることを検証）
  validates :name, presence: { message: "nameは空で登録できません" }, length: { minimum: 1 }

end
