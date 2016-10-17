require './config/boot'
require './config/environment'

LoggerJob.perform_in(15, "LoggerJob called from the Rails initializer.")
