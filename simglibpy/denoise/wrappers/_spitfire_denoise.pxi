cdef extern from "simglib/sdenoise":

    void SparseHessianVariationDenoising(float *IN_i, float *IN_o, int w, int h, const double regularization_parameter,
                                         const double weighting_parameter, const int nb_iterations, float Max_i)
