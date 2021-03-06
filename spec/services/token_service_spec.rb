require 'rails_helper'

RSpec.describe TokenService, type: :service do
  it 'should generate an encoded token with no encryption' do
    token = TokenService.new(payload: 'puppies').encode.token
    expect(token).to_not eq(nil)
  end

  it 'should generate an encoded token using the HMAC algorithm' do
    token = TokenService.new(payload: 'puppies', algorithm: 'HS512').encode.token
    expect(token).to_not eq(nil)
  end

  it 'should generate an encoded token using the RSA algorithm' do
    token = TokenService.new(payload: 'puppies', algorithm: 'RS512').encode.token
    expect(token).to_not eq(nil)
  end

  it 'should decode an encoded token with no encryption' do
    payload = TokenService.new(payload: 'puppies').encode.decode.payload
    expect(payload).to eq('puppies')
  end

  it 'should decode an encoded token using the HMAC algorithm' do
    payload = TokenService.new(payload: 'puppies', algorithm: 'HS256').encode.decode.payload
    expect(payload).to eq('puppies')
  end

  it 'should decode an encoded token using the RSA algorithm' do
    payload = TokenService.new(payload: 'puppies', algorithm: 'RS256').encode.decode.payload
    expect(payload).to eq('puppies')
  end

  it 'should fail with an expired token' do
    jwt = TokenService.new(payload: 'puppies', algorithm: 'HS384', expires: 0).encode
    sleep(1)
    jwt = TokenService.new(token: jwt.token, algorithm: 'HS384').decode
    expect(jwt.payload).to eq(nil)
  end
end
