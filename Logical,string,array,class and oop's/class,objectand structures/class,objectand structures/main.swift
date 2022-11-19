/*
class Bicycle {
    
    var name : String
    var gears : Int
    
    init(name: String,gears: Int) {
        self.name.self = name
        self.gears.self = gears
    }
}

// create instance of Person
var bike1 = Bicycle(name: "honda", gears: 1)
var bike2 = Bicycle(name: "pulser 200", gears: 2)
var bike3 = Bicycle(name: "pulser 250", gears: 3)
var bike4 = Bicycle(name: "pulser 300", gears: 4)
var bike5 = bike1


print("Name: \(bike1.name), Gears: \( bike1.gears) ")
print("")
print("Name: \(bike2.name), Gears: \( bike2.gears) ")
print("")
print("Name: \(bike3.name), Gears: \( bike3.gears) ")
print("")
print("Name: \(bike4.name), Gears: \( bike4.gears) ")
print("")
print("Name: \(bike5.name), Gears: \( bike5.gears) ")

*/


//class college  {
//    var collegeName : String
//    var collegeLocation : String
//}

//class Person {
//
//
//  func greet() {
//    print("Hey there!")
//  }
//}
//
//var nick = Person()
//
//
//nick.greet()

/*
class room {
    var length : Float
    var breadth : Float
    var height : Float
    
    init(length : Float,breadth : Float,height : Float) {
        self.length = length
        self.breadth = breadth
        self.height = height
    }
    
    var area : Float
    {
        length*breadth*height
    }
    
//    func calculate() -> Float
//    {
//        return length*breadth*height
//    }
}

var room1 = room(length: 5.2, breadth: 8, height: 9.5)

print("room length is : \(room1.length)\nroom breadth is : \(room1.breadth)\nroom height is : \(room1.height)")
print(room1.area)
//var area = room1.calculate()
//print("area of room1 is : ",area)
*/

//--------------------------------------------------------------------------------------------------------------------------

class College {

    var collegename : String
    var collegelocation : String

    var branchsname = [Branch]()
    var studentsname = [Student]()
    var studentRegnum = [Student]()
    
  
    
    init(collegename: String,collegelocation: String) {
        self.collegename = collegename
        self.collegelocation = collegelocation
        print("college name is : < \(collegename) > location is : < \(collegelocation) >")
    }

    func addbranch(branchname : String)
    {
        var braName = Branch(branchname: branchname)
        branchsname.append(braName)
    }
    
    func addstudent(studentname : String,studentRno : String)
    {
        var stuNmae = Student(studentname: studentname)
        studentsname.append(stuNmae)
        
        var stuRegnum = Student(studentRno: studentRno)
        studentRegnum.append(stuRegnum)
        
    }
}



class Branch {
    var branchname : String
    
    init(branchname : String ) {
        self.branchname = branchname
        print("branch name is :\(branchname)")
    }
    
}

class Student {
    
    var studentname : String
    var studentRno : String
    
    init(studentname : String) {
        self.studentname = studentname
        print("studnt name is : \(studentname)")
    }
    
    init(studentRno: String) {
        self.studentRno = studentRno
        print("student registration number is : \(studentRno)")
    }
    
    
}

// ---------------------------------------------------------------------------------------------------------------------------------------

var college1 = College(collegename: "JNNCE", collegelocation: "SMG")
print("")
college1.addbranch(branchname: "EE")
college1.addstudent(studentname: "Harsha r Mundaragi", studentRno: "4JN18EE010")
print("")
college1.addbranch(branchname: "EC")
college1.addstudent(studentname: "Pavan", studentRno: "4JN18EE031")
print("")
college1.addbranch(branchname: "CS")
college1.addstudent(studentname: "Vinay", studentRno: "4JN18EE034")
print("")
college1.addbranch(branchname: "IS")
college1.addstudent(studentname: "Chiranjeevi", studentRno: "4JN18EE006")





//var bransize = college1.bran.count
//for i in stride(from: 0, to: bransize, by: 1)
//{
//
//}
