class TokenService
  # Supported: HS256, HS512256, HS384, HS512, RS256, RS384, RS512
  # @return [String] The current encryption algorithm
  attr_accessor :algorithm

  # The payload to encode / decoded token
  # @return [String] Decoded payload
  attr_accessor :payload

  # Token to decode / encoded payload
  # @return [String] Encoded Token
  attr_accessor :token

  # Generated public key (RSA) / key for decoding
  # @return [String] RSA Public Key
  attr_accessor :public_key

  # @param payload [String] Payload to encode
  # @param algorithm [String] Encryption algorithm to use
  # @param public_key [String] RSA Public Key for decoding
  def initialize(payload: nil, algorithm: 'none', public_key: nil)
    @algorithm = algorithm
    @payload = payload
    @secret = Rails.application.secrets.secret_key_base
  end

  def encode
    @token = nil
    @public_key = nil
    case @algorithm
    when 'none'
      jwt_encode
    when 'HS256', 'HS512256', 'HS384', 'HS512'
      jwt_encode(@secret)
    when 'RS256', 'RS384', 'RS512'
      private_key = OpenSSL::PKey::RSA.generate 2048
      @public_key = private_key.public_key
      jwt_encode(private_key)
    end
    self
  end

  def decode
    @payload = nil
    case @algorithm
    when 'none'
      jwt_decode
    when 'HS256', 'HS512256', 'HS384', 'HS512'
      jwt_decode(@secret)
    when 'RS256', 'RS384', 'RS512'
      jwt_decode(@public_key)
    end
    self
  end

  private

  def jwt_encode(key = nil)
    @token = JWT.encode(@payload, key, @algorithm)
  end

  def jwt_decode(key = nil, encrypted = false)
    if encrypted
      @payload = JWT.decode(@token, @key, true, { algorithm: @algorithm })[0]
    else
      @payload = JWT.decode(@token, nil, false)[0]
    end
  end
end
