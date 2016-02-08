require 'logger'
require 'pastel'

module Cc2git
  # A collection of utility methods.
  #
  # Heavily inspired by fastlane_core's Helper module.
  module Helper
    # A constant copy of the Pastel string coloring library.
    # @return [Pastel] string coloring library
    PASTEL = Pastel.new

    class << self
      # Gets the Logger instance used by this Helper.
      #
      # Logger output is colored based on severity of logging:
      #   DEBUG - magenta
      #   INFO - white
      #   WARN - yellow
      #   ERROR - red
      #   FATAL - bold red
      #
      # @return [Logger] Logger instance
      def log
        # Don't show any logs when in a test environment.
        is_test? ? @@log ||= Logger.new(nil) : @@log ||= Logger.new($stdout)

        @@log.formatter = proc do |severity, datetime, progname, msg|
          string = $VERBOSE ? "#{severity} [#{datetime.strftime('%Y-%m-%d %H:%M:%S.%2N')}]: " : "[#{datetime.strftime('%H:%M:%S')}]: "
          second = "#{msg}\n"
          if severity == 'DEBUG'
            string = PASTEL.magenta(string)
          elsif severity == 'INFO'
            string = PASTEL.white(string)
          elsif severity == 'WARN'
            string = PASTEL.yellow(string)
          elsif severity == 'ERROR'
            string = PASTEL.red(string)
          elsif severity == 'FATAL'
            string = PASTEL.red.bold(string)
          end
          "#{string}#{second}"
        end

        @@log
      end

      # Adds lines around log output.
      # @param text [String] text to output
      # @return [void]
      def log_alert(text)
        i = text.length + 8
        Helper.log.info(PASTEL.green('-' * i))
        Helper.log.info(PASTEL.green('--- ') + PASTEL.green(text) + PASTEL.green(' ---'))
        Helper.log.info(PASTEL.green('-' * i))
        nil
      end

      # Tests and returns if we're in a test environment.
      #
      # Supports RSpec, Cucumber, Minitest, and any other test library that provides a SpecHelper class or module.
      #
      # @return [Boolean] true if in test environment, false if not
      def is_test?
        return true unless defined?(RSpec).nil?
        return true unless defined?(Cucumber).nil?
        return true unless defined?(Minitest).nil?
        return true unless defined?(SpecHelper).nil?
        false
      end

      # Tests and returns whether or not we're in a CI environment.
      #
      # Supports Jenkins, Travis, and any other CI that exposes a 'CI' environment variable.
      #
      # @return [Boolean] true if in CI environment, false if not
      def is_ci?
        ENV.key?('JENKINS_URL') or ENV.key?('TRAVIS') or ENV.key?('CI')
      end

      # Path to the specified gem name. Returns the current working directory if it cannot be found.
      # @param gem_name [String] name of gem to find path
      # @return [String] directory of the specified gem or current working directory
      def gem_path(gem_name)
        if !Helper.is_test? and Gem::Specification.find_all_by_name(gem_name).any?
          Gem::Specification::find_by_name(gem_name).gem_dir
        else
          Dir.pwd
        end
      end
    end
  end
end