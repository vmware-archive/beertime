# frozen_string_literal: true
class RequestsController < ApplicationController
  def new
    @beers = Beer.all
    @request = Request.new
  end

  def create
    request = request_params[:request]
    if request && request[:beers]
      create_service.create(name: request[:name], beer_ids: request[:beers].map(&:to_i))
    end
    redirect_to(:requests)
  end

  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def destroy
    delete_service.delete(request_id: params[:id].to_i)
    redirect_to(:requests)
  end

  private

  def request_params
    params.permit(request: [:name, { beers: [] }])
  end

  def create_service
    @create_service ||= RequestCreator.new
  end

  def delete_service
    @delete_service ||= RequestDeleter.new
  end
end
