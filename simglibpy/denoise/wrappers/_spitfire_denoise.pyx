include "_spitfire_denoise.pxi"

import  numpy as np
cimport numpy as np

np.import_array()

def py_spitfire_denoise_2d(np.ndarray[np.float32_t, ndim=2, mode='c'] image_in,
                        double regularization_parameter, double weighting_parameter,
                        str model, int nb_iterations):

    if image_in.ndim != 2:
        raise ValueError('Only 2D images are supported by py_spitfire_denoise_2d')

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


def py_spitfire_denoise_3d(np.ndarray[np.float32_t, ndim=3, mode='c'] image_in,
                        double regularization_parameter, double weighting_parameter,
                        str model, int nb_iterations, double delta):

    if image_in.ndim != 3:
        raise ValueError('Only 3D images are supported by py_spitfire_denoise_3d')

    cdef np.ndarray[np.float32_t, ndim=3, mode='c'] im_out = np.zeros((image_in.shape[0],
                                                                       image_in.shape[1],
                                                                       image_in.shape[2]),
                                                                          dtype=np.float32)
    if model == 'SV':
        spitfire3d_sv(<float*> image_in.data, image_in.shape[0], image_in.shape[1],
                      image_in.shape[2], <float*> im_out.data, regularization_parameter,
                      weighting_parameter, nb_iterations, delta)
    elif model == 'HV':
        spitfire3d_hv(<float*> image_in.data, image_in.shape[0], image_in.shape[1],
                      image_in.shape[2], <float*> im_out.data, regularization_parameter,
                      weighting_parameter, nb_iterations, delta)
    else:
        raise ValueError('Model must be SV or HV')
    return im_out


def py_spitfire_denoise_4d(np.ndarray[np.float32_t, ndim=4, mode='c'] image_in,
                        double regularization_parameter, double weighting_parameter,
                        str model, int nb_iterations, double deltaz, double deltat):

    if image_in.ndim != 4:
        raise ValueError('Only 4D images are supported by py_spitfire_denoise_3d')

    cdef np.ndarray[np.float32_t, ndim=4, mode='c'] im_out = np.zeros((image_in.shape[0],
                                                                       image_in.shape[1],
                                                                       image_in.shape[2],
                                                                       image_in.shape[3]),
                                                                          dtype=np.float32)
    if model == 'SV':
        spitfire4d_sv(<float*> image_in.data, image_in.shape[0], image_in.shape[1],
                      image_in.shape[2], image_in.shape[3], <float*> im_out.data,
                      regularization_parameter, weighting_parameter, nb_iterations,
                      deltaz, deltat)
    elif model == 'HV':
        spitfire4d_hv(<float*> image_in.data, image_in.shape[0], image_in.shape[1],
                      image_in.shape[2], image_in.shape[3], <float*> im_out.data,
                      regularization_parameter, weighting_parameter, nb_iterations,
                      deltaz, deltat)
    else:
        raise ValueError('Model must be SV or HV')
    return im_out