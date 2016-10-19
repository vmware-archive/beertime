class RequestsController < ApplicationController
  def new
    @beers = Beer.all
    @request = Request.new
  end

  def create
    request = request_params[:request]
    return false unless request
    return false unless service.create(request[:beers].map(&:to_i))
    redirect_to(:requests)
  end

  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def destroy
  end

  private

  def request_params
    params.permit(request: { beers: [] })
  end

  def service
    @service ||= RequestCreator.new
  end
end
