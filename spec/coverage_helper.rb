# encoding: utf-8
# Useful module to help loading all logstash content when
# running coverage analysis
module CoverageHelper

  ##
  # Skip list used to avoid loading certain patterns within
  # the logstash directories, this patterns are excluded becuause
  # of potential problems or because they are going to be loaded
  # in another way.
  ##
  SKIP_LIST = Regexp.union([
    /^lib\/bootstrap\/rspec.rb$/,
    /^lib\/logstash\/util\/prctl.rb$/
  ])

  def self.eager_load
    Dir.glob("lib/**/*.rb") do |file|
      next if file =~ SKIP_LIST
      require file
    end
  end

end
