require 'spec_helper'

describe "recordatorios/new" do
  before(:each) do
    assign(:recordatorio, stub_model(Recordatorio,
      :user_id => 1,
      :contacto => "MyString",
      :concepto => "MyString",
      :detalle => "MyString",
      :regresado => false
    ).as_new_record)
  end

  it "renders new recordatorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recordatorios_path, "post" do
      assert_select "input#recordatorio_user_id[name=?]", "recordatorio[user_id]"
      assert_select "input#recordatorio_contacto[name=?]", "recordatorio[contacto]"
      assert_select "input#recordatorio_concepto[name=?]", "recordatorio[concepto]"
      assert_select "input#recordatorio_detalle[name=?]", "recordatorio[detalle]"
      assert_select "input#recordatorio_regresado[name=?]", "recordatorio[regresado]"
    end
  end
end
