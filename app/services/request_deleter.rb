# frozen_string_literal: true
class RequestDeleter
  def delete(request_id)
    request = Request.find(request_id)
    request.destroy!
    true
  end
end
