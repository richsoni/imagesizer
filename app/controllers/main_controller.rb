require 'imageresize/resizer'
class MainController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def resize
    binding.pry
    if params_valid?
      image = Resizer.resize(@params['image'], @params['size'])
      send_data image, :filename => 'resized_image.jpg'
    end
  end

  def params_valid?
    @params['image'] && @params['size']
  end
end
