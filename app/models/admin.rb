class Admin < ActiveRecord::Base
  validates :message, :presence => true
end
