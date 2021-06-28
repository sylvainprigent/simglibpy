from simglibpy import deconv
from skimage.io import imread, imsave


image = imread('/Users/sprigent/Documents/code/simglib/simglibpy/simglibpy/data/celegans.tif')
#image = imread('/Users/sprigent/Documents/code/simglib/simglibpy/simglibpy/data/pollen_poisson_noise_blurred.tif')

niter = 40
psf_gauss = deconv.PSFGaussian((1.5, 1.5), image.shape)
psf_gauss.run()

imsave('deconv_psf.tif', psf_gauss.psf_)

rl = deconv.RichardsonLucy(niter)
rl.run(image, psf_gauss.psf_)

imsave('deconv_rl_celegans.tif', rl.deconvolved_)

