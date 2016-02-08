# Returns the expanded path to the specified file, auto-prepends source root
# @return [String] expanded path to file
# @private
def __p(path) File.join(Cc2git::ROOT, 'cc2git', *path.split('/')); end

module Cc2git
  autoload :Helper, __p('helper')
  autoload :Printing, __p('printing')
end