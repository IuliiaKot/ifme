# == Schema Information
#
# Table name: supports
#
#  id           :integer          not null, primary key
#  userid       :integer
#  support_type :string(255)
#  support_ids  :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Support < ActiveRecord::Base
	attr_accessible :userid, :support_type, :support_ids
	validates_presence_of :userid, :support_type, :support_ids
	serialize :support_ids, Array
	validates :support_type, inclusion: %w(category mood trigger strategy)
	before_save :array_data

	def array_data
		if !self.support_ids.nil? && self.support_ids.is_a?(Array)
			self.support_ids = self.support_ids.collect{|i| i.to_i}
		end
	end
end
