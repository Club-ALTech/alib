#pragma once
#include "lifecycle.hpp"
#include "sensor.hpp"

class Motor: LifeCycle {
    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};

class SmartMotor: LifeCycle {
    Motor &_motor;
    Sensor &_encoder;

    public: 
    virtual void begin() = 0;
    virtual void update() = 0;
};