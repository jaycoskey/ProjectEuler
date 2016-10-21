// 009.chpl
// A Pythagorean triplet is a set of three natural numbers,
// a < b < c, for which, a^2 + b^2 = c^2
// 
// For example, 32 + 42 = 9 + 16 = 25 = 52.
// 
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

module Euler009 {

use Math;

config const targetSum = 1000;
const oneThird = targetSum / 3;

iter solutionStrings() {
  for a in 1 .. oneThird {
    var maxB = divfloor(targetSum - a - 1, 2): int;
    for b in a + 1 .. maxB {
      var c = targetSum - a - b;
      if (c*c == a*a + b*b) {
        yield("a,b,c = %i,%i,%i".format(a, b, c));
      }
    }
  }
}

proc main() {
  // test();
  for s in solutionStrings() {
    writeln(s);
  }
}

proc test() {
  var itr = solutionStrings();
  var numSolutions = itr.size;
  assert(numSolutions == 1);
}

}

