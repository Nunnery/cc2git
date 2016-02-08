RSpec.describe Cc2git::Printing do

  # Make sure that Cc2git::Printing::STATUS_PREFIX exists
  it { is_expected.to have_constant 'STATUS_PREFIX' }

  # Make sure that Cc2git::Printing::DEBUG_PREFIX exists
  it { is_expected.to have_constant 'DEBUG_PREFIX' }

  # Make sure that Cc2git::Printing::ERROR_PREFIX exists
  it { is_expected.to have_constant 'ERROR_PREFIX' }

  # Make sure that Cc2git::Printing::INTAKE_PREFIX exists
  it { is_expected.to have_constant 'INTAKE_PREFIX' }

  # Make sure that Cc2git::Printing::FOOBAR does not exist
  it { is_expected.to_not have_constant 'FOOBAR' }

  describe '::STATUS_PREFIX' do
    let(:prefix) { '>>>' }
    let(:pastel) { Pastel.new }
    let(:colored) { pastel.bright_green prefix }

    it 'is bright green' do
      expect(colored).to eq Cc2git::Printing::STATUS_PREFIX
    end
  end

  describe '::DEBUG_PREFIX' do
    let(:prefix) { '>>>' }
    let(:pastel) { Pastel.new }
    let(:colored) { pastel.bright_yellow prefix }

    it 'is bright yellow' do
      expect(colored).to eq Cc2git::Printing::DEBUG_PREFIX
    end
  end

  describe '::ERROR_PREFIX' do
    let(:prefix) { '>>>' }
    let(:pastel) { Pastel.new }
    let(:colored) { pastel.bright_red prefix }

    it 'is bright red' do
      expect(colored).to eq Cc2git::Printing::ERROR_PREFIX
    end
  end

  describe '::INTAKE_PREFIX' do
    let(:prefix) { '<<<' }
    let(:pastel) { Pastel.new }
    let(:colored) { pastel.bright_cyan prefix }

    it 'is bright cyan' do
      expect(colored).to eq Cc2git::Printing::INTAKE_PREFIX
    end
  end

end