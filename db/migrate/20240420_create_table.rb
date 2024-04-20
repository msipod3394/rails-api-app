class CreateComplexSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :dislikes, charset: 'utf8mb4', force: :cascade do |t|
      t.bigint :ingredient_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_index :dislikes, :ingredient_id, name: 'fk_rails_f1bdd3ed82'
    add_index :dislikes, :user_id, name: 'fk_rails_4381bad317'

    create_table :favorites, charset: 'utf8mb4', force: :cascade do |t|
      t.bigint :item_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_index :favorites, :item_id, name: 'fk_rails_30ac764a96'
    add_index :favorites, :user_id, name: 'fk_rails_d15744e438'

    create_table :ingredient_items, charset: 'utf8mb4', force: :cascade do |t|
      t.bigint :ingredient_id, null: false
      t.bigint :item_id, null: false
      t.timestamps
    end
    add_index :ingredient_items, :ingredient_id, name: 'index_ingredient_items_on_ingredient_id'
    add_index :ingredient_items, :item_id, name: 'index_ingredient_items_on_item_id'

    create_table :ingredients, charset: 'utf8mb4', force: :cascade do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :ingredients, :name, name: 'index_ingredients_on_name', unique: true

    create_table :items, charset: 'utf8mb4', force: :cascade do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.timestamps
    end
    add_index :items, :name, name: 'index_items_on_name', unique: true

    create_table :orders, charset: 'utf8mb4', force: :cascade do |t|
      t.bigint :item_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_index :orders, :item_id, name: 'fk_rails_fc971cd604'
    add_index :orders, :user_id, name: 'fk_rails_f868b47f6a'

    create_table :users, charset: 'utf8mb4', force: :cascade do |t|
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :encrypted_password, default: '', null: false
      t.string :user_name
      t.string :email, default: '', null: false
      t.string :reset_password_token
      t.string :jti, null: false
      t.string :password
      t.timestamps
    end

    # Adding Foreign Keys
    add_foreign_key :dislikes, :ingredients
    add_foreign_key :dislikes, :users, on_delete: :cascade
    add_foreign_key :favorites, :items
    add_foreign_key :favorites, :users, on_delete: :cascade
    add_foreign_key :ingredient_items, :ingredients
    add_foreign_key :ingredient_items, :items
    add_foreign_key :orders, :items
  end
end

