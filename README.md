ImageSizer Rails APP/API Demo

GUI
===========================
Demo is here:

API USAGE
===========================

Checking Words
---------------------------
REQUEST:
  * Type: [Post]
  * URL:  /resize
  * Params:
     - image: binary of image file (JPG only tested type)
     - size:  string in the following format "colxrow" e.g. /[0-9]+x[0-9]+/

RESPONCE:
  In this version all images returted in the jpg format.
  File will be: resized_image.jpg
Developer Installation
===========================

Dependencies
---------------------------
  + Ruby version >= 1.9.3
  + imagemagick  >= 6.8.7

Stability
---------------------------

  + Tested with listed dependency versions on Mac OS X 10.8.3
  + Ruby installed with RVM
  + imagemagick installed with homebrew

Testing
--------------------------

  + The resizer code resides in the ``` lib/imageresize/resizer.rb``` file.
  + To run the resizer unit tests do the following ``` ruby -I lib test/unit/test_image_resize.rb ```

