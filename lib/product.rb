class Product < ActiveRecord::Base
  has_and_belongs_to_many(:purchases)
  validates(:name, :presence => true)
  before_save(:upcase_name)

  scope(:bought, -> do
    where({:bought => true})
  end)

  private

  define_method(:upcase_name) do
    self.name=(self.name().split.map(&:capitalize).join(''))
  end
end
