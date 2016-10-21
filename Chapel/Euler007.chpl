// 007.chpl
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
// we can see that the 6th prime is 13.
//
// What is the 10,001st prime number?

module Euler007 {

use EulerPrimes;
use EulerUtil;

config const numPrimes = 10001;

proc nthPrime(n: int) {
  if (n < 1) {
    return -2;
  }
  var count = 0;
  for p in primes() {
    count += 1;
    if (count == n) {
      return p;
    }
  }
  return -2;  // Avoid compiler error
}

iter primes() {
  for p in filter(2 .., isPrime) {
    yield p;
  }
}

proc main() {
  // test();
  var result = nthPrime(numPrimes);
  writeln(result);
}

proc test() {
  var test_numPrimes = 6;
  var test_result = 13;

  assert(nthPrime(test_numPrimes) == test_result);
}

}

