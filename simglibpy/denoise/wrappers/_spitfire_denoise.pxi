cdef extern from "spitfire2d.h" namespace "SImg":

    void spitfire2d_sv(float* noisy_image, unsigned int sx, unsigned int sy, float* denoised_image,
                       const float& regularization, const float& weighting, const unsigned int& niter)

    void spitfire2d_hv(float* noisy_image, unsigned int sx, unsigned int sy, float* denoised_image,
                       const float& regularization, const float& weighting, const unsigned int& niter)


cdef extern from "spitfire3d.h" namespace "SImg":

    void spitfire3d_sv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz,
                       float* denoised_image, const float& regularization, const float& weighting,
                       const unsigned int& niter, const float& delta)

    void spitfire3d_hv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz,
                       float* denoised_image, const float& regularization, const float& weighting,
                       const unsigned int& niter, const float& delta)


cdef extern from "spitfire4d.h" namespace "SImg":

    void spitfire4d_sv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz,
                       unsigned int st, float* denoised_image, const float& regularization,
                       const float& weighting, const unsigned int& niter, const float& deltaz,
                       const float& deltat)

    void spitfire4d_hv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz,
                       unsigned int st, float* denoised_image, const float& regularization,
                       const float& weighting, const unsigned int& niter, const float& deltaz,
                       const float& deltat)