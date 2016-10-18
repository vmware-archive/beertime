class LoggerJob
  include SuckerPunch::Job

  def perform(event)
    job_handler = JobHandler.new
    job_handler.handle(event)
    LoggerJob.perform_in(60, 'LoggerJob called from the Rails process.')
  end
end
