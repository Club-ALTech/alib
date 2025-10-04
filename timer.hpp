#pragma once
#include "lifecycle.hpp"

using timestamp_ms = unsigned long;

class Timer : LifeCycle
{
    const timestamp_ms _delay;
    timestamp_ms _last_triggered, _now;

public:
    Timer(timestamp_ms delay, timestamp_ms now = 0)
        : _delay(delay), _last_triggered(0), _now(now)
    {
    }

    virtual void begin() = 0;
    virtual void update() {
        
    };

    // the delta time since last update
    timestamp_ms delta()
    {
        return this->_now - this->_last_triggered;
    }

    /**
     * @return number of steps that happened since last trigger
     */
    unsigned int is_time()
    {
        return this->delta()/this->_delay;
    }
};
