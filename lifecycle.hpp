#pragma once

class LifeCycle {
    public: 
    ~LifeCycle() {};
    virtual void begin() = 0;
    virtual void update() = 0;
};