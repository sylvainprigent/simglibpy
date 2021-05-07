

"""Sparse and TV denoising denoising classes

Classes
-------
SpitfireDenoise

"""

import numpy as np
from .wrappers._spitfire_denoise import (py_spitfire_denoise)


class SpitfireDenoise:
    """Denoise an image using the sparse variation model

    Parameters
    ----------
    regularization: float
        Regularization parameter. It is express in power of 2
        (reg = pow(2, -regularization))
    weighting: float
        weighting parameter between the Hessian and Intensity term
        [0.6, 0.9, 1.0]
    model: str
        Regularization model (SV or HV)
    niter: int
        Maximum number of iterations
    """

    def __init__(self, regularization: float = 12, weighting: float = 0.6,
                 model: str = 'HV', niter: int = 200):
        self.regularization = regularization
        self.weighting = weighting
        self.iter = niter
        self.model = model
        self.denoised_ = None

    def run(self, image: np.array):
        im = image.astype(np.float32)
        im = image / np.amax(im)
        self.denoised_ = py_spitfire_denoise(im, self.regularization,
                                             self.weighting,
                                             self.model,
                                             self.iter, 1.0)
