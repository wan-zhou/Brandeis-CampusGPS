require 'minitest/autorun'

class PathEntry
  attr_reader :path_all

  def initialize
    locations = Location.all
    @hash_from = Hash.new
    @hash_to = Hash.new

    locations.each do |location|
      @hash_from[location] = Path.where(start_location_id: location.id).order(end_location_id: :asc)
      @hash_to[location] = Path.where(end_location_id: location.id).order(start_location_id: :asc)
    end

    paths = Path.order(start_location_id: :asc)
    @path_all = paths.map do |path|
      "#{Location.find(path.start_location_id).code_name} -> #{Location.find(path.end_location_id).code_name}"
    end
  end
end

describe PathEntry do
  it "is no less than locations" do
    (Path.count >= Location.count - 1).must_equal true
  end

  it "can be grouped" do
    Path.count.must_equal @hash_from.inject(0) {|sum, tuple| sum += tuple[1].size}
    Path.count.must_equal @hash_to.inject(0) {|sum, tuple| sum += tuple[1].size}
  end
end
