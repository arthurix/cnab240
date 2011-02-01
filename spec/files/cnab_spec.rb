require "spec_helper"

describe "Cnab240" do
  it "should include ActiveSupport" do
    Object.class_eval { const_defined?("ActiveSupport") }.should be_true
  end
  
  it "should raise an exception when :path options is nil" do
    lambda {
      Cnab240::Retorno.new
    }.should raise_exception(Exception)
  end
  
  it "should return an array" do
    cnab = Cnab240::Retorno.new(:path => File.dirname(__FILE__)+"/../../111109.TXT", :retorna => nil)
    cnab.linhas.should be_kind_of(Array)
  end

  context "Header file" do
    it "should parse the header file" do
      cnab = Cnab240::Retorno.new(:path => File.dirname(__FILE__)+"/../../111109.TXT", :retorna => 0)
      cnab.linhas.should be_kind_of(Array)
    end
  end
end