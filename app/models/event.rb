class Event < ActiveRecord::Base
	after_create :set_default_order

	def set_default_order
		if !self.event_order
			self.event_order = 0
			save
		end
	end

	def self.update_location(locations)
		locations.each do |location|
			self.update(location[:id], :event_order => location[:pos])
		end
	end
end
