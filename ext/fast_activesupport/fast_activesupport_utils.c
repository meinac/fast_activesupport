#include <ruby.h>

const char *prefix() {
  const char *prefix = getenv("FAST_PREFIX");

  if(prefix == NULL) {
    return "";
  }

  return prefix;
}

const char *method_name_for(const char *method_name) {
  if(strlen(prefix()) == 0) {
    return method_name;
  }

  char *new_method_name = malloc(strlen(method_name) + strlen(prefix()) + 2);

  strcpy(new_method_name, prefix());
  strcat(new_method_name, "_");
  strcat(new_method_name, method_name);

  return new_method_name;
}
