function factorial() {
   let n = prompt("ведіть число:");
n=Number(n);
let factorial = 1;
let i = 1;
while (i <= n) {
  factorial *= i;
  i++;
}
console.log("факторіал числа"+ n + " = " + factorial);