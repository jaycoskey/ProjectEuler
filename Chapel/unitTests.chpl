use EulerPrimes;
use EulerUtil;

use Euler001;
use Euler002;
use Euler003;
use Euler004;
use Euler005;
use Euler006;
use Euler007;
use Euler008;
use Euler009;
use Euler010;


// ===== Euler001 .. Euler010 =====
Euler001.test();
Euler002.test();
Euler003.test();
Euler004.test();
Euler005.test();
Euler006.test();
Euler007.test();
Euler008.test();
Euler009.test();
Euler010.test();


// ===== EulerPrimes =====

// isPrime
assert(isPrime(0) == false);
assert(isPrime(1) == false);
assert(isPrime(2) == true);
assert(isPrime(3) == true);
assert(isPrime(4) == false);

assert(isPrime(97) == true);
assert(isPrime(98) == false);
assert(isPrime(99) == false);
assert(isPrime(100) == false);
assert(isPrime(101) == true);


// largestPrimeFactor
assert(largestPrimeFactor(2) == 2);
assert(largestPrimeFactor(30) == 5);


// primesUpTo
iter primesUpTo20() {
  for i in [2,3,5,7,11,13,17,19] {
    yield i;
  }
}
var test_primes = primesUpTo20();
var lib_primes = primesUpTo(20);
assert(test_primes == lib_primes);


// ===== EulerUtil =====

var smallEvens = filter(1..10, isEven);
assert(smallEvens.size == 5);


// gcd
assert(gcd(0, 0) == 0);
assert(gcd(10, 0) == 10);
assert(gcd(0, 15) == 15);
assert(gcd(10, 15) == 5);


// lcm
assert(lcm(0, 0) == 0);
assert(lcm(10, 0) == 0);
assert(lcm(0, 15) == 0);
assert(lcm(10, 15) == 30);

writeln("All unit tests passed.");

