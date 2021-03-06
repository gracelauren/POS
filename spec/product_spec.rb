require('spec_helper')

describe(Product) do
  it("validates presence of name") do
    product = Product.new({:name => "", :price => ""})
    expect(product.save()).to(eq(false))
  end

  it("converts the name to first uppercase and rest lowercase") do
    product = Product.create({:name => "milk", :price => ""})
    expect(product.name()).to(eq("Milk"))
  end

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
