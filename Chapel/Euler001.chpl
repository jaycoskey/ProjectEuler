// 001.chpl
// If we list all the natural numbers below 10 that are multiples of 3 or 5,
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
// Find the sum of all the multiples of 3 or 5 below 1000.

module Euler001 {

use EulerUtil;

config const upper_001: int = 1000;

proc fizzBuzzPred(i: int) {
  return (i % 3 == 0 || i % 5 == 0);
}

// This attempt at a lambda leads to a non-specific error message.
// var fizzBuzzPred_lambda = lambda(i: int) {
//   return (i % 3 == 0 || i % 5 == 0);
// }

proc getFizzBuzzSum(range) {
  var result: int = + reduce filter(range, fizzBuzzPred);
  return result;
}

proc main() {
  // test();
  const lower: int = 3;

  writeln(getFizzBuzzSum(lower .. upper_001 - 1));
}

proc test() {
  const test_lower = 3;
  const test_upper = 10;
  const test_result = 23;

  assert(getFizzBuzzSum(test_lower .. test_upper - 1) == test_result);
}

}

