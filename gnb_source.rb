require 'open-uri'
require 'nokogiri'

class GnbSource
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def each
    doc = Nokogiri.HTML5(URI.open(url))

    doc.css('div[data-vista]').each do |dato|
      nombre = dato.at("div.bottom-left").text.strip
      puntos = dato.at("#puntos")&.text
      yield(
        nombre: nombre,
        puntos: puntos
      )
    end
  end
end