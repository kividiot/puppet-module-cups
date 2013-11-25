require 'spec_helper'
describe 'cups::client' do

  describe 'class puppet::client' do

    context 'Cups client configfile' do
      let(:facts) { { :osfamily => 'RedHat' } }

      it { should include_class('cups::client') }

      it { should contain_file('cups_client_conf').with({
          'path'    => '/etc/cups/client.conf',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
        })
      }
    end
  end
end
