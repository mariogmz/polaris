require 'spec_helper'

describe Recordatorio do
  let(:user) { User.new(email:"omar.ogp@hotmail.com", password:"omargarcia") }
  before do
    @r = user.recordatorios.build(fecha_prestamo:Date.today, fecha_entrega:Date.tomorrow, contacto:"Deer lord", concepto:"cd", detalle:"ninguno", regresado:false)
  end
  
  subject { @r }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:fecha_prestamo) }
  it { should respond_to(:fecha_entrega) }
  it { should respond_to(:contacto) }
  it { should respond_to(:concepto) }
  it { should respond_to(:detalle) }
  it { should respond_to(:regresado) }
  
  describe "when user_id is not present" do
    before { @r.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank contacto" do
    before { @r.contacto = " " }
    it { should_not be_valid }
  end
  describe "with blank concepto" do
    before { @r.concepto = " " }
    it { should_not be_valid }
  end
  describe "with blank detalle" do
    before { @r.detalle = " " }
    it { should be_valid }
  end
  describe "with no regresado" do
    before { @r.regresado = nil }
    it { should_not be_valid }
  end
end
