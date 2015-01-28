class AddTimestampToPurchases < ActiveRecord::Migration
  def change
    add_column(:purchases, :date, :timestamp)
  end
end
