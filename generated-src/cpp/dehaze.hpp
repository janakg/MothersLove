// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from motherslove.djinni

#pragma once

#include <memory>
#include <string>

namespace motherslove {

class Dehaze {
public:
    virtual ~Dehaze() {}

    static std::shared_ptr<Dehaze> create();

    virtual std::string dehaze(const std::string & uri, const std::string & media) = 0;
};

}  // namespace motherslove
