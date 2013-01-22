require 'spec_helper'

feature 'Application' do

  context '/' do
    it "renders" do
      visit "/"
    end
  end

end
