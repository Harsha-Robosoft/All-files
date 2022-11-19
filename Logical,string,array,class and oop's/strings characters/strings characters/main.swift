// STRING

//to find if the last letter of the word has S in it


/*
print("enter a string")

var name = readLine()!

let getIndex = name[name.index(before: name.endIndex)]
if( getIndex == "s" || getIndex == "S" )
{
    print(getIndex)
}
else
{
    print("last letter of the word is not S or s")
}
*/




// to remove vowels from an string


/*print("enter a string")
print(" ")

var str = readLine()!

print(" ")
print(" ")
var i = str.count

var vowels = ""
var nonVowels = ""
for n in 0..<i
{
    var getIndex = str.index(str.startIndex, offsetBy: n)
    var n = n + 1
    if ( str[getIndex] == "a" || str[getIndex] == "e" || str[getIndex] == "i" || str[getIndex] == "o" || str[getIndex] == "u" || str[getIndex] == "A" || str[getIndex] == "E" || str[getIndex] == "I" || str[getIndex] == "O" || str[getIndex] == "U" )
    {
        vowels.insert(str[getIndex], at: vowels.endIndex)
    }
    else
    {
        nonVowels.insert(str[getIndex], at: nonVowels.endIndex)
    }
}

print("these are the vowels in the string :", vowels , separator: " " )
print(" ")
print("these are the cansonants in the string :", nonVowels , separator: " ")*/



// Take two strings from user, check whether the strings are anagrams or not


/*print("enter the first string")
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
}*/


/*Consider two strings concatenate and append a character(!) to new string. access the start, middle, end characters of new string (indexing) and insert and remove characters of the concatenated string, count the total number of characters.*/


/*print("enter first string")
var st1 = readLine()!
print(" ")

print("enter second string")
var nd2 = readLine()!
print(" ")

var space = " "
print(" ")

var newstr = st1 + space + nd2
var newstrCount = newstr.count
print("new string length : ",newstrCount )

print("concatenated new string is : ", newstr )


//newstr.insert("!", at: newstr.endIndex )
//
//print("new string with a character ! appended at the end of the string is : ",newstr)

let char = "!"

newstr = newstr + char
print("new string with a character ! appended at the end of the string is : ",newstr)

print("fisr character of the new string is : ", newstr[newstr.startIndex])

var index = newstr.index(newstr.startIndex, offsetBy : newstrCount/2 )

print("middle character of the new string is : ",newstr[index])


print("last character of the new string is : ", newstr[newstr.index(before: newstr.endIndex)])
 */


//Reverse words in a given sentence without using the standard library.

/*print("enter an string of at least 2 words")
var mainstr = readLine()!

var length = mainstr.count
var sample = " "
var revstr = " "

for i in mainstr
{
    if( i == " " )
    {
        revstr.insert(contentsOf: sample, at: revstr.startIndex)
        sample = " "
    }
    else
    {
        sample.append(i)
    }
    
}

revstr.insert(contentsOf: sample, at: revstr.startIndex)
print(revstr)*/

// print the unicode values using utf8 property.

/*
 print("Enter a string")
var val = readLine()!

print("unicode values of each character is ")

for i in val.utf8
{
   print(i)
}
 */


// print the unicode values using value property.

/*
var val = UnicodeScalar("a").value
print("Unicode value of a is ", val)

 */



// Given a string print all permutations of the characters in the string


//print("enter a string")
//
//var str = readLine()!
//
//var s = str.count
//
//for i in stride(from: 0, to: s, by: 1)
//{
////    var getIndex1 = str.index(str.startIndex, offsetBy: i)
////    print(str[getIndex1])
//
//
//    for j in stride(from: 1, to: s, by: 1)
//    {
////        var getIndex2 = str.index(str.startIndex, offsetBy: j)
////        print(str[getIndex1],str[getIndex2])
//
//
//        for k in stride(from: 2, to: s, by: 1)
//        {
//            var getIndex1 = str.index(str.startIndex, offsetBy: i)
//            var getIndex2 = str.index(str.startIndex, offsetBy: j)
//            var getIndex3 = str.index(str.startIndex, offsetBy: k)
//            print(str[getIndex1],str[getIndex2],str[getIndex3])
//
//        }
//
//    }
//}


print("Enter a string")
 
var s=readLine()!
 
 
func swaps(input: String, index1: Int, index2: Int) -> String
{
    var characters = Array(input)
    characters.swapAt(index1, index2)
    return String(characters)
}
print("strings are")
func permutation( s:String,l:Int,r:Int) {
    if(l==r)
    {
        print(s)
    }
    else
    {
        for i in l...r
        {
            var s=swaps(input: s, index1: l, index2: i)
            permutation(s: s, l: l+1, r: r)
            s=swaps(input: s, index1: l, index2: i)
        }
    }
}
 
permutation( s:s,l:0,r:s.count-1)


