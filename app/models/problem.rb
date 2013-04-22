class Problem < ActiveRecord::Base
  belongs_to :account
  attr_accessible :account_id, :name, :points
end
