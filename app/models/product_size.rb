class ProductSize < ApplicationRecord
  SIZES = ["extra small", "small", "medium", "large", "extra large"]


  belongs_to :product
  validates :size_name, inclusion: {in: ["extra small", "small", "medium", "large", "extra large"] }


  def convert_product_size_data
    p self.product_id
    @all_sizes = ProductSize.where(product_id: self.product_id)
    @extra_small_product_size = get_product_size("extra small")
    @small_product_size = get_product_size("small")
    @medium_product_size = get_product_size("medium")
    @large_product_size = get_product_size("large")
    @extra_large_product_size = get_product_size("extra large")

    #self.hip_range = (@start, @end)
    get_hip_range
    get_bust_range
    get_waist_range
    get_length_range

    if size_name == "extra small"
      self.hip_range = @hip_range_extra_small_start.to_i...@hip_range_extra_small_end.to_i
      self.bust_range = @bust_range_extra_small_start.to_i...@bust_range_extra_small_end.to_i
      self.waist_range = @waist_range_extra_small_start.to_i...@waist_range_extra_small_end.to_i
      #self.length_range = @length_range_extra_small_start.to_i...@length_range_extra_small_end.to_i
      self.save
    elsif size_name == "small"
      self.hip_range = @hip_range_small_start.to_i...@hip_range_small_end.to_i
      self.bust_range = @bust_range_small_start.to_i...@bust_range_small_end.to_i
      self.waist_range = @waist_range_small_start.to_i...@waist_range_small_end.to_i
      #self.length_range = @length_range_small_start.to_i...@length_range_small_end.to_i
      self.save
    elsif size_name == "medium"
      self.hip_range = @hip_range_medium_start.to_i...@hip_range_medium_end.to_i
      self.bust_range = @bust_range_medium_start.to_i...@bust_range_medium_end.to_i
      self.waist_range = @waist_range_medium_start.to_i...@waist_range_medium_end.to_i
      #self.length_range = @length_range_medium_start.to_i...@length_range_medium_end.to_i
      self.save
    elsif size_name == "large"
      self.hip_range = @hip_range_large_start.to_i...@hip_range_large_end.to_i
      self.bust_range = @bust_range_large_start.to_i...@bust_range_large_end.to_i
      self.waist_range = @waist_range_large_start.to_i...@waist_range_large_end.to_i
      #self.length_range = @length_range_large_start.to_i...@length_range_large_end.to_i
      self.save
    elsif size_name == "extra large"
      self.hip_range = @hip_range_extra_large_start.to_i...@hip_range_extra_large_end.to_i
      self.bust_range = @bust_range_extra_large_start.to_i...@bust_range_extra_large_end.to_i
      self.waist_range = @waist_range_extra_large_start.to_i...@waist_range_extra_large_end.to_i
      #self.length_range = @length_range_extra_large_start.to_i...@length_extra_range_large_end.to_i
      self.save
    end

  end

private

def get_product_size(size)
  @all_sizes.find { |individual_size| individual_size.size_name == size}
end


def get_hip_range
#hip_range start: smaller - (diff)   end: bigger - (diff)
@hip_range_extra_small_start = (@extra_small_product_size.hip_measurement - (@extra_small_product_size.hip_measurement * 1.1)) *2
@hip_range_extra_small_end = (@small_product_size.hip_measurement - (@small_product_size.hip_measurement - @extra_small_product_size.hip_measurement / 2))*2
@hip_range_small_start = (@small_product_size.hip_measurement - ((@small_product_size.hip_measurement - @extra_small_product_size.hip_measurement) / 2))*2
@hip_range_small_end = (@medium_product_size.hip_measurement - ((@medium_product_size.hip_measurement - @small_product_size.hip_measurement) / 2))*2
@hip_range_medium_start = (@medium_product_size.hip_measurement - ((@medium_product_size.hip_measurement - @small_product_size.hip_measurement) / 2))*2
@hip_range_medium_end = (@large_product_size.hip_measurement - ((@large_product_size.hip_measurement - @medium_product_size.hip_measurement) / 2))*2
@hip_range_large_start = (@large_product_size.hip_measurement - ((@large_product_size.hip_measurement - @medium_product_size.hip_measurement) / 2))*2
@hip_range_large_end = (@extra_large_product_size.hip_measurement - ((@extra_large_product_size.hip_measurement - @large_product_size.hip_measurement) / 2))*2
@hip_range_extra_large_start = (@extra_large_product_size.hip_measurement - ((@extra_large_product_size.hip_measurement - @large_product_size.hip_measurement) / 2))*2
@hip_range_extra_large_end = (@extra_large_product_size.hip_measurement + (@extra_large_product_size.hip_measurement * 1.1)) *2
end

def get_bust_range
  p "get bust range"
#bust_range start: smaller - (diff)   end: bigger - (diff)
@bust_range_extra_small_start = (@extra_small_product_size.bust_measurement - (@extra_small_product_size.bust_measurement * 1.1)) *2
@bust_range_extra_small_end = (@small_product_size.bust_measurement - ((@small_product_size.bust_measurement - @extra_small_product_size.bust_measurement) / 2))*2
@bust_range_small_start = (@small_product_size.bust_measurement - ((@small_product_size.bust_measurement - @extra_small_product_size.bust_measurement) / 2))*2
@bust_range_small_end = (@medium_product_size.bust_measurement - ((@medium_product_size.bust_measurement - @small_product_size.bust_measurement) / 2))*2
@bust_range_medium_start = (@medium_product_size.bust_measurement - ((@medium_product_size.bust_measurement - @small_product_size.bust_measurement) / 2))*2
@bust_range_medium_end = (@large_product_size.bust_measurement - ((@large_product_size.bust_measurement - @medium_product_size.bust_measurement) / 2))*2
@bust_range_large_start = (@large_product_size.bust_measurement - ((@large_product_size.bust_measurement - @medium_product_size.bust_measurement) / 2))*2
@bust_range_large_end = (@extra_large_product_size.bust_measurement - ((@extra_large_product_size.bust_measurement - @large_product_size.bust_measurement) / 2))*2
@bust_range_extra_large_start = (@extra_large_product_size.bust_measurement - ((@extra_large_product_size.bust_measurement - @large_product_size.bust_measurement) / 2))*2
@bust_range_extra_large_end = (@extra_large_product_size.bust_measurement + (@extra_large_product_size.bust_measurement * 1.1)) *2

end

def get_waist_range
  p "get waist range"
#waist_range start: smaller - (diff)   end: bigger - (diff)
@waist_range_extra_small_start = (@extra_small_product_size.waist_measurement - (@extra_small_product_size.waist_measurement * 1.1)) *2
@waist_range_extra_small_end = (@small_product_size.waist_measurement - ((@small_product_size.waist_measurement - @extra_small_product_size.waist_measurement) / 2))*2
@waist_range_small_start = (@small_product_size.waist_measurement - ((@small_product_size.waist_measurement - @extra_small_product_size.waist_measurement) / 2))*2
@waist_range_small_end = (@medium_product_size.waist_measurement - ((@medium_product_size.waist_measurement - @small_product_size.waist_measurement) / 2))*2
@waist_range_medium_start = (@medium_product_size.waist_measurement - ((@medium_product_size.waist_measurement - @small_product_size.waist_measurement) / 2))*2
@waist_range_medium_end = (@large_product_size.waist_measurement - ((@large_product_size.waist_measurement - @medium_product_size.waist_measurement) / 2))*2
@waist_range_large_start = (@large_product_size.waist_measurement - ((@large_product_size.waist_measurement - @medium_product_size.waist_measurement) / 2))*2
@waist_range_large_end = (@extra_large_product_size.waist_measurement - ((@extra_large_product_size.waist_measurement - @large_product_size.waist_measurement) / 2))*2
@waist_range_extra_large_start = (@extra_large_product_size.waist_measurement - ((@extra_large_product_size.waist_measurement - @large_product_size.waist_measurement) / 2))*2
@waist_range_extra_large_end = (@extra_large_product_size.waist_measurement + (@extra_large_product_size.waist_measurement * 1.1)) *2
end

def get_length_range
  p "get length range"
#hip_range start: smaller - (diff)   end: bigger - (diff)
@length_range_extra_small_start = (@extra_small_product_size.length_measurement - (@extra_small_product_size.length_measurement * 1.1)) *2
@length_range_extra_small_end = (@small_product_size.length_measurement - ((@small_product_size.length_measurement - @extra_small_product_size.length_measurement) / 2))*2
@length_range_small_start = (@small_product_size.length_measurement - ((@small_product_size.length_measurement - @extra_small_product_size.length_measurement) / 2))*2
@length_range_small_end = (@medium_product_size.length_measurement - ((@medium_product_size.length_measurement - @small_product_size.length_measurement) / 2))*2
@length_range_medium_start = (@medium_product_size.length_measurement - ((@medium_product_size.length_measurement - @small_product_size.length_measurement) / 2))*2
@length_range_medium_end = (@large_product_size.length_measurement - ((@large_product_size.length_measurement - @medium_product_size.length_measurement) / 2))*2
@length_range_large_start = (@large_product_size.length_measurement - ((@large_product_size.length_measurement - @medium_product_size.length_measurement) / 2))*2
@length_range_large_end = (@extra_large_product_size.length_measurement - ((@extra_large_product_size.length_measurement - @large_product_size.length_measurement) / 2))*2
@length_range_extra_large_start = (@extra_large_product_size.length_measurement - ((@extra_large_product_size.length_measurement - @large_product_size.length_measurement) / 2))*2
@length_range_extra_large_end = (@extra_large_product_size.length_measurement + (@extra_large_product_size.length_measurement * 1.1)) *2
end


end
