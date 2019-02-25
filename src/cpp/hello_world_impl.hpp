#pragma once

#include "hello_world.hpp"

namespace motherslove {

    class HelloWorldImpl : public motherslove::HelloWorld {

    public:

        // Constructor
        HelloWorldImpl();

        // Our method that returns a string
        std::string get_hello_world();

        int add(int a, int b);

    };

}

