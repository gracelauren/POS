class Product < ActiveRecord::Base
  has_and_belongs_to_many(:purchases)

  scope(:bought, -> do
    where({:bought => true})
  end)
  validates(:name, :presence => true)
end
