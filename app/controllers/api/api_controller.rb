class Api::ApiController < ApplicationController
  before_action :allow_cors
  before_action :require_system
  skip_before_action :authenticate_user!
  # before_action :api_logger

  def require_system
    token = params[:token] || request.headers['X-Token']
    friends = {
        CFG['api_token']['records'] => :seagull
    }
    if token.blank? || friends[token].nil?
      render json: {error: 'You need to auth yourself.'}, status: :unauthorized
    end
  end

  def user_for_paper_trail
    token = params[:token] || request.headers['X-Token']
    CFG['api_token'].select { |key, hash| hash == token }.keys[0]
  end

  def startup
    render json: {data: 'haha'}
  end

  private

  def allow_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
