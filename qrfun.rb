$: << File.expand_path("./lib", __FILE__)
require 'commander'
require 'lib/vcard'
require 'lib/wifi'

module QRFun
  class Qrfun
    include Commander::Methods
    Version = "0.1-dev"

    def run
      program :name, 'QRfun'
      program :version, Version
      program :description, 'Ruby tool for some fun with QRCodes.'

      command :vcard do |cmd|
        cmd.syntax = 'vcard [options]'
        cmd.description = 'Create a QRcode based on a Vcard.'
        cmd.option '--file FILE', 'Yaml file to read vcard data from.'
        cmd.action do |_, options|
          a = QRFun::Vcard.new(options.file)

        end
      end
      command :wifi do |cmd|
        cmd.syntax = 'wifi [options]'
        cmd.description = 'Create a QRcode to scan with you smartphone to access your Wifi.'
        cmd.option '--ssid', 'The SSID of the Wireless Network'
        cmd.option '--pass', 'The Passphrase to access the Wireless network.'
        cmd.action do |_, options|
          a = QRfun::Wifi.new(options.ssid,options.pass)
        end
      end
    end
  end
end