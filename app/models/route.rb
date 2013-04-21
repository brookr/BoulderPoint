class Route < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  attr_accessible :user_id, :problem_id, :notes
end
