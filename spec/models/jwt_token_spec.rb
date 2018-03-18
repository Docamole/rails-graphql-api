require 'rails_helper'

RSpec.describe JwtToken, type: :model do
  it 'is valid with valid attributes' do
    expect(JwtToken.new).to be_valid
  end

  it 'should generate a token on initialization' do
    expect(JwtToken.new.token).not_to be_nil
  end

  it 'should return token expiration as a time' do
    expect(JwtToken.new.expiration).to be_a(Time)
  end
end
