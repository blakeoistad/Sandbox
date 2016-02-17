//: Playground - noun: a place where people can play

import UIKit

// number of elements
var n = Int(readLine()!)

// read array
var arr = readLine()!.characters.split(" ").map(String.init)

// variable to hold the sum of the array elements
var sum = 0

for (var i = 0; i < n; i++) {
    // sum the array elements
    sum += Int(arr[i])!
}

// print the array elements
print(sum)

