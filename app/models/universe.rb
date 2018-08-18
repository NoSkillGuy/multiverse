class Universe < ApplicationRecord
	has_many :people
	has_many :families, through: :people
end
