
require 'rqrcode'

module QRfun
  class Wifi
    attr_reader :data
    attr_accessor :file

    # @param [String] ssid
    # @param [String] passphrase
    def initialize(ssid, passphrase)
      @data = "WIFI:S:#{ssid};T:WPA;P:#{passphrase};;"
    end

    # @return [RQRCode::QRCode]
    def gen_qr
      RQRCode::QRCode.new(@data.to_s)
    end

    # @return [Integer]
    def save
      img = @data.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 400
      )

      begin
        IO.write("#{@file}.png", img.to_s)
      rescue StandardError => e
        puts e.message
      end
    end
  end
end



#save(gen_qr(wifi_str(ARGV[0],ARGV[1])),"wifi-#{ARGV[0]}")

