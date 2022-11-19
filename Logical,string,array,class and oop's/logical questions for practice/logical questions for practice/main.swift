// *************************************** strings ***************************************
// print the non repeating charactor in a string
/*
var str = ""

print("enter a name")
str = readLine()!

for i in str
{
    if(str.firstIndex(of: i) == str.lastIndex(of: i))
    {
        print(i)
    }
}
*/

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Two strings are anagrams %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
print("enter the first string")
var str1 = readLine( )!
var count1 = str1.count
print("")

var space = " "

print("enter second string")
var str2 = readLine( )!
var count2 = str2.count
print("")

var f1 = str1.sorted(by: >)

var f2 = str2.sorted(by: >)

if ( f1 == f2)
{
    print("anagrams")
}
else
{
print("not an anagram")
}
 */

// ################################# Array ################################

// _______________ Max and Min _____________________
/*
print("enter the array size")
 var s = Int(readLine()!)!

print("array some random element")

var ary = [Int]()

for _ in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}

print("maximun is \(String(describing: ary.max()!)) minimun is \(String(describing: ary.min()!))")
*/



// ##################################### Ascending and decending order of an array  #####################################

/*

print("enter the array size")
 var s = Int(readLine()!)!

print("array some random number")

var ary = [Int]()

for _ in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}

print("entered array : ",ary)
func ascending() -> [Int]
{
    for i in stride(from: s - 1, to: 0, by: -1)
    {
        for j in 1...i
        {
            if ary[j - 1] > ary[j]
            {
                let tmp = ary[j-1]
                ary[j-1] = ary[j]
                ary[j] = tmp
            }
        }
    }
    return ary
}

func decending() -> [Int]
{
    for i in stride(from: s - 1, to: 0, by: -1)
    {
        for j in 1...i
        {
            if ary[j - 1] < ary[j]
            {
                let tmp = ary[j-1]
                ary[j-1] = ary[j]
                ary[j] = tmp
            }
        }
    }
    return ary
}
var ascendingArray = ascending ()

var decendingArray = decending()


print("ascending order : ",ascendingArray)
print("decending order : ",decendingArray)

 */


// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Remove a number from an array ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

/*

print("enter the array size")
 var s = Int(readLine()!)!

print("array some random number")

var ary = [Int]()

for _ in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}
print("enter a number to remove from the array ")
var remove = Int(readLine()!)!
var newArray = [Int]()

for i in stride(from: 0, to: s , by: 1)
{
    if(remove == ary[i])
    {
        print("removed number is '\(remove)'")
    }
    else
    {
        newArray.append(ary[i])
    }
}

print("new array is : ",newArray)

 */

// ^(((((( segregate all the positive and negetive numbers in an array with out changing their respective postion ))))))

/*
print("enter the array size")
 var s = Int(readLine()!)!

print("array some random number")

var ary = [Int]()

for _ in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}

print("entered array : ",ary)
for i in stride(from: s - 1, to: 0, by: -1)
{
    for j in 1...i
    {
        if ary[j - 1] > ary[j]
        {
            let tmp = ary[j-1]
            ary[j-1] = ary[j]
            ary[j] = tmp
        }
    }
}

print("segregate array : ",ary)
*/

// frequency

print("enter the array size")
 var s = Int(readLine()!)!

print("array some random number")

var ary = [Int]()

for _ in stride(from: 0, to: s, by: 1)
{
    ary.append(Int(readLine()!)!)
}

func mostFrequent(array: [Int]) -> (value: Int, count: Int)?
{
    var counts = [Int: Int]()

    array.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }

    if let (value, count) = counts.max(by: {$0.1 < $1.1})
    {
        return (value, count)
    }

    // array was empty
    return nil
}

if let result = mostFrequent(array: ary) {
    print("\(result.value) occurs \(result.count) times")
}
