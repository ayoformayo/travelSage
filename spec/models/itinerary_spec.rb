require 'spec_helper'
describe Itinerary do
  context 'database relations' do
    it {should belong_to(:city)}
    it {should belong_to(:article)}
  end
end
