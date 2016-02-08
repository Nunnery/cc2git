require 'cc2git/version'

# Contains all of the modules and classes relevant to cc2git.
# @author Richard Harah
module Cc2git
  # The root path for Cc2git source code files.
  # @return [String] path to source code files
  ROOT = File.expand_path(File.dirname(__FILE__))
end

# Require all Ruby core extension classes automagically
Dir.glob(File.join(Cc2git::ROOT, 'cc2git', 'core_ext', '*.rb')).each do |file|
  require file
end

# Require autoload classes in order to ease compatibility
['autoload'].each do |file|
  require File.join(Cc2git::ROOT, 'cc2git', file)
end