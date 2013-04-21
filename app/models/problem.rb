class Problem < ActiveRecord::Base
  belongs_to :account
  attr_accessible :name, :points
end
