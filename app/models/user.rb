class User
  include Mongoid::Document
  field :remember_token, type: String

  before_create :generate_remember_token

  embeds_many :videos

  private
  def generate_remember_token
    self.remember_token = SecureRandom.hex
  end
end
