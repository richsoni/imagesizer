require 'minitest/autorun'
require 'imageresize/resizer'

module ImageResizer
  class ImageTest < MiniTest::Unit::TestCase
  include Magick
    def img_path
      "#{Dir.pwd}/test/unit/Cheetah.jpg"
    end

    def img_list
      ImageList.new(img_path)
    end

    def img_raw
      File.read(img_path)
    end

    def img_magick
      @img_magick = Magick::Image.from_blob(img_raw).first
    end

    def test_magick_works
      img_list
      #This test will break if ImageMagick is broken
      assert_equal nil, nil
    end

    def test_size
      img_magick
      assert_equal @img_magick.columns, 225
      assert_equal @img_magick.rows, 225
    end
    def test_resize
      #image = Magick::Image.from_blob(@params['picture_file'].read).first
      image = Resizer.resize(img_raw, '400x300!')
      assert_equal image.columns, 400
      assert_equal image.rows, 300
    end

    def test_size_input_valid
      assert_equal Resizer.size_input_valid?('100x100'), true
      assert_equal Resizer.size_input_valid?('1x100'), true
      assert_equal Resizer.size_input_valid?('x100'), false
      assert_equal Resizer.size_input_valid?('axe'), false
    end
  end
end
