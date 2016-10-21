
module EulerPrimes {

use EulerUtil;

// See http://stackoverflow.com/questions/15285534/
proc isPrime(n: int) {
    if (n == 2 || n == 3) { return true; }
    if (n < 2 || n % 2 == 0) { return false; } 
    if (n < 9) { return true; }
    if (n % 3 == 0) { return false; }
    var maxFactor = (n ** 0.5): int;
    var factor = 5;
    while (factor <= maxFactor) {
        if (n % factor == 0 || n % (factor + 2) == 0) { return false; }
        factor += 6;
    }
    return true;
}

// Possible performance gain:
// Cost: Need to track the value of prod.
// Benefit: Compute fewer primes.
// Analysis: Given the sparsity of primes, this is likely a performance win.
proc largestPrimeFactor(n: int) {
    var pMax = -2;
    var remainingProduct = n;
    for p in primesUpTo(n) {
        if (n % p == 0) {
            pMax = p;
            remainingProduct /= p;
            while (remainingProduct % p == 0) { remainingProduct /= p; }
        }
        if (remainingProduct == 1) { break; }
    } 
    assert(pMax > 0);
    return pMax;
}

iter primesUpTo(maxPrime: int) {
    for p in filter(0..maxPrime, isPrime) { yield p; }
}

}

