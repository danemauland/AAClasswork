function range(start, end) {
    if (start === end) { return [start] };
    let rangeArray = [start];
    return rangeArray.concat(range((start + 1), end));
}

function sumRec(arr) {
    if (arr.length === 1) { return arr[0] };
    return arr[0] + sumRec(arr.slice(1, arr.length))
}

// function exponent(base, exp) {
//     if (exp === 0) 
//         { return 1 };
//     if (exp < 0) 
//         { return 1 / exponent(base, -exp)};
//     return base * exponent(base, (exp - 1));
// }

function exponent(base, exp) {
    if (exp === 0) { return 1 };
    if (exp < 0) { return 1 / exponent(base, -exp) };
    if (exp === 1) { return base; }
    if (exp % 2 === 0) { return exponent(base, exp / 2) ** 2 };
    return base * (exponent(base, (exp - 1) / 2)) ** 2;
}

function fibonacci(n) {
    if (n === 1) { return [1] };
    if (n === 2) { return [1, 1] };
    let fibArr = fibonacci(n - 1);
    fibArr.push(fibArr[fibArr.length - 1] + fibArr[fibArr.length - 2]);
    return fibArr;
}

function flatten(arr) {
    let flatArray = [];
    arr.forEach(function (ele) {
        if (Array.isArray(ele)) {
            flatArray = flatArray.concat(flatten(ele));
        } else {
            flatArray.push(ele)
        };
    });
    return flatArray;
}

function deepDub(arr) {
    let dupArray = []
    arr.forEach(function (ele) {
        if (Array.isArray(ele)) {
            dupArray.push(deepDub(ele));
        } else {
            dupArray.push(ele)
        }
    });
    return dupArray;
}

function bSearch(arr, target) {
    let midIndex = Math.floor(arr.length / 2)
    let mid = arr[midIndex]
    if (arr.length === 1) { return (arr[0] === target ? 0 : -1) }
    if (arr.length === 0) { return -1 }

    if (mid === target) { return midIndex; }
    else if (mid > target) { return bSearch(arr.slice(0, midIndex), target); }
    else {
        let result = bSearch(arr.slice(midIndex + 1, arr.length), target);
        if (result === -1) { return -1 };
        return midIndex + 1 + result
    };
}

function mergeSort(arr) {
    if (arr.length <= 1) { return arr };
    let midIndex = Math.floor(arr.length / 2);
    let left = arr.slice(0, midIndex);
    let right = arr.slice(midIndex, arr.length);
    let sortedLeft = mergeSort(left);
    let sortedRight = mergeSort(right);
    return merge(sortedLeft, sortedRight);
}

function merge(left, right) {
    let mergeArray = [];
    while (left.length > 0 && right.length > 0) {
        if (left[0] > right[0]) { mergeArray.push(right.shift()) }
        else { mergeArray.push(left.shift()) };
    }
    mergeArray = mergeArray.concat(left);
    mergeArray = mergeArray.concat(right);
    return mergeArray;
}

function subsets(arr) {
    if (arr.length <= 1) { return arr }
    let i = 0;
    let subs = [];
    let recSubs = subsets(arr.slice(1, arr.length))
    while (i < recSubs.length) {
        subs.push((recSubs[i]).unshift(arr[0]));
    };
    return subs.concat(recSubs)
};