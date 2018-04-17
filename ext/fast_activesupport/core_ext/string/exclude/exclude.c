#include <ruby.h>
#include "../../../fast_activesupport_utils.h"

static VALUE rb_exclude(VALUE self, VALUE other) {
  long int other_length = RSTRING_LEN(other);
  long int self_length = RSTRING_LEN(self);
  char *other_str = RSTRING_PTR(other);
  char *self_str = RSTRING_PTR(self);

  long int i, j, found;

  if(other_length == 1) {
    for(i = 0; i < self_length; i++) {
      if(self_str[i] == other_str[0]) {
        return Qfalse;
      }
    }

    return Qtrue;
  } else {
    for(i = 0; i < self_length; i++) {
      if(self_str[i] == other_str[0]) {
        found = 1;

        for(j = 1; j < other_length; j++) {
          if(self_str[i+j] != other_str[j]) {
            found = 0;
            break;
          }
        }

        if(found) {
          return Qfalse;
        }
      }
    }

    return Qtrue;
  }

  return Qtrue;
}

void Init_exclude() {
  rb_define_method(rb_cString, method_name_for("exclude?"), rb_exclude, 1);
}
