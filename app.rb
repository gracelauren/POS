require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("/lib/**/*.rb")
require("./lib/product")
require("pg")

get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  name = params.fetch("name").split.map(&:capitalize).join('')
  price = params.fetch("price").to_i()
  @product = Product.create({:name => name, :price => price})
  redirect("/")
end

get("/products/:id") do
  @product = Product.find(params.fetch('id').to_i())
  erb(:product_edit)
end

patch("/products/:id") do
  name = params.fetch("name").split.map(&:capitalize).join('')
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i())
  if params.fetch("name").split.map(&:capitalize).join('') != ""
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


get("/cashier") do
  @products = Product.all()
  erb(:index)
end

post("/cashier") do
  name = params.fetch("name").split.map(&:capitalize).join('')
  price = params.fetch("price").to_i()
  @product = Product.create({:name => name, :price => price})
  redirect("/")
end
