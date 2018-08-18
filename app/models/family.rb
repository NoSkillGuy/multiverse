class Family < ApplicationRecord
	has_many :people
	has_many :universes, through: :people

	def family_universe_power universe_id: nil
		return if universe_id.nil? || Universe.where(id: universe_id).first.nil?
		Person.where(family_id: self.id, universe_id: universe_id).pluck(:power).map{|x| x ? 1 : -1}.sum
	end

	def have_same_power_across_universes?
		return false if self.universes.uniq.count == 1
		universe_power_hash = {}
		Universe.all.each do |u|
			universe_power_hash[u.id] = family_universe_power universe_id: u.id
		end
		puts universe_power_hash
		universe_power_hash.values.uniq.count == 1
	end

	def balance_family
		universe_power_hash = {}
		Universe.all.each do |u|
			universe_power_hash[u.id] = family_universe_power universe_id: u.id
		end
		universe_power_settling_power = universe_power_hash.values.sum / universe_power_hash.values.size
		universe_power_hash.each do |universe_id, universe_power|
			number_of_people_added = universe_power_settling_power - universe_power
			power_of_the_people_added = number_of_people_added.positive?
			number_of_people_added.abs.times do 
				Person.create(universe_id: universe_id, family_id: self.id, power: power_of_the_people_added)
			end
		end
	end
end
