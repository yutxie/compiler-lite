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


inline void __lib_print(string* s) {
    fputs(s->base.c_str(), stdout);
}

inline void __lib_println(string* s) {
    puts(s->base.c_str());
}

inline string* __lib_toString(int i) {
    return new string(std::to_string(i));
}

inline int __lib_getInt() {
    int ret;
    scanf("%d", &ret);
    return ret;
}
