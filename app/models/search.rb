class Search < ActiveRecord::Base

	belongs_to :user
	validates_uniqueness_of :term
	
end