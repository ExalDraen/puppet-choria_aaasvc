require 'spec_helper'

describe 'choria_aaasvc' do
  let(:pre_condition) { "class {'choria':  manage_package_repo => true} " }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
