class Family < ApplicationRecord
	has_many :people
	has_many :universes, through: :people
end
