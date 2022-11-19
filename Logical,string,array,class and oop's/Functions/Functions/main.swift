
/*


func number() -> String
{

    print("enter the number to knoe even or odd")
    var number = Int(readLine()!)!
    
    if ( number%2 == 0)
    {
        return "even"
    }
    else
    {
        return "odd"
    }
}

var some = number()

print(some)

 
 */

// Table

/*

func number(num: Int) -> [Int]
{
    var mul:  [Int] = []
    for i in stride(from: 1, through: 10, by: 1)
    {
        mul.append(num * i)
        

 }
    return mul
    }
var some = number(num: 3)

print(some)

*/

// example for multiple return type

// Take array input from the user and find out maximum and minimum values in the array and print the sorted array using multiple return statements.

/*

func minmax(num: [Int]) -> (min: Int, max:Int, arr: [Int])
{
    
    return (num.min()!, num.max()!, num.sorted())
}


print("enter array size")
var s = Int(readLine()!)!

print("enter the array element")
var num : [Int] = []
for i in stride(from: 0, to: s, by: 1)
{
    num.insert(Int(readLine()!)!, at: i)
}


print(minmax(num : num))

 */



// Write a program to print the even numbers from a given list

/*

func evennum(num: [Int])-> [Int]
{
    var even :[Int] = []
    for i in stride(from: 0, to: s, by: 1)
    {
        
        var getIndex = num.index(num.startIndex, offsetBy: i)
        if (num[getIndex]%2 == 0)
        {
            even.append(num[getIndex])
        }
        
    }
    return even
}


print("enter array size")
var s = Int(readLine()!)!

print("enter the array element")
var num : [Int] = []
for i in stride(from: 0, to: s, by: 1)
{
    num.insert(Int(readLine()!)!, at: i)
}

print("even elements in the given array is : ",evennum(num : num))

 */


// Swift program to calculate the sum of all digits using recursion

/*

func sum(num : Int)-> Int
{
    if num>0
    {
        let temp = num%10
        
        total = total + temp
        return sum(num: num/10)
    }
   return total
}



print("enter some number")
var mobilenum = Int(readLine()!)!
var total = 0
print("sum of the all the number is : ",sum(num: mobilenum))


*/



// Swap two numbers using “inout” in a function.

/*

func numswap(num1: inout Int,num2: inout Int)
{
    var temp = num1
    num1 = num2
    num2 = temp
    
    print(num1)
    print(num2)
}

var a = 10
var b = 20

numswap(num1: &a, num2: &b)

 */



//func enoondu( a : Int) -> Int
//{
//    return a
//}
//
//var innondu : ( Int)-> Int = enoondu
//
//print(innondu(1))


// Using Nested function take a input, positive or negative number and converge it tozero.

/*

func chooseStepFunction(backward: Bool)  -> (Int) -> Int
{
    func stepForward(input: Int) -> Int
    {
        return input + 1
        
    }
    func stepBackward(input: Int) -> Int
    {
        return input - 1
        
    }
    return backward ? stepBackward : stepForward
}

var currentValue = 4
print("entered value is ", currentValue)
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)


while currentValue != 0
{
    print(currentValue)
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

*/




func sum(a: Int,b:Int) -> Int {
    return a + b
}

print(sum(a: 8, b: 6))
