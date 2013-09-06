class Itinerary < ActiveRecord::Base
  belongs_to :city
  belongs_to :article
end
