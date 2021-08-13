/// \file spitfire3d.h
/// \brief spitfire3d definitions
/// \author Sylvain Prigent
/// \version 0.1
/// \date 2020

#pragma once

#include "SObservable.h"

namespace SImg{

void spitfire3d_sv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz, float* denoised_image, const float& regularization, const float& weighting, const unsigned int& niter, const float& delta);
void spitfire3d_hv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz, float* denoised_image, const float& regularization, const float& weighting, const unsigned int& niter, const float& delta);

void spitfire3d_sv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz, float* denoised_image, const float& regularization, const float& weighting, const unsigned int& niter, const float& delta, bool verbose, SObservable* observable);
void spitfire3d_hv(float* noisy_image, unsigned int sx, unsigned int sy, unsigned int sz, float* denoised_image, const float& regularization, const float& weighting, const unsigned int& niter, const float& delta, bool verbose, SObservable* observable);

}