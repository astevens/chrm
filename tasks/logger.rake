desc "switch rails logger to stdout"
task :verbose => [:environment] do
  Padrino.logger = Logger.new(STDOUT)
  Moped.logger = Logger.new($stdout)
end

desc "switch rails logger log level to debug"
task :debug => [:environment, :verbose] do
  Padrino.logger.level = Logger::DEBUG
  Moped.logger = Logger.new($stdout)
  Moped.logger.level = Logger::DEBUG
end
