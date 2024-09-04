//=========================================================================
// cordic.cpp
//=========================================================================
// @brief : A CORDIC implementation of sine and cosine functions.

#include "cordic.h"
#include <math.h>

#include <iostream>

//-----------------------------------
// cordic function
//-----------------------------------
// @param[in]  : theta - input angle
// @param[out] : s - sine output
// @param[out] : c - cosine output
void cordic(theta_type theta, cos_sin_type &s, cos_sin_type &c)
{

  // Start at vector of 0 degrees (pre-scale by limit of scaling factor
  // as NUM_ITER -> infinity since known number of iterations)
  cos_sin_type cur_cos = 0.60725;
  cos_sin_type cur_sin = 0.0;

  // 2^(-i) term in rotation matrix (for i = 0 -> 1)
  cos_sin_type scale_f = 1.0;

#ifdef FIXED_TYPE // fixed-point design
FIXED_STEP_LOOP:
  for (int step = 0; step < 20; step++)
  {
  }

#else // floating point design

FLOAT_STEP_LOOP:
  for (int step = 0; step < NUM_ITER; step++)
  {

    // Get sigma value (direction of rotation)
    int sigma = (theta > 0) ? 1 : -1;

    cos_sin_type old_cos = cur_cos;

    // Do rotation using equations from rotation matrix
    cur_cos = cur_cos - cur_sin * sigma * scale_f;
    cur_sin = old_cos * sigma * scale_f + cur_sin;

    // Get new angle from LUT (theta_i = arctan(2^(-i)))
    theta = theta - sigma * cordic_ctab[step];

    // Divide scale factor by 2
    scale_f = scale_f * 0.5;
  }

  // End result
  c = cur_cos;
  s = cur_sin;

#endif
}
