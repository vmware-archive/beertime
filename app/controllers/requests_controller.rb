class RequestsController < ApplicationController
  def new
    @beers = Beer.all
    @request = Request.new
  end

  def create
    request = request_params[:request]
    return false unless request
    return false unless create_service.create(request[:beers].map(&:to_i))
    redirect_to(:requests)
  end

  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def destroy
    return false unless delete_service.delete(params[:id].to_i)
    redirect_to(:requests)
  end

  private

  def request_params
    params.permit(request: { beers: [] })
  end

  def create_service
    @create_service ||= RequestCreator.new
  end

  def delete_service
    @delete_service ||= RequestDeleter.new
  end
end
