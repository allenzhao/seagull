class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  allowed_domain = "@#{CFG['allowed_domain']}"
  validates :email, format: {with: /#{allowed_domain}/, message: '验证失败,不是内部用户'}
  attr_accessor :login

  def get_role_name
    I18n.translate self.roles.first.name
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    warden_conditions[:email] = "#{warden_conditions.delete(:login)}@#{CFG['allowed_domain']}"
    super(warden_conditions)
  end

end
