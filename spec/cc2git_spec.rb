RSpec.describe Cc2git do
  # Make sure that Cc2git::VERSION exists
  it { is_expected.to have_constant 'VERSION' }

  # Make sure that Cc2git::ROOT exists
  it { is_expected.to have_constant 'ROOT' }

  # Make sure that Cc2git::FOOBAR does not exist
  it { is_expected.to_not have_constant 'FOOBAR' }
end