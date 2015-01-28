require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("/lib/**/*.rb")
require("./lib/product")
require("./lib/purchase")
require("pg")

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  name = params.fetch("name")
  price = params.fetch("price").to_i()
  @product = Product.new({:name => name, :price => price})
  @product.save()
  if @product.save()
    redirect("/")
  else
    erb(:errors)
  end
end

get("/products/:id") do
  @product = Product.find(params.fetch('id').to_i())
  erb(:product_edit)
end

patch("/products/:id") do
  name = params.fetch("name")
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i())
  if params.fetch("name") != ""
    @product.update({:name => name})
  end
  if params.fetch("price") != ""
    @product.update({:price => price.to_i()})
  end
  redirect("/")
end

delete("/products/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end

get("/purchases") do

  @products = Product.all()
  erb(:purchases)
end

post("/purchases") do
  product_ids = params.fetch("product_ids")
  @purchase = Purchase.create({:product_ids => product_ids})
  @products = Product.all()
  url = "/receipt/" + @purchase.id().to_s()
  redirect(url)
end

get("/receipt/:id") do
  @purchase = Purchase.find(params.fetch("id").to_i())
  @purchase_products = @purchase.products()
  erb(:receipt)
end
