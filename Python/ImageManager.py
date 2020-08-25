import os
from PIL import Image
import gc


class ImageManager(object):
    # ************************************************* #
    # **************** Private Methods **************** #
    # ************************************************* #
    def __init__(self,
                 input_dir=None,
                 output_dir=None,
                 img_width=None,
                 img_height=None,
                 img_hw_acc_pixel=None,
                 out_ext=None):
        """ Constructor """

        # Global Variables
        self._input_dir = input_dir
        self._output_dir = output_dir
        self._img_res_dict = dict(width=img_width, height=img_height, hw_acc_pixel=img_hw_acc_pixel)
        self._out_ext = out_ext

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
        # Open image
        img = open(file, 'rb')
        raw_data = img.read()

        # Read image data
        img_data = Image.frombytes('L', (self._img_res_dict['width'], self._img_res_dict['height']), raw_data)

        # Close image
        img.close()

        return img_data

    # ************************************************* #
    # ***************** Public Methods **************** #
    # ************************************************* #

    def convert_images(self, show=False, save=False):
        """ Convert all raw images and convert them with the specified extension
            - show: if True show the raw image
            - save: if True save the image in the specified format
        """

        # Clear image list
        self._raw_images_list = []

        # List all raw images
        self._search_raw_images()

        for i, img in enumerate(self._raw_images_list):
            # Split name and extension of image
            (name, ext) = os.path.splitext(img)

            # Read raw data
            img_data = self._read_raw(self._input_dir +'/' +img)

            # Show Raw data
            if show is True:
                img_data.show(title=img)

            # Cut hw acceleration data
            if type(self._img_res_dict["hw_acc_pixel"]) is int:
                img_data = img_data.crop((0, 0, self._img_res_dict["width"] - self._img_res_dict["hw_acc_pixel"], self._img_res_dict["height"]))

            # Create output directory and save the images
            if save is True:
                try:
                    if not os.path.exists(self._output_dir):
                        os.mkdir(self._output_dir)
                except OSError:
                    print("Failed to create directory %s", self._output_dir)
                else:
                    img_data.save('{out_dir}/{name}{out_ext}'.format(out_dir=self._output_dir,
                                                                     name=name,
                                                                     out_ext=self._out_ext))

    @property
    def input_dir(self):
        return self._input_dir

    @input_dir.setter
    def input_dir(self, directory):
        self._input_dir = directory

    @property
    def output_dir(self):
        return self._output_dir

    @output_dir.setter
    def output_dir(self, directory):
        self._output_dir = directory

    @property
    def output_file_ext(self):
        return self._out_ext


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

