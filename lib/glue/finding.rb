require 'json'

class Glue::Finding
  attr_reader :task
  attr_reader :appname
  attr_reader :timestamp
  attr_reader :severity
  attr_reader :source
  attr_reader :description
  attr_reader :detail
  attr_reader :fingerprint

  def initialize appname, description, detail, source, severity, fingerprint, task
    @task = task
    @task.sub!(/^Glue::/, '') if @task

  	@appname = appname
    @timestamp = Time.now
  	@description = description
  	@detail = detail
  	@source = source
    @stringsrc = source.to_s
  	@severity = severity
    @fingerprint = fingerprint
  end

  def to_string
    s = "\n\tDescription: #{@description}"
      s << "\n\n\tTimestamp: #{@timestamp}"
      s << "\n\n\tSource: #{@stringsrc}"
      s << "\n\n\tSeverity: #{@severity}"
      s << "\n\n\tFingerprint:  #{@fingerprint}"
      s << "\n\n\tFound by:  #{@task}"
      s << "\n\n\tDetail:  #{@detail}"
  	s
  end

  def to_csv
    [@appname, @description, @timestamp, @source.to_s, @severity, @fingerprint, @detail]
  end

  def to_json
    json = {
     'task' => @task,
     'appname' => @appname,
     'description' => @description,
     'fingerprint' => @fingerprint,
     'detail' => @detail,
     'source' => @source,
     'severity' => @severity,
     'timestamp' => @timestamp
    }.to_json
    json
  end

end
