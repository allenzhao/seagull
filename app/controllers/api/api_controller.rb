class Api::ApiController < ApplicationController
  before_action :allow_cors
  before_action :require_system
  before_action :set_classroom
  skip_before_action :authenticate_user!
  # before_action :api_logger

  def require_system
    token = params[:token] || request.headers['X-Token']
    friends = {
        CFG['api_token']['records'] => :seagull
    }
    if token.blank? || friends[token].nil?
      render json: {error: '认证错误'}, status: :unauthorized
    end
  end

  def user_for_paper_trail
    token = params[:token] || request.headers['X-Token']
    CFG['api_token'].select { |key, hash| hash == token }.keys[0]
  end

  def startup
    if @class_room.present?
      @class_room.detail.present? ? render('api/current_status'): render('api/startup')
    else
      render json: {error: '不允许在当前机器签到，请联系管理员。'}, status: :bad_request
    end
  end

  protected

  def set_classroom
    @class_room = ClassRoom.where(IP: request.remote_ip).first.present?
  end

  private

  def allow_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
