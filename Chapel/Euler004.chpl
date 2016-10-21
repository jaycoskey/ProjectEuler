// 004.chpl
// A palindromic number reads the same both ways.
// The largest palindrome made from the product of two 2-digit numbers
// is 9009 = 91 × 99.
// 
// Find the largest palindrome made from the product of two 3-digit numbers.

module Euler004 {

config const min3 = 100;
config const max3 = 999;

proc getMaxPalindrome(factorRange) {
  var maxPalindrome = -1;
  for p in palindromes(factorRange) {
    if (p > maxPalindrome) { maxPalindrome = p; }
  }
  return maxPalindrome;
}

proc isPalindrome(n) {
  var str = n: string;
  var len = str.length;
  for i in 1..(len / 2) {
    if (str[i] != str[len - i + 1]) {
        return false;
    }
  }    
  return true;
}

iter palindromes(factorRange) {
  for (i, j) in {factorRange, factorRange} {
    var k = i * j;
    if (isPalindrome(k)) { yield k; }
  }
}

proc main() {
  // test();
  writeln(getMaxPalindrome(min3 .. max3));
}

proc test() {
  const test_range = 10 .. 99;
  const test_result = 9009;

  assert(getMaxPalindrome(test_range) == test_result);
}

}

