#include <ruby.h>
#include "fast_activesupport_utils.h"

static VALUE rb_is_fast(VALUE mod) {
  return Qtrue;
}

static VALUE rb_fast_prefix(VALUE mod) {
  return rb_str_new2(prefix());
}

void Init_fast_activesupport() {
  rb_define_singleton_method(ACTIVE_SUPPORT, "is_fast?", rb_is_fast, 0);
  rb_define_singleton_method(ACTIVE_SUPPORT, "fast_prefix", rb_fast_prefix, 0);
}
