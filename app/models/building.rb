class Building < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :rooms
  has_many :floors
  has_many :entrances
  has_many :nicknames

  # This method returns the location id of the building's first entrance
  # Edit here if you want to change the entrance to interact with user's current location
  def loc_id
    Entrance.where(building_id: self.id).map {|e| Location.find(e.location_id)}
    #Entrance.where(building_id: self.id).first.location_id
  end

  def to_locations
    loc_id
  end

  def has_floorplan?
    return self.code_name == "Volen" || self.code_name == "SSC"
  end

  #def latitude
    #Location.find(self.loc_id).latitude
  #end

  #def longitude
    #Location.find(self.loc_id).longitude
  #end
end
