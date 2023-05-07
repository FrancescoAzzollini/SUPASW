#!/usr/bin/env python
import sys
import cv2

def converter(filename, outputname):
	input_file = string(filename)
	# Load .png image
	image = cv2.imread(filename)

	# Save .jpg image
	return cv2.imwrite(outputname, image, [int(cv2.IMWRITE_JPEG_QUALITY), 100])



if __name__ == '__main__':
    input_file = sys.argv[1]
    output_file = sys.argv[2]
	converter(input_file, output_file)