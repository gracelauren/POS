require('spec_helper')

describe(Product) do

  describe(".bought") do
    it("returns all the bought products") do
      not_bought_product = Product.create({:name => "milk", :price => 2, :bought => false})
      bought_product = Product.create({:name => "cookies", :price => 4, :bought => true})
      bought_product2 = Product.create({:name => "wine", :price => 9, :bought => true})
      bought_products = [bought_product, bought_product2]
      not_bought_products = not_bought_product
      expect(Product.bought()).to(eq(bought_products))
    end
  end



end
