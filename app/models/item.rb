class Item < ActiveRecord::Base
  belongs_to :site
  belongs_to :location
  belongs_to :itype
  validates :site_id, :location_id, :itype_id, :presence => true
  attr_accessible :serial, :stockable, :site_id, :location_id, :itype_id
end
