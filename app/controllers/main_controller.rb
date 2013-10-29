require 'imageresize/resizer'
class MainController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def resize
    if params_valid?(params)
      image = ImageResizer::Resizer.resize(params['image'].tempfile.read, params['size'])
      if image
        send_data image.to_blob, :filename => 'resized_image.jpg'
      else
        raise 'Could Not Convert Image'
      end
    end
  end

  def params_valid?(params)
    unless params['image'] && params['size']
      raise 'Image and Size Required'
    end
    unless params['image'].tempfile
      raise 'image must be an actual file upload'
    end
    unless ImageResizer::Resizer.size_input_valid?(params['size'])
      raise 'Size Not Properly Formatted'
    end
    return true
  end
end
