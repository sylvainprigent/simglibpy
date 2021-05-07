include "_spitfire_denoise.pxi"

import  numpy as np
cimport numpy as np

np.import_array()

def py_spitfire_denoise(np.ndarray[np.float32_t, ndim=2, mode='c'] image_in,
                        double regularization_parameter, double weighting_parameter,
                        string model,
                        int nb_iterations, float Max_i):

    if image_in.ndim == 2:

        cdef np.ndarray[np.float32_t, ndim=2, mode='c'] im_out = np.zeros((image_in.shape[0], image_in.shape[1]),
                                                                      dtype=np.float32)
        if model == 'SV':
            spitfire2d_denoise_sv(<float*> image_in.data, <float*> im_out.data, image_in.shape[0], image_in.shape[1],
                                  regularization_parameter, weighting_parameter, nb_iterations, Max_i)
        else if model == 'HV':
            spitfire2d_denoise_sv(<float*> image_in.data, <float*> im_out.data, image_in.shape[0], image_in.shape[1],
                                  regularization_parameter, weighting_parameter, nb_iterations, Max_i)
        else:
            raise ValueError('Model must be SV or HV')
        return im_out

    else:
        raise ValueError('Only 2D images are supported in the current implementation')
