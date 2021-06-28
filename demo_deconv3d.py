from simglibpy import deconv
from skimage.io import imread, imsave


image = imread('/Users/sprigent/Documents/code/simglib/simglibpy/simglibpy/data/pollen_poisson_noise_blurred.tif')

regularization = pow(2, -30)
weighting = 0.6
model = 'SV'
niter = 200
delta = 1.0
psf = imread('/Users/sprigent/Documents/code/simglib/simglibpy/simglibpy/data/pollen_psf.tif')

spitfir = deconv.spitfire.SpitfireDeconv(regularization, weighting,
                                         model, niter)
spitfir.run(image, psf)


imsave('deconv_pollen_SV.tif', spitfir.deconvolved_)

