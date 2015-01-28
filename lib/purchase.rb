class Purchase < ActiveRecord::Base
  has_and_belongs_to_many(:products)

  scope(:between, lambda do |start_date, end_date|
    where("date >= :start_date AND date <= :end_date",
          { :start_date => start_date, :end_date => end_date })
  end)


  define_method(:total) do
    
    self.products().sum(:price)

  end
end
