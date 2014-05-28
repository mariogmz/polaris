require 'spec_helper'

describe "recordatorios/index" do
  before(:each) do
    assign(:recordatorios, [
      stub_model(Recordatorio,
        :user_id => 1,
        :contacto => "Contacto",
        :concepto => "Concepto",
        :detalle => "Detalle",
        :regresado => false
      ),
      stub_model(Recordatorio,
        :user_id => 1,
        :contacto => "Contacto",
        :concepto => "Concepto",
        :detalle => "Detalle",
        :regresado => false
      )
    ])
  end

  it "renders a list of recordatorios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Contacto".to_s, :count => 2
    assert_select "tr>td", :text => "Concepto".to_s, :count => 2
    assert_select "tr>td", :text => "Detalle".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
