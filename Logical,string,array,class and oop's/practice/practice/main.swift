//class vehicle
//{
//    var companyname : String
//    var name : String
//    var modlename : String
//    var power : Int
//
//    init(companyname : String,name: String,modlename: String,power: Int)
//    {
//        self.companyname = companyname
//        self.modlename = modlename
//        self.name = name
//        self.power = power
//    }
//}
//
//class car: vehicle
//{
//
//    var detales = [vehicle]()
//
//    func specification(numberOFwheels : Int,numberOFdoors : Int,companyname : String,name: String,modlename: String,power: Int)
//    {
//        var temp = vehicle(companyname: companyname, name: name, modlename: modlename, power: power)
//        detales.append(temp)
//    }
//
//    func specificationsare()
//    {
//        print(companyname)
//        print(name)
//        print(modlename)
//        print(power)
//    }
//}
//
//
//var car1 = car(companyname: "Honda", name: "NXS", modlename: "Sennaaddition", power: 800)
//
//car1.specificationsare()
//

//
//
//class Faculties
//{
//
//    var name : String
//    var gender : String
//
//
//    var techdetail = [TechnicalFaculties]()
//    var Nontechdetail = [Nontechnicalfaculty]()
//
//
//    init(name : String,gender : String)
//    {
//        self.name = name
//        self.gender = gender
//    }
//
//
//    func addTOtechdetail(/*name: String,gender : String,*/department : String,specialization : String, yearOfexperience : Int, subjectCanteach : String)
//    {
//        var temp = TechnicalFaculties(name: name,gender: gender,department: department, specialization: specialization, yearOfexperience: yearOfexperience, subjectCanteach: subjectCanteach)
//        techdetail.append(temp)
//
//    }
//
//
//    func addTOnontechdetail(department : String,shift: String)
//    {
//        var temp = Nontechnicalfaculty(name: name,gender: gender,department: department, shift: shift)
//        Nontechdetail.append(temp)
//    }
//
//
//
//    func displayTechfacultyDetails()
//    {
//        print("----------------------------- Technical  faculty details -----------------------------")
//
//        for i in techdetail
//        {
//            print()
//            print("faculty name is : ",name)
//            print("grnder is : ",gender)
//            print("faculty department is : ",i.department)
//            print("faculty specialization is : ",i.specialization)
//            print("facultu year of experience is : ",i.yearOfexperience)
//            print("subject can teach is : ",i.subjectCanteach)
//        }
//    }
//
//
//    func displayNontechfacultyDetails()
//    {
//        print("----------------------------- Nontechnical  faculty details -----------------------------")
//        print("")
//        for i in Nontechdetail
//        {
//            print("faculty name is : ",name)
//            print("gender is : ",gender)
//            print("faculty department is : ",i.department)
//            print("shift allocated is :",i.shift)
//        }
//    }
//
//
//}
//
//
//// ----------------------------------------------------------- Technical ------------------------------------------------------------
//class TechnicalFaculties: Faculties
//{
//
//    var department : String
//    var specialization : String
//    var yearOfexperience : Int
//    var subjectCanteach : String
//
//    init(name: String,gender: String,department: String, specialization : String,yearOfexperience : Int,subjectCanteach : String)
//    {
//        self.department = department
//        self.specialization = specialization
//        self.yearOfexperience = yearOfexperience
//        self.subjectCanteach = subjectCanteach
//
//        super.init(name: name, gender: gender)
//        self.name = name
//        self.gender = gender
//
//    }
//
//}
//
//
//// ----------------------------------------------------------- NonTechnical ------------------------------------------------------------
//
//class Nontechnicalfaculty: Faculties
//{
//    var department : String
//    var shift : String
//
//
//    init(name: String, gender: String,department : String,shift: String)
//    {
//        self.department = department
//        self.shift = shift
//
//        super.init(name: name, gender: gender)
//        self.name = name
//        self.gender = gender
//
//    }
//
//}
//
//
//// ----------------------------------------------------------- Inputs ------------------------------------------------------------
//
//
//
//
//var faculty1 = Faculties(name: "Ramesh",gender: "Male")
//
//var faculty2 = Faculties(name: "Suresh", gender: "Male")
//
//var faculty3 = Faculties(name: "Anjali", gender: "Female")
//
//var faculty4 = Faculties(name: "Supritha", gender: "Femele")
//
//
//
//faculty1.addTOtechdetail( department: "EEE", specialization: "PE", yearOfexperience: 8, subjectCanteach: "BE")
//
//faculty2.addTOnontechdetail(department: "Transportation", shift: "Day")
//
//faculty3.addTOtechdetail(department: "CS", specialization: "Data structure", yearOfexperience: 12, subjectCanteach: "Data Science")
//
//faculty4.addTOnontechdetail(department: "Maintanence", shift: "Day")
//// ----------------------------------------------------------- Todisplay  ------------------------------------------------------------
//
//
//faculty1.displayTechfacultyDetails()
//faculty2.displayNontechfacultyDetails()
//faculty3.displayTechfacultyDetails()
//faculty4.displayNontechfacultyDetails()
//
//

//protocol addTo
//{
//    var nameOfTheCompany : String {get set}
//    var vehicleName : String {get set}
//    var prise : Int {get set}
//    var type : String {get}
//}
//
//
//
//class Vehicle
//{
//    var vehicleDetails = [Car]()
//
//    func addTovehicleDetails(nameOfTheCompany : String,vehicleName : String,prise : Int,type : String)
//    {
//        let some = Car(nameOfTheCompany: nameOfTheCompany, vehicleName: vehicleName, prise: prise, type: type)
//        vehicleDetails.append(some)
//    }
//
//    func toDisplayTheVehicleData()
//    {
//        for i in vehicleDetails
//        {
//            i.displayData()
//        }
//    }
//}
//
//
//class Car : addTo
//{
//
//    var nameOfTheCompany : String
//    var vehicleName : String
//    var prise : Int
//    var type : String
//    init(nameOfTheCompany : String,vehicleName : String,prise : Int,type : String)
//    {
//        self.nameOfTheCompany = nameOfTheCompany
//        self.vehicleName = vehicleName
//        self.prise = prise
//        self.type = type
//    }
//
//    func displayData()
//    {
//        print(nameOfTheCompany,vehicleName,prise,type)
//    }
//
//}
//
//var vehicle1 = Vehicle()
//vehicle1.addTovehicleDetails(nameOfTheCompany: "lamborgini", vehicleName: "svj", prise: 87654567, type: "petrol")
//
//vehicle1.toDisplayTheVehicleData()
//

//
//class student
//{
//    var name : String
//    var RNo : Int
//    var DOB : String
//
//
//    var studentData = [student]()
//
//    init(name : String,RNo : Int,DOB : String)
//    {
//        self.name = name
//        self.RNo = RNo
//        self.DOB = DOB
//    }
//
//    func display() -> Void {
//
//        for i in stride(from: 0, to: studentData.count, by: 1)
//        {
//            print(studentData[i].name,studentData[i].RNo,studentData[i].DOB)
//
//        }
//        print(studentData.count)
//    }
//
//    func studentDAta() -> Void
//    {
//        studentData.append(stu1)
//        studentData.append(stu2)
//        studentData.append(stu3)
//    }
//}
//
//
//var stu1 = student(name: "harsha", RNo: 10, DOB: "19/11/2000")
//var stu2 = student(name: "vinay", RNo: 59, DOB: "18/12/2000")
//var stu3 = student(name: "jeegu", RNo: 34, DOB: "17/01/2000")
//
//
//stu1.studentDAta()
//stu1.display()




//print("enter the array size")
//var s = Int(readLine()!)!
//
//print("enter the numbers")
//var ary = [Int]()
//for i in stride(from: 0, to: s, by: 1)
//{
//    ary.append(Int(readLine()!)!)
//}
//
//print("entered array is : ",ary)
//var newary = [Int]()
//
//for j in stride(from: 0, to: s, by: 1)
//{
//    if j < s-1
//    {
//        newary.append(ary[j]+ary[j+1])
//
//    }
//}
//
//print("New array is : ",newary)



let letter = ["A","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var lett1 = letter[Int.random(in: 1...26)]
var lett2 = letter[Int.random(in: 1...26)]
var lett3 = letter[Int.random(in: 1...26)]
var lett4 = letter[Int.random(in: 1...26)]
var lett5 = letter[Int.random(in: 1...26)]
var lett6 = letter[Int.random(in: 1...26)]


//print(lett1,lett2,lett3,lett4,lett5,lett6)

var password = [letter[Int.random(in: 1...26)] +  letter[Int.random(in: 1...26)] +  letter[Int.random(in: 1...26)] +  letter[Int.random(in: 1...26)] +  letter[Int.random(in: 1...26)] +  letter[Int.random(in: 1...26)] ]

print(password)
