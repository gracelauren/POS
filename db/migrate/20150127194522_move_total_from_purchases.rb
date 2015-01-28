class MoveTotalFromPurchases < ActiveRecord::Migration
  def change
    remove_column(:purchases, :total, :integer)
  end
end
