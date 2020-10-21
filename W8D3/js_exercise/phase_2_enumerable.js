Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    };
    return this;
};

Array.prototype.myMap = function (callback) {
    let mapArray = [];
    this.myEach(function (ele) {
        mapArray.push(callback(ele));
    });
    return mapArray;
};

Array.prototype.myReduce = function (callback, initialValue) {
    if (initialValue === undefined) { initialValue = this[0] };
    let acc = initialValue;
    this.slice(1, this.length).myEach(function (ele) {
        acc = callback(acc, ele);
    });
    return acc;
};

function whateverCallback(acc, ele) {
    return acc + ele;
};
