// 002.chpl
// Each new term in the Fibonacci sequence is generated
// by adding the previous two terms.
// By starting with 1 and 2, the first 10 terms will be:
//   1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
// By considering the terms in the Fibonacci sequence
// whose values do not exceed four million,
// find the sum of the even-valued terms.

module Euler002 {

use EulerUtil;

config const fib1: int = 1;
config const fib2: int = 2;
config const fibMax: int = 4000000;

iter fibs(f1: int, f2: int, fibMax) {
  var (fib, next) = (f1, f2);
  while (fib <= fibMax) {
    yield fib;
    (fib, next) = (next, fib + next);
  }
}

proc isEven(i: int) {
  return i % 2 == 0;
}

proc getFibSum(fib1, fib2, fibMax) {
  var evenFibs = filter(fibs(fib1, fib2, fibMax), isEven);
  var fibSum: int = + reduce evenFibs;
  return fibSum;
}

proc main() {
  // test();
  writeln(getFibSum(fib1, fib2, fibMax));
}

proc test() {
  const test_fibMax = 100;
  const test_result = 44;  // 2 + 8 + 34

  assert(getFibSum(fib1, fib2, test_fibMax) == test_result);
}

}

