include "_spitfire_denoise.pxi"

import  numpy as np
cimport numpy as np

np.import_array()

def py_spitfire_denoise_2d(np.ndarray[np.float32_t, ndim=2, mode='c'] image_in,
                        double regularization_parameter, double weighting_parameter,
                        str model, int nb_iterations):

    if image_in.ndim != 2:
        raise ValueError('Only 2D images are supported in the current implementation')

    cdef np.ndarray[np.float32_t, ndim=2, mode='c'] im_out = np.zeros((image_in.shape[0], image_in.shape[1]),
                                                                          dtype=np.float32)
    if model == 'SV':
        spitfire2d_sv(<float*> image_in.data, image_in.shape[0], image_in.shape[1], <float*> im_out.data,
                      regularization_parameter, weighting_parameter, nb_iterations)
    elif model == 'HV':
        spitfire2d_hv(<float*> image_in.data, image_in.shape[0], image_in.shape[1], <float*> im_out.data,
                          regularization_parameter, weighting_parameter, nb_iterations)
    else:
        raise ValueError('Model must be SV or HV')
    return im_out
