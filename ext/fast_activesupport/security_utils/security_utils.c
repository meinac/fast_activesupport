#include <ruby.h>
#include "../fast_activesupport_utils.h"

static VALUE rb_sha256;
static ID id_hexdigest;

static int fixed_length_secure_compare(VALUE a, VALUE b) {
  long int a_length = RSTRING_LEN(a);
  long int b_length = RSTRING_LEN(b);

  if(a_length != b_length) {
    rb_raise(rb_eArgError, "string length mismatch.");
  }

  char *a_string = RSTRING_PTR(a);
  char *b_string = RSTRING_PTR(b);

  int res = 0, i;

  for(i = 0; i < a_length; i++) {
    res = res | (a_string[i] ^ b_string[i]);
  }

  return !res;
}

static VALUE rb_fixed_length_secure_compare(VALUE self, VALUE a, VALUE b) {
  Check_Type(a, T_STRING);
  Check_Type(b, T_STRING);

  return fixed_length_secure_compare(a, b) ? Qtrue : Qfalse;
}

static VALUE rb_secure_compare(VALUE self, VALUE a, VALUE b) {
  Check_Type(a, T_STRING);
  Check_Type(b, T_STRING);

  VALUE a_hex = rb_funcall(rb_sha256, id_hexdigest, 1, a);
  VALUE b_hex = rb_funcall(rb_sha256, id_hexdigest, 1, b);

  if(fixed_length_secure_compare(a_hex, b_hex)) {
    return rb_str_equal(a, b) ? Qtrue : Qfalse;
  }

  return Qfalse;
}

void Init_security_utils() {
  rb_require("digest");
  VALUE active_support = rb_define_module("ActiveSupport");
  VALUE security_utils = rb_define_module_under(active_support, "SecurityUtils");

  VALUE rb_mDigest = rb_path2class("Digest");
  rb_sha256 = rb_const_get(rb_mDigest, rb_intern("SHA256"));
  id_hexdigest = rb_intern("hexdigest");

  rb_define_method(security_utils, method_name_for("fixed_length_secure_compare"), rb_fixed_length_secure_compare, 2);
  rb_funcall(security_utils, rb_intern("module_function"), 1, rb_str_new2(method_name_for("fixed_length_secure_compare")));
  rb_define_method(security_utils, method_name_for("secure_compare"), rb_secure_compare, 2);
  rb_funcall(security_utils, rb_intern("module_function"), 1, rb_str_new2(method_name_for("secure_compare")));
}
