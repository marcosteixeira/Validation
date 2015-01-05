require "spec_helper"
require "rules/is_email"

describe Validation::Rules::IsEmail do
  before { extend Validation::Rules::IsEmail }

  let(:valid_emails) {[
    'valid@email.com',
    'valid@email.com.uk',
    'e@email.com',
    'valid+email@email.com',
    'valid-email@email.com',
    'valid_email@email.com',
    'valid.email@email.com'
  ]}

  let(:invalid_emails) {[
    'invalid email@email.com',
    '.invalid.email@email.com',
    'invalid.email.@email.com',
    '@email.com',
    '.@email.com',
    'invalidemailemail.com',
    '@invalid.email@email.com',
    'invalid@email@email.com',
    'invalid.email@@email.com'
  ]}

  context "with valid params" do
    it "should return true" do
      valid_emails.each do |email|
        expect(is_valid?(email)).to eq(true)
      end
    end
  end

  context "with invalid params" do
    it "should return false" do
      invalid_emails.each do |email|
        expect(is_valid?(email)).to eq(false)
      end
    end
  end
end
