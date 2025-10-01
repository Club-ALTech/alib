#pragma once
#include "lifecycle.hpp"
#include "motor.hpp"

class MechanumDrive: LifeCycle {
    SmartMotor &_right_front, &_left_front, &_right_back, &_left_back;
    
    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};