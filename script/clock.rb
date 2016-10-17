require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    job_handler = JobHandler.new
    job_handler.handle(job)
  end
  every(10.seconds, 'frequent.job')
end
