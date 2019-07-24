# == Schema Information
#
# Table name: artists
#
#  id          :bigint           not null, primary key
#  name        :text
#  nationality :text
#  dob         :date
#  period      :text
#  image       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Artist < ActiveRecord::Base
end
