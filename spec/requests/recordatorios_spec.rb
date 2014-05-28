require 'spec_helper'

describe "Recordatorios" do
  describe "GET /recordatorios" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get recordatorios_path
      response.status.should be(200)
    end
  end
end
