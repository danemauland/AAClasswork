Array.prototype.uniq = function () {
    let uniqueArray = [];
    this.forEach( function(ele) {
        if (!uniqueArray.includes(ele)) { uniqueArray.push(ele) };
    });
    return uniqueArray;
}

Array.prototype.twoSum = function () {
    let twoSumArray = [];
    let i = 0;
    while (i < this.length) {
        let j = i + 1;
        while (j < this.length) {
            if (this[i] + this[j] === 0) {
                twoSumArray.push([i, j]);
            };  
            j++;
        }
        i++;
    };
    return twoSumArray;
}

Array.prototype.transpose = function () {
    let transposeArray = [];
    let i = 0;
    while (i < this[1].length) {
        let j = 0;
        transposeArray.push([]);
        while (j < this.length) {
            transposeArray[i].push(this[j][i]);
            j++;
        };
        i++;
    };
    return transposeArray;
};
