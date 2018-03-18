# JWT Token Service
# Handles encoding & decoding payloads using HMAC or RSA
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
  # @param token [String] Token to decode
  # @param algorithm [String] Encryption algorithm to use
  # @param public_key [String] RSA Public Key for decoding
  # @param expires [Time] Time from now to expire token (Default: 24.hours)
  def initialize(payload: nil, token: nil, algorithm: 'none', public_key: nil, expires: 24.hours)
    @algorithm = algorithm
    @expires = Time.now.to_i + expires.to_i
    @payload = payload
    @token = token
    @secret = Rails.application.secrets.secret_key_base
  end

  # Sets {#token} and {#public_key}(RSA) to encoded {#payload} using specified {#algorithm}
  # @example Encode a hash using RSA Encryption
  #   jwt   = TokenService.new(payload: { data: 'puppies' }, algorithm: 'RS512').encode
  #   token = jwt.token
  #   key   = jwt.public_key
  # @return [self]
  def encode
    @token = nil
    @public_key = nil
    case @algorithm
    when 'none'
      jwt_encode(nil)
    when 'HS256', 'HS512256', 'HS384', 'HS512'
      jwt_encode(@secret)
    when 'RS256', 'RS384', 'RS512'
      private_key = OpenSSL::PKey::RSA.generate 2048
      @public_key = private_key.public_key
      jwt_encode(private_key)
    end
    self
  end

  # Sets {#payload} to decoded {#token} using specified {#algorithm} and {#public_key}(RSA)
  # @example Decode an encrypted token using RSA
  #   jwt     = TokenService.new(token: 'your.jwt.token', algorithm: 'RS512', public_key: 'your-key').decode
  #   my_data = jwt.payload
  # @return [self]
  def decode
    @payload = nil
    case @algorithm
    when 'none'
      jwt_decode(nil)
    when 'HS256', 'HS512256', 'HS384', 'HS512'
      jwt_decode(@secret, true)
    when 'RS256', 'RS384', 'RS512'
      jwt_decode(@public_key, true)
    end
    self
  end

  # Expiration time of token
  # @return [Time] Token Expiration
  def expiration
    Time.at(@expires)
  end

  private

  def jwt_encode(secret)
    payload = {
      data: @payload,
      exp:  @expires
    }
    @token = JWT.encode(payload, secret, @algorithm)
  end

  def jwt_decode(public_key, encrypted=false)
    begin
      if encrypted
        @payload = JWT.decode(@token, public_key, true, { algorithm: @algorithm, exp_leeway: 0 })[0]['data']
      else
        @payload = JWT.decode(@token, nil, false, { exp_leeway: 0 })[0]['data']
      end
    rescue JWT::ExpiredSignature
      # Handle expired token
    end
  end
end
