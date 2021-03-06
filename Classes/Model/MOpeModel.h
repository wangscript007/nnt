
# ifndef __NNT_MODEL_OPE_2BB4058CF12A42DEAE0A58D5F94A1D26_H_INCLUDED
# define __NNT_MODEL_OPE_2BB4058CF12A42DEAE0A58D5F94A1D26_H_INCLUDED

# include "Model.h"

# ifdef NNT_OBJC

NNT_BEGIN_HEADER_OBJC

@interface OperationModel : Model

@end

NNT_END_HEADER_OBJC

# ifdef NNT_CXX

NNT_BEGIN_HEADER_CXX
NNT_BEGIN_NS(ns)
NNT_BEGIN_NS(model)

class IOperation
{
public:
    
    virtual ~IOperation() {}
    virtual id run() = 0;
    
};

class Operation
: public ns::Model,
public IOperation
{
public:
    
    Operation();
    virtual ~Operation();
    
public:
    
    virtual bool process(id result);
    virtual id run();
    
};

NNT_END_NS
NNT_END_NS
NNT_END_HEADER_CXX

# endif
// end cxx

# endif
// end objc

# endif
