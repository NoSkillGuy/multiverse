class UniverseFamiliesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	def index
		@universe_families = universe.families
	end

	private
		def universe
			Universe.find(params['universe_id'])
		end
end