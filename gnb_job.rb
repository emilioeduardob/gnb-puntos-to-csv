  require "kiba"
  require 'kiba-common/destinations/csv'
  require_relative "gnb_source"
  require_relative "extract_number"

  module GnbJob
    module_function

    def setup(config)
      Kiba.parse do
        url = "https://www.beneficiosbancognb.com.py/experience/?categoria=-1"
        source GnbSource, url

        transform ExtractNumber, :puntos

        destination Kiba::Common::Destinations::CSV, filename: 'output.csv'
      end
    end
  end