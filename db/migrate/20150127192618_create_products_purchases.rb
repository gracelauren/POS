class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table :products_purchases, id: false do |t|
      t.column(:product_id, :integer)
      t.column(:purchase_id, :integer)
    end
  end
end
