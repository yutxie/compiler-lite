#include <string>
#include <cstdio>

class string {
public:
    std::string base;

    string(const std::string &src) : base(src) {}

    string(const char *src): base(src) { }

    string operator + (const string &other) {
        return string(base + other.base);
    }

};

