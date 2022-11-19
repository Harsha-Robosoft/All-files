
//var number:((Int,Int)-> Void) = { num1, num2 in
//    if num1 == 0 && num2 == 0
//    {
//        print("number is zero")
//    }
//    else
//    {
//        print( num1, num2)
//    }
//
//    }
//
//      number(3,7)


//var _1 : Float = Float(a[0]); var _2 : Float = Float(a[1])

//func operation(num : Array<Any>) -> Any
//{
//    switch oper {
//    case "+":
//        return {(_1 , _2 ) -> Float in
//
//            return Float(_1) + Float(_2)
//
//        }
//
//    case "-":
//        return {(_1 , _2 ) -> Float in
//
//            return Float(_1) + Float(_2)
//
//        }
//
//    case "*":
//        return {(_1 , _2 ) -> Float in
//
//            return Float(_1) + Float(_2)
//        }
//
//    case "/":
//        return {(_1 , _2 ) -> Float in
//
//            return Float(_1) + Float(_2)
//        }
//    default:
//        return "not valid"
//
//    }
//}

/* ______________________________ Calculator ___________________________________

func operation(oper: String,num1 : Int, num2 : Int) -> (Int,Int) -> (Any)
{
    switch oper {
    case "+" :
        return { (num1: Int,num2 :Int) -> Int in
            return num1 + num2
        }
        
    case "-" :
        return { (num1: Int,num2 :Int) -> Int in
            return num1 - num2
        }
        
    case "*" :
        return { (num1: Int,num2 :Int) -> Int in
            return num1 * num2
        }
        
    case "/" :
        return { (num1: Int,num2 :Int) -> Any in
            return num1 / num2
        }
    default:
        return {(num1: Int,num2 :Int) -> String in
           return " not valid "}
    }
    
}


print("enter two numbers")
var a = [Int] ()
for i in stride(from: 0, to: 2, by: 1)
{
    a.insert(Int(readLine()!)!, at: i)
}
var s1 = a[0]
var s2 = a[1]
print("mention the operation be done")
let oper = readLine()!

var finalresult = operation (oper: oper,num1 : s1, num2 : s2)(s1,s2)

print(finalresult)



*/


/* ******************************* Another Calculator 'simple' *******************************
func operation(oper: String) -> (Float,Float) -> (Any)
{
    switch oper {
    case "+" :
        return { s1,s2  in
            return s1 + s2
        }
        
    case "-" :
        return { (s1,s2) -> Float in
            return s1 - s2
        }
        
    case "*" :
        return { (s1,s2) -> Float in
            return s1 * s2
        }
        
    case "/" :
        return { (s1,s2) -> Float in
            return Float(s1 / s2)
        }
        
    default:
        return {(s1,s2) -> String in
           return "not valid "}
    }
    
}


print("enter two numbers")
var a = [Int] ()
for i in stride(from: 0, to: 2, by: 1)
{
    a.insert(Int(readLine()!)!, at: i)
}
var s1 : Float = Float(a[0])
var s2 : Float = Float(a[1])
print("mention the operation be done")
let oper = readLine()!


var finalresult = operation(oper: oper)(s1,s2)

print(finalresult)




*/


//var number : ((Int)->Int) = { a in
//    return a
//}
//
//print(number(12))





// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ OOD and EVEN numbers in the array using closers ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

/*
print("enter the array size")
var s = Int(readLine()!)!

print("enter the array elements")

var arry = [Int]()

for i in stride(from: 0, to: s, by: 1)
{
    arry.insert(Int(readLine()!)!, at: i)
}

print("Given input array is : ",arry)


var empt1 = [Int]()
var empt2 = [Int]()
var even : (([Int])->[Int]) = { evennums in
    
    for j in stride(from: 0, to: s, by: 1)
    {
        let getIndex = evennums.index(arry.startIndex, offsetBy: j)
        let num = evennums[getIndex]
        if (num%2 == 0)
        {
            var m = 0
            empt1.append(num)
            m = m + 1
        }
    }
    
   return empt1
}

var odd : (([Int])->[Int]) = { evennums in
    
    for j in stride(from: 0, to: s, by: 1)
    {
        let getIndex = evennums.index(arry.startIndex, offsetBy: j)
        let num = evennums[getIndex]
        if (num%2 != 0)
        {
            var m = 0
            empt2.append(num)
            m = m + 1
       }
    }
    
   return empt2
}


print("odd number in the given array : ",odd(arry))

print("even number in the given array : ",even(arry))


*/


// define a function and pass closure


//func grabLunch(search: ()->()) {
//  print("1")
//
//  // closure call
//  search()
//}
//
//// pass closure as a parameter
//grabLunch(search: {
//   print("2")
//})
//
//func names(closure1 : () -> ()) {
//    print("harsha")
//    closure1()
//}
//
//names( ) {
//    print("mundaragi")
//}
