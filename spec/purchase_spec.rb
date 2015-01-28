require('spec_helper')

describe(Purchase) do
  it { should have_and_belong_to_many(:products) }

  describe("#total") do
    it("total all the products in the purchase") do
      product1 = Product.create({:name => "milk", :price => 2})
      product2 = Product.create({:name => "cookies", :price => 3})
      purchase = Purchase.create({:product_ids => [product1.id, product2.id]})
      expect(purchase.total()).to(eq(5))
    end
  end

    describe(".between") do
      it("tells you if the purchase was in the timeframe") do
        purchase1 = Purchase.create(:date => "2015-01-20")
        purchase2 = Purchase.create(:date => "2015-01-27")
        expect(Purchase.between(Time.parse("2015-01-25"), Time.parse("2015-01-30"))).to(eq([purchase2]))
      end
    end
end
