module EulerUtil {

// Note: Chapel lambdas cannot be iterators (i.e., contain a yield).
iter filter(itr, pred) {
    for i in itr {
        if pred(i) { yield i; }
    }
}

proc gcd(a, b): int {
  if (b == 0) { return a; }
  else { return gcd(b, a % b); } 
}

proc lcm(a, b) {
  if (a == 0 || b == 0) { return 0; }
  var g = gcd(a, b);
  return abs((a / g) * b);    
}

}

