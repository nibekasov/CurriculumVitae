const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function gcd(a, b) {
  while (b !== 0) {
    let temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

rl.on('line', (input) => {
  const [a, b] = input.split(' ').map(Number);
  const result = gcd(a, b);
  console.log(result);
  rl.close();
});
