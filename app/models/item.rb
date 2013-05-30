# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  serial      :string(255)
#  site_id     :integer
#  location_id :integer
#  stockable   :boolean
#  itype_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :site
  belongs_to :location
  belongs_to :itype
  validates :site_id, :location_id, :itype_id, :presence => true
  attr_accessible :serial, :stockable, :site_id, :location_id, :itype_id
end
