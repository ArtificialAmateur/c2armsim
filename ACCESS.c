// ============================================================
//
// Simple user/password reverse engineering challenge made to
// to work in ARMSIM with functions.s C-to-ASM lib.
//
// Compile: `arm-linux-gnueabi-gcc -Wall -s -nostdlib -O3 -S ACCESS.c`
// Author:   Frank Tursi
// For:      Andor Programming Contest 2019
//
// ============================================================

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int weird_func(const char *s1, const char *s2)
{
	while (*s1 == *s2++)
		if (*s1++ == 0)
			return (0);
	return (*(unsigned char *)s1 - *(unsigned char *)--s2);
}

size_t funcinator(const char *str) {
	const char *s;

	for (s = str; *s; ++s)
		;
	return (s - str);
}

char *function4(char *to, const char *from)
{
	char *save = to;

	for (; (*to = *from) != '\0'; ++from, ++to);
	return(save);
}

int _start() {
  extern int _write(int arg1, char arg2[]);
  extern int _read(int arg1, char arg2[], int arg3);
  extern int _halt(void);

  char ACCESS_DENIED[] = "ACCESS DENIED\n";
  char user[64];
  char passwd[64];

  _write(1, "Input username: ");
  _read(0, user, 64);
  _write(1, "Input password: ");
  _read(0, passwd, 64);

  if (weird_func(user, "Hravishran")) {
    _write(1, ACCESS_DENIED);
    _write(1, "\nIncorrect username\n");
    _halt();
    return 1;
  }
  char buffer[funcinator(passwd) + 1];
  function4(buffer, passwd);
  int bs = funcinator(buffer);
  for (size_t i = 0; i < bs >> 1; i++) {
    char c = buffer[i];
    buffer[i] = buffer[bs - i - 1];
    buffer[bs - i - 1] = c;
  }

 if (!weird_func(buffer, "kr1k_5743b_dr4c1p")) {
    _write(1, "Correct!\n");
    _write(1, "Welcome back!\n");
    _write(1, passwd);
  } else {
    _write(1, ACCESS_DENIED);
    _write(1, "Incorrect password\n");
  }

  _halt();
  return 0;
}
