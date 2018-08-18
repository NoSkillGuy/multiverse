class Family < ApplicationRecord
	has_and_belongs_to :universes
	has_many :persons
end
