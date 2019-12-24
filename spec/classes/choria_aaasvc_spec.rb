require 'spec_helper'

describe 'choria_aaasvc' do
  let(:pre_condition) { "class {'choria':  manage_package_repo => true} " }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:common_params) do
        {
          'ensure'               => 'present',
          'version'              => '0.2.1',
          'userlist_file'        => '/etc/aaasvc/users.json',
          'config_file'          => '/etc/aaasvc/config.json',
          'choria_config_file'   => '/etc/aaasvc/choria.cfg',
        }
      end

      context 'with defaults' do
        let(:params) do
          common_params
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/aaasvc/users.json').with_ensure('file') }
        it { is_expected.to contain_file('/etc/aaasvc/config.json').with_ensure('file') }
        it { is_expected.to contain_file('/etc/aaasvc/choria.cfg').with_ensure('file') }
        it { is_expected.to contain_package('aaasvc').with_ensure('0.2.1') }
      end

      context 'with ensure=absent' do
        let(:params) do
          common_params.merge('ensure' => 'absent')
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('aaasvc').with_ensure('absent') }
      end
    end
  end
end
