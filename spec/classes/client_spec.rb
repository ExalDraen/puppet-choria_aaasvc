require 'spec_helper'

describe 'choria_aaasvc::client' do
  let(:pre_condition) { "class {'mcollective':  client => true, server => true, plugin_classes => []} " }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
