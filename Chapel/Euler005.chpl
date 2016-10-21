// 005.chpl
// 2520 is the smallest number that can be divided
// by each of the numbers from 1 to 10 without any remainder.
// 
// What is the smallest positive number that is evenly divisible
// by all of the numbers from 1 to 20?

module Euler005 {

use EulerUtil;

config const lower_005: int = 1;
config const upper_005: int = 20;
var minDivByRange_fast = -1;

proc getMinDivisibleByRange_fast(lower, upper) {
  var result = lower;
  var divisors = lower + 1 .. upper;
  for d in divisors {
    result = lcm(result, d);
  }
  return result;
}

proc getMinDivisibleByRange_slow(lower, upper) {
  var divisors = upper .. by upper;
  for i in divisors {
    if isDivisibleByRange(lower, upper, i) {
      return i;
    }
  }
  return -1;  // Avoid compiler error
}

proc isDivisibleByRange(lower, upper, n) {
  const indices : domain(1) = lower .. upper;
  var result = && reduce ([i in indices] (n % i == 0));
  return result;
}


proc main() {
  // test();
  minDivByRange_fast = getMinDivisibleByRange_fast(lower_005, upper_005); 
  writeln(minDivByRange_fast);
  // minDivByRange_slow = getMinDivisibleByRange_slow(lower_005, upper_005); 
  // writeln(minDivByRange_slow);
}

proc test() {
  const test_lower  = 1;
  const test_upper  = 10;
  const test_result = 2520;
  const expected_result = 232792560;

  // Slow
  var minDivisibleByRange_slow =
    getMinDivisibleByRange_slow(test_lower, test_upper);
  assert(minDivisibleByRange_slow == test_result);

  // Fast
  var minDivisibleByRange_fast =
    getMinDivisibleByRange_fast(test_lower, test_upper);
  assert(minDivisibleByRange_fast == test_result);
}

}

