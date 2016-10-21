// 010.chpl
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// 
// Find the sum of all the primes below two million.

module Euler010 {

use EulerPrimes;
use EulerUtil;

config const maxPrime: int = 2000000;

proc getPrimeSum(maxPrime) {
  var primeSum = + reduce primesUpTo(maxPrime);
  return primeSum;
}

proc main() {
  // test();
  writeln(getPrimeSum(maxPrime));
}

proc test() {
  const test_maxPrime = 10;
  const test_result = 17;

  assert(getPrimeSum(test_maxPrime) == test_result);
}

}

