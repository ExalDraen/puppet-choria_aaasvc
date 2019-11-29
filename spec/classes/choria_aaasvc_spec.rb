require 'spec_helper'

describe 'choria_aaasvc' do
  let(:common_params) do
    {
      'app_name' => 'chewy',
      'command' => 'scripts/chewy_main.py',
      'config_content' => 'App-config: foo; <%= $real_sol_router %>',
      'version' => 'chewy-1.37.0c',
      'owner' => 'dev',
      'root_dir' => '/usr/local/chewy',
      'repo_url' => 'http://repo.grass.corp/',
      'service_manage' => true,
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
