let pattern = /^1[34578]\d{9}$/;

console.log(pattern.test("15079026985"));
console.log("15079026985".match(pattern));