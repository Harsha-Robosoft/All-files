//
//
//
//var someAnotherValue:Int?
//let defaultValte = 2
//
//var temp = someAnotherValue != nil ? someAnotherValue! :defaultValte
//print(temp)


//
//func operation(oper: String) -> (Float,Float) -> (Any)?
//{
//    switch oper {
//    case "+" :
//        return { s1,s2  in
//            return s1 + s2
//        }
//
//    case "-" :
//        return { (s1,s2) -> Float in
//            return s1 - s2
//        }
//
//    case "*" :
//        return { (s1,s2) -> Float in
//            return s1 * s2
//        }
//
//    case "/" :
//        return { (s1,s2) -> Float in
//            return Float(s1 / s2)
//        }
//
//    default:
//        return {(s1,s2) -> String? in
//           return nil}
//    }
//
//}
//
//
//print("enter two numbers")
//var a = [Int] ()
//for i in stride(from: 0, to: 2, by: 1)
//{
//    a.insert(Int(readLine()!)!, at: i)
//}
//var s1 : Float = Float(a[0])
//var s2 : Float = Float(a[1])
//print("mention the operation be done")
//let oper = readLine()!
//
//
//var finalresult = operation(oper: oper)(s1,s2)
//
//if let check = finalresult
//{
//    print(check)
//}
//else
//{
//  print("error..!")
//}


func songs(year : Int) -> String?
{
    switch year
    {
    case 2000: return "uppi"
    case 2001 : return "appu"
    case 2002: return "shivanna"
    default: return nil
        
    }
}


var songsFrom = songs(year: 1999)

if let temp = songsFrom
{
    print(temp)
}
else {
    print("error...!")
}


