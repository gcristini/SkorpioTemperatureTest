import os
from PIL import Image


class ImageManager(object):
    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self,
                 input_dir=None,
                 output_dir=None,
                 img_width=None,
                 img_height=None,
                 out_ext=None):
        """ Constructor """

        # Global Variables
        self._input_dir = input_dir
        self._output_dir = output_dir
        self._img_res = dict(width=img_width, height=img_height)
        self._out_ext = out_ext

        # TODO: delete if not used
        self._image_list_dict = []
        """ 
            'name': None,           # Name of image, without extension
            'ext': None,            # Image file extension
            'dir_path': None,       # Directory in which is stored the Image
            'res': None,            # Image resolution
            'img_data': None,       # Image data
        """

        self._raw_images_list = []

        pass

    def _search_raw_images(self):
        """ Search for raw images into directory """

        # List all .raw files in the directory
        for file in os.listdir(self._input_dir):
            if os.path.splitext(file)[1] == '.raw':
                self._raw_images_list.append(file)

        pass

    def _read_raw(self, file):
        """ Read a raw image """
        raw_data = open(file, 'rb').read()
        img_data = Image.frombytes('L', (self._img_res['width'], self._img_res['height']), raw_data)

        return img_data


    # ************************************************* #
    # ***************** Public Methods **************** #
    # ************************************************* #

    def convert_images(self, show=False, save=False):
        """ Convert all raw images and convert them with the specified extension
            - show: if True show the raw image
            - save: if True svae the image in the specified format
        """

        # List all raw images
        self._search_raw_images()

        for i, img in enumerate(self._raw_images_list):
            # Split name and extension of image
            (name, ext) = os.path.splitext(img)

            # Read raw data
            img_data = self._read_raw(self._input_dir + img)

            # Show Raw data
            if (show == True):
                img_data.show(title=img)

            # Populate the list of dictionary TODO: delete if not used
            self._image_list_dict.append(
                {
                    # ----- Input ----- #
                    'name': name,                           # Name of image, without extension
                    'ext': ext,                             # Image file extension
                    'input_dir_path': self._input_dir,      # Directory of raw Image
                    'res': self._img_res,                   # Image resolution
                    'img_data': img_data,                   # Image data
                    # ----- Output ----- #
                    'out_ext': self._out_ext,               # Extension of the saved image
                    'output_dir_path': self._output_dir,    # Directory in which will be saved the image
                }
            )

            # Create output directory and save the images
            if (save == True):
                try:
                    if not os.path.exists(self._output_dir):
                        os.mkdir(self._output_dir)
                except OSError:
                    print("Failed to create directory %s", self._output_dir)
                else:
                    img_data.save('{out_dir}/{name}{out_ext}'.format(out_dir=self._output_dir,
                                                                     name=name,
                                                                     out_ext=self._out_ext))


if __name__ == "__main__":

    cwd = os.getcwd()
    input_dir = '{cwd}/test/download/'.format(cwd=cwd)
    output_dir = '{cwd}/test/download_converted/'.format(cwd=cwd)

    test = ImageManager(input_dir=input_dir,
                        output_dir=output_dir,
                        img_width=1408,
                        img_height=960,
                        out_ext='.jpg'
                        )

    test.convert_images(show=False, save=True)

