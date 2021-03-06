#ifndef EIGEN_HOUSEHOLDER_MODULE_H
#define EIGEN_HOUSEHOLDER_MODULE_H

#include "Core.hpp"

#include "src/Core/util/DisableStupidWarnings.h"

namespace Eigen {

/** \defgroup Householder_Module Householder module
  * This module provides Householder transformations.
  *
  * \code
  * #include <Eigen/Householder>
  * \endcode
  */

#include "src/Householder/Householder.h"
#include "src/Householder/HouseholderSequence.h"
#include "src/Householder/BlockHouseholder.h"

} // namespace Eigen

#include "src/Core/util/ReenableStupidWarnings.h"

#endif // EIGEN_HOUSEHOLDER_MODULE_H
/* vim: set filetype=cpp et sw=2 ts=2 ai: */
