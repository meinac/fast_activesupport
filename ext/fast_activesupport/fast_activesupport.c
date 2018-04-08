#include <ruby.h>
#include <fast_activesupport_utils.h>
#include <security_utils.h>

static VALUE rb_is_fast(VALUE mod) {
  return Qtrue;
}

static VALUE rb_fast_prefix(VALUE mod) {
  return rb_str_new2(prefix());
}

void Init_fast_activesupport() {
  VALUE active_support = rb_define_module("ActiveSupport");

  rb_define_singleton_method(active_support, "is_fast?", rb_is_fast, 0);
  rb_define_singleton_method(active_support, "fast_prefix", rb_fast_prefix, 0);
  Init_security_utils();
}
