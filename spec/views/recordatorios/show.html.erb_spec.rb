require 'spec_helper'

describe "recordatorios/show" do
  before(:each) do
    @recordatorio = assign(:recordatorio, stub_model(Recordatorio,
      :user_id => 1,
      :contacto => "Contacto",
      :concepto => "Concepto",
      :detalle => "Detalle",
      :regresado => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Contacto/)
    rendered.should match(/Concepto/)
    rendered.should match(/Detalle/)
    rendered.should match(/false/)
  end
end
