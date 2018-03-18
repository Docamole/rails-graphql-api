class JwtToken < ApplicationRecord
  after_initialize :init

  def init
    self.token      ||= service.encode.token
    self.expiration ||= service.expiration
  end

  private

  def service
    @service ||= TokenService.new
  end
end
