class ProductSize < ApplicationRecord
  belongs_to :product
  validates :size_name, inclusion: {in: ["extra small", "small", "medium", "large", "extra large"] }

  #before_save :convert_product_size_data

  def convert_product_size_data

   p all_sizes = ProductSize.where(product: self.product)
    extra_small_product_size = get_product_size("extra small")
    small_product_size = get_product_size("small")
    medium_product_size = get_product_size("medium")
    large_product_size = get_product_size("large")
    extra_large_product_size = get_product_size("extra large")


    #self.hip_range = (@start, @end)

    if size_name == "extra_small"
        self.hip_range = get_hip_range(@hip_range_extra_small_start)...get_hip_range(@hip_range_extra_small_end)
      elsif size_name == "small"
        self.hip_range = get_hip_range(@hip_range_small_start)...get_hip_range(@hip_range_small_end)
      elsif size_name == "medium"
        self.hip_range = get_hip_range(@hip_range_medium_start)...get_hip_range(@hip_range_medium_end)
      elsif size_name == "large"
        self.hip_range = get_hip_range(@hip_range_large_start)...get_hip_range(@hip_range_large_end)
      elsif size_name == "extra_large"
        self.hip_range = get_hip_range(@hip_range_extra_large_start)...get_hip_range(@hip_range_extra_large_end)
    end


    #self.bust_range
    #self.bust_range.extra_small = (get_bust_range(@bust_range_extra_small_start) , get_bust_range(@hip_range_extra_small_end))
    #self.bust_range.small = (get_bust_range(@bust_range_small_start) , get_bust_range(@hip_range_small_end))
    #self.bust_range.medium = (get_bust_range(@bust_range_medium_start) , get_bust_range(@hip_range_medium_end))
    #self.bust_range.large = (get_bust_range(@h_range_large_start) , get_bust_range(@hip_range_large_end))
    #self.bust_range.extra_large = (get_bust_range(@hip_range_extra_large_start) , get_bust_range(@hip_range_extra_large_end))


  end

private

def get_hip_range(measurement)
#hip_range start: smaller - (diff)   end: bigger - (diff)
@hip_range_extra_small_start = (measurement.extra_small_product_size - (measurement.extra_small_product_size * 1.1)) *2,
@hip_range_extra_small_end = (measurement.small_product_size - ((measurement.small_product_size - measurement.extra_small_product_size) / 2))*2,
@hip_range_small_start = (measurement.small_product_size - ((measurement.small_size - measurement.extra_small_product_size) / 2))*2,
@hip_range_small_end = (measurement.medium_product_size - ((measurement.medium_size - measurement.small_product_size) / 2))*2,
@hip_range_medium_start = (measurement.medium_product_size - ((measurement.medium_product_size - measurement.small_product_size) / 2))*2,
@hip_range_medium_end = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@hip_range_large_start = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@hip_range_large_end = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@hip_range_extra_large_start = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@hip_range_extra_large_end = (measurement.extra_large_product_size + (measurement.extra_large_product_size * 1.1)) *2

end

def get_bust_range(measurement)
#bust_range start: smaller - (diff)   end: bigger - (diff)
@bust_range_extra_small_start = (measurement.extra_small_product_size - (measurement.extra_small_product_size * 1.1)) *2,
@bust_range_extra_small_end = (measurement.small_product_size - ((measurement.small_product_size - measurement.extra_small_product_size) / 2))*2,
@bust_range_small_start = (measurement.small_product_size - ((measurement.small_size - measurement.extra_small_product_size) / 2))*2,
@bust_range_small_end = (measurement.medium_product_size - ((measurement.medium_size - measurement.small_product_size) / 2))*2,
@bust_range_medium_start = (measurement.medium_product_size - ((measurement.medium_product_size - measurement.small_product_size) / 2))*2,
@bust_range_medium_end = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@bust_range_large_start = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@bust_range_large_end = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@bust_range_extra_large_start = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@bust_range_extra_large_end = (measurement.extra_large_product_size + (measurement.extra_large_product_size * 1.1)) *2

end

def get_waist_range(measurement)
#waist_range start: smaller - (diff)   end: bigger - (diff)
@waist_range_extra_small_start = (measurement.extra_small_product_size - (measurement.extra_small_product_size * 1.1)) *2,
@waist_range_extra_small_end = (measurement.small_product_size - ((measurement.small_product_size - measurement.extra_small_product_size) / 2))*2,
@waist_range_small_start = (measurement.small_product_size - ((measurement.small_size - measurement.extra_small_product_size) / 2))*2,
@waist_range_small_end = (measurement.medium_product_size - ((measurement.medium_size - measurement.small_product_size) / 2))*2,
@waist_range_medium_start = (measurement.medium_product_size - ((measurement.medium_product_size - measurement.small_product_size) / 2))*2,
@waist_range_medium_end = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@waist_range_large_start = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@waist_range_large_end = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@waist_range_extra_large_start = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@waist_range_extra_large_end = (measurement.extra_large_product_size + (measurement.extra_large_product_size * 1.1)) *2
end

def get_length_range(measurement)
#hip_range start: smaller - (diff)   end: bigger - (diff)
@length_range_extra_small_start = (measurement.extra_small_product_size - (measurement.extra_small_product_size * 1.1)) *2,
@length_range_extra_small_end = (measurement.small_product_size - ((measurement.small_product_size - measurement.extra_small_product_size) / 2))*2,
@length_range_small_start = (measurement.small_product_size - ((measurement.small_size - measurement.extra_small_product_size) / 2))*2,
@length_range_small_end = (measurement.medium_product_size - ((measurement.medium_size - measurement.small_product_size) / 2))*2,
@length_range_medium_start = (measurement.medium_product_size - ((measurement.medium_product_size - measurement.small_product_size) / 2))*2,
@length_range_medium_end = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@length_range_large_start = (measurement.large_product_size - ((measurement.large_product_size - measurement.medium_product_size) / 2))*2,
@length_range_large_end = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@length_range_extra_large_start = (measurement.extra_large_product_size - ((measurement.extra_large_product_size - measurement.large_product_size) / 2))*2,
@length_range_extra_large_end = (measurement.extra_large_product_size + (measurement.extra_large_product_size * 1.1)) *2
end

def get_product_size(size)
  all_sizes.find { |individual_size| individual_size.size_name == size}
end

end
