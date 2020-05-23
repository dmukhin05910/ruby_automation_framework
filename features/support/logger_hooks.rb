require 'fileutils'
#Create reporting folders if non exist
Around() do |scenario,block|
  unless File.directory?('report/logs')
    FileUtils.mkdir_p('report/logs')
  end
  unless File.directory?('report/scr')
    FileUtils.mkdir_p('report/scr')
  end
  block.call
end
#Init logger with special format
Around() do |scenario, block|
  @file.truncate(0) if @file
  @file = File.new("report/logs/#{scenario.name}.log", "w")
  $logger = Logger.new MultiIO.new(STDOUT, @file)
  $logger.formatter = proc do |severity, datetime, progname, msg|
    fileLine = ""
    caller.each do |clr|
      unless (/\/logger.rb:/ =~ clr)
        fileLine = clr
        break
      end
    end
    #TODO change RubyTest/ when Mac
    fileLine = fileLine.split(':in `', 2)[0].partition('ruby_automation_framework/').last

    "[#{severity}], [#{datetime}]: #{msg} (#{fileLine})\n"
  end
  $logger.debug("Logger ran in file: \"report/logs/#{scenario.name}.log\"")
  $logger.info("Environment configurations:\n #{$env.to_yaml}")
  block.call
end
#Remove old logs
After() do |scenario|
  if scenario.failed?
    scenario.exception.backtrace.delete_if { |trace| trace.include? 'lib/ruby' }
    $logger.error("SCENARIO \"#{scenario.name}\" FAILED with Exception:\n #{scenario.exception.full_message}")
  else
    $logger.info("SCENARIO \"#{scenario.name}\" PASSED")
  end
  $logger.debug("Closing logger")
  @file.close
  @scenario_name = scenario.name
  Allure.add_attachment(name: "#{@scenario_name}",
                        source: File.open("report/logs/#{@scenario_name}.log"),
                        type: Allure::ContentType::TXT,
                        test_case: true)
end
#Class for multiple log output
class MultiIO
  def initialize(*targets)
    @targets = targets
  end

  def write(*args)
    @targets.each { |t| t.write(*args) }
  end

  def close
    @targets.each(&:close)
  end
end