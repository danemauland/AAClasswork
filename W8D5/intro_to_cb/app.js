// class Clock {
//   constructor() {
//     // 1. Create a Date object.
//     // 2. Store the hours, minutes, and seconds.
//     // 3. Call printTime.
//     // 4. Schedule the tick at 1 second intervals.
//     let date = new Date();
//     this.hours = date.getHours();
//     this.minutes = date.getMinutes();
//     this.seconds = date.getSeconds();
//     this.printTime()
//     setInterval(this._tick.bind(this), 1000)
//     }

//   printTime() {
//     // Format the time in HH:MM:SS
//     // Use console.log to print it.
//       console.log(`${this.hours} : ${this.minutes} : ${this.seconds}`);
//   }

//   _tick() {
//     // 1. Increment the time by one second.
//     // 2. Call printTime.
//     this.seconds++;
//     //   console.log(`time ${this.seconds++}`);

//     if (this.seconds === 60) {
//         this.minutes += 1;
//         this.seconds = 0;
//     };
//     if (this.minutes === 60) {
//         this.hours += 1;
//         this.minutes = 0;
//     };
//     if (this.hours === 24) {
//         this.hours = 0;
//     };

//     this.printTime();
//   };
  
// }
// const clock = new Clock();



//------------- 2 -----------------
// const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

// function addNumbers(sum, numsLeft, completionCallback){
//     // let 

//     if (numsLeft >0){
//         reader.question('Enter a number ', function(answer){
//             let num = parseInt(answer);
//             sum += num;
//             console.log(`The sum is ${sum}`);
//             addNumbers(sum, (numsLeft-1), completionCallback);
//         })
        
//     }else{
//         completionCallback(sum); 
//         reader.close();
//     }
// }

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


//------------- 3 -----------------
// const readline = require("readline");

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// // Write this first.
// function askIfGreaterThan(el1, el2, callback) {
//   // Prompt user to tell us whether el1 > el2; pass true back to the
//   // callback if true; else false.
//   reader.question(`Is ${el1} > ${el2}? : `, function(answer) {
//       if (answer === "yes") {
//           callback(true);
//       } else {
//           callback(false);
//       };
//   });
// }
// // askIfGreaterThan(0, 3, inp => console.log(`print input ${inp}`));

// // Once you're done testing askIfGreaterThan with dummy arguments, write this.
// function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
//   // Do an "async loop":
//   // 1. If (i == arr.length - 1), call outerBubbleSortLoop, //letting it know whether any swap was made.
//   // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i + 1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
//   //    continue the inner loop. You'll want to increment i for the
//   //    next call, and possibly switch madeAnySwaps if you did swap.
    
//     if (i == arr.length - 1) {
//         outerBubbleSortLoop(madeAnySwaps)
//     }else{
//         askIfGreaterThan(arr[i], arr[i+1],function(answer){
//             if (answer){
//                 madeAnySwaps = true;
//                 [arr[i], arr[i + 1]] = [arr[i+1], arr[i]];
//             }
//             innerBubbleSortLoop(arr, ++i, madeAnySwaps, outerBubbleSortLoop);
//         });
//     }
// } 
// // innerBubbleSortLoop([3, 1], 0, false, inp => console.log(`print input ${inp}`));
// // Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// // Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

// function absurdBubbleSort(arr, sortCompletionCallback) {
//     function outerBubbleSortLoop(madeAnySwaps) {
//       // Begin an inner loop if you made any swaps. Otherwise, call
//       // `sortCompletionCallback`.
//       if (madeAnySwaps) {
//           madeAnySwaps = false;
//           innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
//       } else {
//           sortCompletionCallback(arr)
//       }
//     }

// //   // Kick the first outer loop off, starting `madeAnySwaps` as true.
//     outerBubbleSortLoop(true);
// }

// absurdBubbleSort([3, 2, 1], function(arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });






//------------- my bind ------------



// Function.prototype.myBind = function(context){
//     return () => {  
//         this.apply(context)
//     }
// }

// class Lamp {
//     constructor() {
//         this.name = "a lamp";
//     }
// }

// const turnOn = function () {
//     console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"





// ----- myThrottle and myDebounce ------  //
// Function.prototype.myThrottle = function(interval) {
//     let tooSoon = false;
//     if (!tooSoon) {
//         tooSoon = true;
//         setTimeout(function(){
//             tooSoon = false;
//         }, interval)
//     }
// }

Function.prototype.myThrottle = function(interval) {
    let tooSoon = false;
    let that = this;
    return function() {
        if(!tooSoon) {
            tooSoon = true;
            setTimeout( function() {
                tooSoon = false;
            }, interval)
            that.call(this)
        }
    }
}

class Neuron {
  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);


// Using Function#myThrottle, we should be able to throttle
// the #fire function of our neuron so that it can only fire
// once every 500ms:

neuron.fire = neuron.fire.myThrottle(500);

const interval = setInterval(() => {
  neuron.fire();
}, 10);

interval