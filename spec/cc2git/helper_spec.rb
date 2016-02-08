RSpec.describe Cc2git::Helper do

  # Make sure that Cc2git::Helper::FOOBAR does not exist
  it { is_expected.to_not have_constant 'FOOBAR' }

  # Make sure that Cc2git::Helper::PASTEL exists
  it { is_expected.to have_constant 'PASTEL' }

  # Testing Cc2git::Helper.is_ci?
  describe '.is_ci?' do
    let(:travis) { ENV['TRAVIS'] }
    let(:jenkins_url) { ENV['JENKINS_URL'] }
    let(:ci) { ENV['CI'] }

    after(:each) do
      ENV['TRAVIS'] = travis
      ENV['JENKINS_URL'] = jenkins_url
      ENV['CI'] = ci
    end

    # Testing Jenkins support because it's environment variable based
    context 'when running on Jenkins' do
      before(:each) {
        ENV['TRAVIS'] = nil
        ENV['JENKINS_URL'] = 'http://build.tealcube.com/'
        ENV['CI'] = nil
      }
      it 'returns true' do
        expect(Cc2git::Helper.is_ci?).to eq true
      end
    end

    # Testing Travis support because it's environment variable based
    context 'when running on Travis' do
      before(:each) {
        ENV['TRAVIS'] = 'true'
        ENV['JENKINS_URL'] = nil
        ENV['CI'] = 'true'
      }
      it 'returns true' do
        expect(Cc2git::Helper.is_ci?).to eq true
      end
    end

    # Testing developer workstation because it's environment variable based
    context 'running on developer workstation' do
      before(:each) {
        ENV['TRAVIS'] = nil
        ENV['JENKINS_URL'] = nil
        ENV['CI'] = nil
      }
      it 'returns false' do
        expect(Cc2git::Helper.is_ci?).to eq false
      end
    end
  end

  # Testing Cc2git::Helper.is_test?
  # This is kind of hard to test because we're already running in RSpec...
  describe '.is_test?' do
    context 'when using RSpec' do
      it 'returns true' do
        expect(Cc2git::Helper.is_test?).to eq true
      end
    end
  end

  # Testing that Pastel actually colors Strings as expected
  describe '::PASTEL' do
    let(:message) { 'Hello, world!' }
    let(:pastel) { Pastel.new }
    let(:colored) { pastel.green message }

    it 'colors strings' do
      expect(colored).to eq Cc2git::Helper::PASTEL.green(message)
    end
  end

end