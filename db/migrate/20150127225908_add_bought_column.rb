class AddBoughtColumn < ActiveRecord::Migration
  def change
    add_column(:products, :bought, :boolean)
  end
end
