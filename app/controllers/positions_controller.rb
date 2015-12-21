class PositionsController < ApplicationController
		def location
			
		respond_to do |format|
			format.json {render :json => {:message => "success"}}
		end

		if params["locations"]
			@locations = params["locations"].map {|hash| hash.inject({}) {|item,(k,v)| item[k.to_sym]=v;item}}
			puts @locations
			Event.update_location(@locations)
		end
	end
end
