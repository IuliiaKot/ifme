# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

require 'spec_helper'

describe Group do
 	it "creates a group" do
 		new_group = create(:group, description: 'Test Description')
	  	expect(Group.count).to eq(1)
 	end
 	it "does not create a group" do
 		new_group = build(:group)
	  	expect(new_group).to have(1).error_on(:description)
 	end
end
