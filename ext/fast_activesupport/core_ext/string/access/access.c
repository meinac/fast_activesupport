#include <ruby.h>
#include "../../../fast_activesupport_utils.h"

static VALUE rb_last(int argc, const VALUE *argv, VALUE self) {
  rb_check_arity(argc, 0, 1);
  long str_len = RSTRING_LEN(self);
  char *str = RSTRING_PTR(self);

  if (argc == 0) {
    return rb_str_new(&str[str_len - 1], 1);
  } else {
    long length = NUM2LONG(argv[0]);

    if(length >= str_len) {
      return rb_str_new(str, str_len);
    }

    return rb_str_substr(self, (str_len - length), length);
  }
}

static VALUE rb_first(int argc, const VALUE *argv, VALUE self) {
  rb_check_arity(argc, 0, 1);
  char *str = RSTRING_PTR(self);

  if (argc == 0) {
    return rb_str_new(&str[0], 1);
  } else {
    long length = NUM2LONG(argv[0]);
    long str_len = RSTRING_LEN(self);

    if(length >= str_len) {
      return rb_str_new(str, str_len);
    }

    return rb_str_new(str, length);
  }
}

void Init_access() {
  rb_define_method(rb_cString, method_name_for("first"), rb_first, -1);
  rb_define_method(rb_cString, method_name_for("last"), rb_last, -1);
}
