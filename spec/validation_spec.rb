require "spec_helper"
require "validation"

describe Validation do
  subject { Validation }

  it "load module" do
    subject.validate(integer: 5)
    expect(subject.private_methods.include?(:is_valid?)).to eq(true)
  end

  context "validate is integer" do
    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(integer: 5)).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(integer: "five")}.to raise_error("The input five does not match the rule integer")
      end
    end

    it "should return true" do
      expect(subject.validate(integer: 5)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(integer: "five")).to eq(false)
    end
  end

  context "validate is boolean" do
    it "should return true" do
      expect(subject.validate(boolean: true)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(boolean: "true")).to eq(false)
    end
  end

  context "validate is string" do
    it "should return true" do
      expect(subject.validate(string: "Matisyahu")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(string: 5)).to eq(false)
    end
  end

  context "validate is positive" do
    it "should return true" do
      expect(subject.validate(positive: 5)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(positive: -5)).to eq(false)
    end
  end

  context "validate is email" do
    it "should return true" do
      expect(subject.validate(email: "user@email.com")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(email: "useremail.com")).to eq(false)
    end
  end
end
