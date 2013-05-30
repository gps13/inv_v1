# == Schema Information
#
# Table name: itypes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Itype < ActiveRecord::Base
  attr_accessible :name
	has_many :items
end
