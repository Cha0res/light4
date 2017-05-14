class IndexPage
  def initialize
    @products = Product.order('updated_at DESC').limit(3)
    @designers = Designer.order('updated_at DESC').limit(1)
    @partners = Partner.order('updated_at DESC')
  end

  attr_reader :products
  attr_reader :designers
  attr_reader :partners
end