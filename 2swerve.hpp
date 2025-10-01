#pragma once
#include "lifecycle.hpp"
#include "motor.hpp"

class SwerveDrive2Wheels: LifeCycle {
    SmartMotor &_right_a, &_left_a, &_right_b, &_left_b;
    
    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};