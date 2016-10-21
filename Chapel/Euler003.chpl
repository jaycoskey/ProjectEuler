// 003.chpl
// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143 ?

module Euler003 {

use EulerPrimes;

config const num_003: int = 600851475143;

proc main() {
  // test();
  var pMax = largestPrimeFactor(num_003);
  writeln(pMax);
}

proc test() {
  assert(largestPrimeFactor(13195) == 29);
}

}

