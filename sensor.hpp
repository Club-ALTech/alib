#pragma once
#include "lifecycle.hpp"

class Sensor: LifeCycle {
    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};