#pragma once
#include "lifecycle.hpp"

class Timer: LifeCycle {
    public:
    Timer(unsigned long delay) {

    }

    virtual void begin() = 0;
    virtual void update() = 0;

    // the delta time since last update
    unsigned long delta() {

    }

    bool is_time() {
        
    }
};
