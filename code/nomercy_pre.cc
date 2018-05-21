#include <string>
#include <cstdio>
#include <vector>

#define random randooooom
#define null NULL

class string {
public:
    std::string base;

    string() {}

    string(const std::string &src) : base(src) {}

    string(const char *src): base(src) { }

    string operator + (const string &other) { return string(base + other.base); }

    int length() { return base.size(); }
    int ord(int i) { return static_cast<int>(base[i]); }
    string* substring(int beg, int end) {
        return new string(std::string(base.substr(beg, end-beg+1)));
    }
    int parseInt() {
        int ret;
        sscanf(base.c_str(), "%d", &ret);
        return ret;
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
    char buf[1024];
    fgets(buf, 1024, stdin);
    int ret;
    sscanf(buf, "%d", &ret);
    return ret;
}

inline string* __lib_getString() {
    char buf[1024];
    fgets(buf, 1024, stdin);
    return new string(buf);
}
