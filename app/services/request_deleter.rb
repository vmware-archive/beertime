# frozen_string_literal: true
class RequestDeleter
  def delete(request_id:)
    Request.destroy(request_id)
  end
end
