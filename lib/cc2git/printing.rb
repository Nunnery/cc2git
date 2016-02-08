require 'pastel'

module Cc2git
  module Printing

    private

    # Constant that holds Pastel object
    # @return [Pastel] Pastel object to color strings
    PASTEL = Pastel.new

    # String to prepend to any status messages
    # @return [String] prefix for status messages
    STATUS_PREFIX = PASTEL.bright_green('>>>')

    # String to prepend to any debug messages
    # @return [String] prefix for debug messages
    DEBUG_PREFIX = PASTEL.bright_yellow('>>>')

    # String to prepend to any error messages
    # @return [String] prefix for error messages
    ERROR_PREFIX = PASTEL.bright_red('>>>')

    # String to prepend to any intake messages
    # @return [String] prefix for intake messages
    INTAKE_PREFIX = PASTEL.bright_cyan('<<<')

    protected

    # Prints a status message to the console
    # @param [String] message message to print to the console
    # @return [void]
    def status(message = '')
      $stdout.puts "#{STATUS_PREFIX} #{message}"
      nil
    end

    # Prints a debug message to the console
    # @param [String] message message to print to the console
    # @return [void]
    def debug(message = '')
      $stdout.puts "#{DEBUG_PREFIX} #{message}"
      nil
    end

    # Prints an error message to the console
    # @param [String] message message to print to the console
    # @return [void]
    def error(message = '')
      $stderr.puts "#{ERROR_PREFIX} #{message}"
      nil
    end

    # Prints an intake message to the console
    # @param [String] message message to print to the console
    # @return [void]
    def intake(message = '')
      status message
      $stdout.print "#{INTAKE_PREFIX} "
      nil
    end
  end
end