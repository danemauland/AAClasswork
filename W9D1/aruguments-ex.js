// Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, 
// then rewrite your solution to use the ...rest operator.

// function sum() {
//     let total = 0;
//     for (let i = 0; i<arguments.length; i++) {
//         total += arguments[i]
//     };
//     return total;
// }
// argument= {0: 1, 1: 2, 2: 3, 3: 4} 

// function sum(...args) {
//     let total = 0;
//     for (let i = 0; i < args.length; i++) {
//         total += args[i]
//     };
//     return total;
// }

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

//--------------------------------------------------------

// Function.prototype.myBind = function () {
//     let context = arguments[0];
//     debugger;
//     let bindArgs = [].slice.call(arguments, 1, arguments.length);
//     let that = this;
//     return function () {
//         let callArgs = [].slice.call(arguments, 0, arguments.length);
//         return that.apply(context, bindArgs.concat(callArgs));
//     }
// }

Function.prototype.myBind = function (context, ...bindArgs) {
    let that = this;
    return function (...callArgs) {
        return that.apply(context, bindArgs.concat(callArgs));
    };
};

// class Cat {
//     constructor(name) {
//         this.name = name;
//     }
//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }
// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }
// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

//--------------------------------------------------------

// function curriedSum(numArgs) {
//     let numbers = [];
//     return function _curriedSum(arg) {
//         numbers.push(arg);
//         if (numbers.length === numArgs) {
//             return numbers.reduce(function(acc, ele) {
//                 return acc + ele;
//             })
//         }
//         return _curriedSum;
//     }
// }


// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56


//--------------------------------------------------------

Function.prototype.curry = function(numArgs) {
    let args = [];
    let that = this;
    return function _curry(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that.apply(this, args)
        }
        return _curry;
    }
}

Function.prototype.curry = function (numArgs) {
    let args = [];
    let that = this;
    return function _curry(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            return that.call(this, ...args)
        }
        return _curry;
    }
}

const dubs = function (a, b, c) {
    return (a + b + c) * 2;
};

const curriedSum = dubs.curry(3);
const result = curriedSum(1)(2)(3);
console.log(result); //12

