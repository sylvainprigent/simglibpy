import pytest

import os
import numpy as np
from simglibpy import data
from simglibpy.denoise import SpitfireDenoise
from skimage.io import imread, imsave


def test_spitfire_hv_2d():

    image = data.celegans()

    regularization = pow(2, -2)
    weighting = 0.6
    model = 'HV'
    niter = 200
    filter_ = SpitfireDenoise(regularization, weighting, model, niter)
    res_image = filter_.run(image)

    dir_path = os.path.dirname(os.path.realpath(__file__))
    ref_file = os.path.join(dir_path, 'denoise_spitfire_hv_celegans.tif')
    # imsave(ref_file, res_image)
    ref_image = imread(ref_file)

    assert np.array_equal(res_image, ref_image)


def test_spitfire_sv_2d():

    image = data.celegans()

    regularization = pow(2, -2)
    weighting = 0.6
    model = 'SV'
    niter = 200
    filter_ = SpitfireDenoise(regularization, weighting, model, niter)
    res_image = filter_.run(image)

    dir_path = os.path.dirname(os.path.realpath(__file__))
    ref_file = os.path.join(dir_path, 'denoise_spitfire_sv_celegans.tif')
    # imsave(ref_file, res_image)
    ref_image = imread(ref_file)

    assert np.array_equal(res_image, ref_image)


def test_spitfire_hv_3d():

    image = data.pollen_poison_noise_blurred()

    regularization = pow(2, -4)
    weighting = 0.6
    model = 'HV'
    niter = 200
    filter_ = SpitfireDenoise(regularization, weighting, model, niter)
    res_image = filter_.run(image)

    dir_path = os.path.dirname(os.path.realpath(__file__))
    ref_file = os.path.join(dir_path, 'denoise_spitfire_hv_pollen.tif')
    # imsave(ref_file, res_image)
    ref_image = imread(ref_file)

    assert np.array_equal(res_image, ref_image)


def test_spitfire_sv_3d():

    image = data.pollen_poison_noise_blurred()

    regularization = pow(2, -4)
    weighting = 0.6
    model = 'SV'
    niter = 200
    filter_ = SpitfireDenoise(regularization, weighting, model, niter)
    res_image = filter_.run(image)

    dir_path = os.path.dirname(os.path.realpath(__file__))
    ref_file = os.path.join(dir_path, 'denoise_spitfire_sv_pollen.tif')
    # imsave(ref_file, res_image)
    ref_image = imread(ref_file)

    assert np.array_equal(res_image, ref_image)
