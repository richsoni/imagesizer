require 'RMagick'
module ImageResizer
  class Resizer
    def self.resize(image_binary, size)
      image = Magick::Image.from_blob(image_binary).first
      image.change_geometry!(size){|cols, rows, i|  i.resize!(cols,rows) }
    end
    def self.size_input_valid?(size)
      regex = /[0-9]+[xX][0-9]+/
      size.match(regex) != nil
    end
  end
end
