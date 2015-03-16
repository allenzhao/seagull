class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  allowed_domain = "@#{CFG['allowed_domain']}"
  validates :email, format: {with: /#{allowed_domain}/, message: '验证失败,不是内部用户'}
  attr_accessor :login
  has_one :team_member

  def get_role_name
    ''
  end

  def login=(login)
    @login = login
    self.email = "#{@login}@#{CFG['allowed_domain']}"
  end

  def login
    @login || self.email
  end

  protected
  def self.find_first_by_auth_conditions(warden_conditions)
    warden_conditions[:email] = "#{warden_conditions.delete(:login)}@#{CFG['allowed_domain']}"
    super(warden_conditions)
  end

end
