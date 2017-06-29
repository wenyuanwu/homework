function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
    return `${this.owner} loves ${this.name}`;
};

const cat1 = new Cat("kelly", "King");
const cat2 = new Cat("quickly", "Queen");

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());


Cat.prototype.cuteStatement = function () {
    return `Everyone loves ${this.name}`;
}

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

Cat.prototype.meow = function(){
    console.log("meow");
};

cat1.meow();
cat2.meow();

cat1.meow = function(){
    console.log("hwaf");
};

cat1.meow();
cat2.meow();