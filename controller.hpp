#pragma once
#include "lifecycle.hpp"

class Controller: LifeCycle {
    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};