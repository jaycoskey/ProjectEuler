// 006.chpl
// The sum of the squares of the first ten natural numbers is,
//   1^2 + 2^2 + ... + 10^2 = 385
// 
// The square of the sum of the first ten natural numbers is,
//   (1 + 2 + ... + 10)^2 = 55^2 = 3025
//
// Hence the difference between the sum of the squares
// of the first ten natural numbers and the square of the sum is
//   3025 − 385 = 2640.
//
// Find the difference between the sum of the squares
// of the first one hundred natural numbers and the square of the sum.

module Euler006 {

config const max_006 = 100;

proc squareDiff(range) {
  var squareOfSums = (+ reduce range) ** 2;
  var sumOfSquares = + reduce (range ** 2);
  var diff = squareOfSums - sumOfSquares;
  return diff;
}

proc main() {
  // test();
  const min = 1;
  const max = max_006;

  writeln(squareDiff(min..max));
}

proc test() {
  const test_min = 1;
  const test_max = 10;
  const test_result = 2640;

  assert(squareDiff(test_min .. test_max) == test_result);
}

}

