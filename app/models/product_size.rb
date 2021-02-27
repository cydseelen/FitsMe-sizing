class ProductSize < ApplicationRecord
  SIZES = ["extra small", "small", "medium", "large", "extra large"]


  belongs_to :product
  validates :size_name, inclusion: {in: ["extra small", "small", "medium", "large", "extra large"] }

  before_save :convert_product_size_data

  def convert_product_size_data
    # all_sizes = self.product.product_sizes
    # extra_small_product_size = get_product_size("extra small", all_sizes)
    # small_product_size = get_product_size("small", all_sizes)
    # medium_product_size = get_product_size("medium", all_sizes)
    # large_product_size = get_product_size("large", all_sizes)
    # extra_large_product_size = get_product_size("extra large", all_sizes)


    # self.hip_range = (@hip_measurement.extra_small_product_size - 10) -@hipmeasuresmallersize   * 2
    # self.bust_range = 1
    # self.waist_range = 1
    # self.length_range = 1
  end

private

def get_product_size(size, all_sizes)
  all_sizes.find { |individual_size| individual_size.size_name == size}
end

end
