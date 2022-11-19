//
//  main.swift
//  Collection array set dictionary
//
//  Created by Harsha R Mundaragi on 29/08/22.
//



// ARRAY's






// Array input from User

/*
print("enter the array size")
var s = Int(readLine()!)!

var ary = [Int]()

print("enter the arry elements")

for i in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}
print(ary)
*/



// Find the largest and smallest element in an array.

/*
print("enter array size")
var s = Int(readLine()!)!
var tem = [Int]()
var numary = [Int]()

print("enter arry elements")
for i in stride(from: 0, to: s, by: 1)
{
    numary.insert(Int(readLine()!)!, at: i)
}

print("array elements are : ", numary)
print("largest elements in an array is : ",numary.max()!)
print(" elements in an array is : ",numary.min()!)
 
*/


// Write a program to find all the elements in array of integers which have at least two greater element

/*
print("enter arry size")
var s = Int(readLine()!)!

var arr = [Int]()
print("enter array elements")

for i in stride(from: 0, to: s, by: 1)
{
    arr.insert(Int(readLine()!)!, at: i)
}

var a1 = arr.max()
var arr1 = [Int]()
var arr2 = [Int]()

for m in stride(from: 0, to: s, by: 1)
{
    if (arr[m] == a1)
    {
        print("this is the first largest elements in the aeear :", arr[m])
    }
    else
    {
        arr1.insert(arr[m], at: m)
    }
}

var a2 = arr1.max()

for n in stride(from: 0, to: s - 1, by: 1)
{
    if (arr[n] == a2)
    {
        print("this is the second largest elements in the aeear :", arr[n])
    }
    else
    {
        arr2.insert(arr[n], at: n)
    }
}

print(arr2)
 
*/


//  Given an array of size N-1 such that it only contains distinct integers in the range of 1 to N. Find the missing element.(Eg: [1,2,3,5], missing element is: 4}

/*

print("enter arry size (size must be grater than 3)")
var s = Int(readLine()!)!

var arr = [Int]()
print("enter array elements")

for i in stride(from: 0, to: s, by: 1)
{
    arr.insert(Int(readLine()!)!, at: i)
}

var m = 0

for i in stride(from: 0, to: s, by: 1)
{
   
    m = m + arr[i]
}
print("Missing elements is : ", 15 - m)

*/

//  Move all zeros to the beginning/end of an array

/*
print("enter arry size")
var s = Int(readLine()!)!

var arr = [Int]()
print("enter array elements")

for i in stride(from: 0, to: s, by: 1)
{
    arr.insert(Int(readLine()!)!, at: i)
}

var arr1 : [Int] = []
var arr2 : [Int] = []
for i in stride(from: 0, to: s, by: 1)
{
    if ( arr[i] == 0)
    {
        arr1.insert(arr[i], at: 0)
    }
    else
    {
        arr2.insert(arr[i], at: 0)
    
    }
}

print(arr1 + arr2)

 */

// Given an array, rotate the array by one position in clockwise direction.{Eg:A[] = [1, 2, 3, 4, 5] Output: [5 1 2 3 4]}

/*

print("enter arry size")
var s = Int(readLine()!)!

var arr = [Int]()
print("enter array elements")

for i in stride(from: 0, to: s, by: 1)
{
    arr.insert(Int(readLine()!)!, at: i)
}

print("given array is : ", arr)

var tem = arr[s - 1]

arr.remove(at: s - 1)

arr.insert(tem, at: 0)

print("last element of the array is rotated clockwise :",arr)

 */


//Given a sorted array arr[] of size N and a number X, find a pair in array whose sum is closest to X

/*

var a:[Int]=[]
print("Enter the total number of elements in an array")
var n=Int(readLine()!)!
print("Enter the array elements")
for _ in 0...n-1
{
    a.append(Int(readLine()!)!)
}
print("enter the value of x")
let x=Int(readLine()!)!
var l=0,r=n-1,sum=0,closediff=a[n-1],l1=0,l2=0
while(l < r)
    {
    sum=a[l]+a[r]
    if(abs(x-sum) < closediff)
    {
        closediff=abs(x-sum);
        l1=a[l]
        l2=a[r]
            }
    if(sum > x)
    {
        r=r-1;
    }
    else
    {
        l=l+1
    }
}
print(l1)
print(l2)

 */





// SET's



// SET in taken from user

/*
print("enter a set size")
var a = Int(readLine()!)!

var num = Set<Int>()

print("enter the set elements if INT type")

for _ in stride(from: 0, to: a, by: 1)
{
    num.insert(Int(readLine()!)!)
}
print(num)

 */


//Check if a specific value exists in a set

/*
print("enter a set size")
var a = Int(readLine()!)!

var str = Set<String>()

print("enter the set elements if STRING type")

for _ in stride(from: 0, to: a, by: 1)
{
    str.insert(readLine()!)
}

print("entered string is : ",str)

if str.contains("google")
{
    print("googel is there in the entered string")
} else
{
    print("googel is not there in the entered string")
}

*/


//  Add an element to a set AND Find the Union of two sets

/*
 
print("enter a set size")
var a = Int(readLine()!)!

var str1 = Set<String>()

print("enter the set elements if STRING type")

for _ in stride(from: 0, to: a, by: 1)
{
    str1.insert(readLine()!)
}

print("entered string is : ",str1)



print("enter the size of the set to added")
var b = Int(readLine()!)!

var str2 = Set<String>()

print("enter the set elements to add")

for _ in stride(from: 0, to: b, by: 1)
{
    str2.insert(readLine()!)
}

print("entered string is : ",str2)

print(str1.union(str2))

*/


// Write a program to check if a set is a subset of another set.

/*

print("enter the set size")
var a = Int(readLine()!)!

var str1 = Set<String>()

print("enter the set1 elements of STRING type")

for _ in stride(from: 0, to: a, by: 1)
{
    str1.insert(readLine()!)
}

print("entered string is : ",str1)



print("enter the set size")
var b = Int(readLine()!)!

var str2 = Set<String>()

print("enter the set2 elements of STRING type")

for _ in stride(from: 0, to: b, by: 1)
{
    str2.insert(readLine()!)
}

print("entered string is : ",str2)

print(str1.isSubset(of: str2)) // Write a program to check if a set is a subset of another set.

print(str1.isSuperset(of: str2)) // Check if a set is a superset of another set

print(str1.subtracting(str2)) // find the elements in s1 that are not in s2

 */



/*
print("enter the set size")
var a = Int(readLine()!)!

var str1 = Set<String>()

print("enter the set1 elements of STRING type")

for _ in stride(from: 0, to: a, by: 1)
{
    str1.insert(readLine()!)
}

print("entered string set is : ",str1)

print("string to array",Array(str1)) //set to array

*/


// array to set

/*
print("enter the array size")
var s = Int(readLine()!)!

var ary = [Int]()

print("enter the arry elements")

for i in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}
print(ary)

print("array to set",Set(ary))
*/





// DICTIONARY's





/*

var namesOfIntegers = [1: "harsha",2: "vinay",3: "chiru"]

var s = namesOfIntegers.count
print(s)
for i in stride(from: 1, through: s, by: 1)
{
    print(namesOfIntegers[i]!)
}

*/


// Syntax to take in put from user

/*
 

print("dictionary  size")
let s = Int(readLine()!)!

print("enter a dictionary along with its key and value")

var citynames : [Int:String] = [ : ]
for _ in stride(from: 1, through: s, by: 1)
{
    citynames[Int(readLine()!)!] = readLine()!
}

print("city names in the given dictionary are : ")
for i in stride(from: 1, through: s, by: 1)
{
    print(citynames[i]!)
}

*/


// Write a  program asks for City name and Temperature and builds a dictionary using that Later on you can input City name and it will tell you the Temperature of that City.(dictionary)

/*
 
 
print("dictionary  size")
let s = Int(readLine()!)!

print("enter a dictionary along with its key and value")

var citynames : [String:Int] = [ : ]
for _ in stride(from: 1, through: s, by: 1)
{
    citynames[readLine()!] = Int(readLine()!)!
}

print("enter the city name to get its temperature")
var name = readLine()!

print("themperature of \(name)",citynames[name]!)

 
 */


// Create a dictionary of employee id and salary and print the employee id with maximum salary.

/*

print("dictionary  size")
let s = Int(readLine()!)!

print("enter a dictionary having employee ID and salary")

var employeesalary : [Int:Int] = [ : ]
for _ in stride(from: 1, through: s, by: 1)
{
    employeesalary[Int(readLine()!)!] = Int(readLine()!)!
}

var ary = [Int]()
for i in stride(from: 1, through: s, by: 1)
{
    ary.append(employeesalary[i]!)
    
}
var some = ary.max()!

print(employeesalary.first(where: { $0.value == some})!)

*/


// Merge two dictionaries


/*


print("1st dictionary  size")
let s1 = Int(readLine()!)!

print("enter a 1st dictionary along with its key and value")

var dic1 : [Int:String] = [ : ]
for _ in stride(from: 1, through: s1, by: 1)
{
    dic1[Int(readLine()!)!] = readLine()!
}

print("1st dictionary is : ",dic1)


print("2nd dictionary  size")
let s2 = Int(readLine()!)!

print("enter a 2nd dictionary along with its key and value")

var dic2 : [Int:String] = [ : ]
for _ in stride(from: 1, through: s2, by: 1)
{
    dic2[Int(readLine()!)!] = readLine()!
}

print("2nd dictionary is : ",dic2)


for i in dic2.keys
{
    dic1[i]=dic2[i]
}

print(dic1)

 
 */
