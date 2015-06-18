var fact = spawn<factorial>();

var n = 100;
var result = start<double>(fact, n);

double naive = 1.0;
for (int i = 1; i <= n; i++)
    naive *= i;

console.write("Distributed: " + result);
console.write("Naive: " + naive);