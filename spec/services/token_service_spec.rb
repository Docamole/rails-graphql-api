require 'rails_helper'

RSpec.describe TokenService, type: :service do
  it 'generates an encoded token with no encryption' do
    token = TokenService.new(payload: 'puppies').encode.token
    expect(token).to_not eq(nil)
  end

  it 'generates an encoded token using HMAC algorithm' do
    token = TokenService.new(payload: 'puppies', algorithm: 'HS512').encode.token
    expect(token).to_not eq(nil)
  end

  it 'generates an encoded token using RSA algorithm' do
    token = TokenService.new(payload: 'puppies', algorithm: 'RS512').encode.token
    expect(token).to_not eq(nil)
  end

  it 'decodes an encoded token with no encryption' do
    payload = TokenService.new(payload: 'puppies').encode.decode.payload
    expect(payload).to eq('puppies')
  end

  it 'decodes an encoded token using HMAC algorithm' do
    payload = TokenService.new(payload: 'puppies', algorithm: 'HS256').encode.decode.payload
    expect(payload).to eq('puppies')
  end

  it 'decodes an encoded token using RSA algorithm' do
    payload = TokenService.new(payload: 'puppies', algorithm: 'RS256').encode.decode.payload
    expect(payload).to eq('puppies')
  end
end
