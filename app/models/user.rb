class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  allowed_domain = "@#{CFG['allowed_domain']}"
  validates :email, format: {with: /#{allowed_domain}/, message: '验证失败,不是内部用户'}
end
