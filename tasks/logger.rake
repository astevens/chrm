desc "switch rails logger to stdout"
task :verbose => [:environment] do
  Padrino.logger = Logger.new(STDOUT)
  Sequel::Model.db.logger = Padrino.logger
end

desc "switch rails logger log level to debug"
task :debug => [:environment, :verbose] do
  Padrino.logger.level = Logger::DEBUG
end
