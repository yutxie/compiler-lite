#include <string>
#include <cstdio>
#include <vector>

class string {
public:
    std::string base;

    string(const std::string &src) : base(src) {}

    string(const char *src): base(src) { }

    string operator + (const string &other) {
        return string(base + other.base);
    }

};


void __lib_print(string* s) {
    fputs(s->base.c_str(), stdout);
}

void __lib_println(string* s) {
    puts(s->base.c_str());
}


string* __lib_toString(int i) {
    return new string(std::to_string(i));
}
