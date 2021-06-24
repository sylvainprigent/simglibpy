cdef extern from "simglib/sdenoise/spitfire2d.h" namespace "SImg":

    void spitfire2d_sv(float* noisy_image, unsigned int sx, unsigned int sy, float* denoised_image,
                       const float& regularization, const float& weighting, const unsigned int& niter)

    void spitfire2d_hv(float* noisy_image, unsigned int sx, unsigned int sy, float* denoised_image,
                       const float& regularization, const float& weighting, const unsigned int& niter)
