protocol Attendance
{
    func addToAttendance()
}



class College
{
    var collegeName : String
    var location : String
    
    var branchData = [Branch]()
    var studentData = [Student]()
    
    var technicalFacultyData = [technicalFaculty]()
    var NontechnicalFacultyData = [NonTechnicalFaulty]()
    
    var marksDetail : [Int:Int] = [:]
    
    init(collegeName : String,location : String)
    {
        self.collegeName = collegeName
        self.location = location
    }
//    ----------------------- ----------------------- ----------------------- ----------------------- -----------------------
    func addToBranchData(branchName : String)
    {
        let temp1 = Branch(branchName: branchName)
        branchData.append(temp1)

    }
    
    func addToStudentData(studentName : String,branch : String,registerNumber : Int)
    {
        let temp2 = Student(studentName: studentName, branch: branch, registerNumber: registerNumber)
        studentData.append(temp2)
        
        for i in branchData
        {
            if i.branchName == branch
            {
//                print("&&&",temp2.branch)
                 i.addToBranchStudentDatafromCollege(some1: temp2)
            
            }
        }
        
    }
    
    
    func addTotechnicalFacultyData(name: String,gender:String,branch : String,experience : Int,subject : String)
    {
        let temp3 = technicalFaculty(name: name, gender: gender, branch: branch, experience: experience, subject: subject)
        technicalFacultyData.append(temp3)
        
        for i in branchData
        {
            if i.branchName == branch
            {
                i.addTobranchFcultyDataFromCollege(some2:temp3)
            }
           
        }
    }
    
    func addToNontechnicalFacultyData(name: String,gender:String,departmet : String,shift: String)
    {
        let temp4 = NonTechnicalFaulty(name: name, gender: gender, departmet: departmet, shift: shift)
        NontechnicalFacultyData.append(temp4)
    }
    
    
             
    
    
//     ----------------------- ----------------------- ----------------------- ----------------------- -----------------------
    
    func collegeDATA()
    {
        print("-----------------------  College details  -----------------------")
        print("college name is : ",collegeName,"location : ",location)
        print(" ")
        print("---- Non Technical Faculty Details ----")
        for l in college1.NontechnicalFacultyData
        {
            print(" ")
            l.displayNonTechnicalFacultyData()
            print(" ")
        }
        
        
       
        for i in college1.branchData
        {
            print("---------'\(i.branchName)' branch details is --------")
            print("")
            print("--- Student details ---")
            for j in college1.studentData
            {
                
                if (i.branchName == j.branch )
                {
                    
                    j.displayStudentData()
                    print("")
                }
            }
            print("--- Faculty data ---")
            print("")
            for k in college1.technicalFacultyData
            {
                
                if ( i.branchName == k.branch)
                {
                    
                    k.displayTechnicalFaculty()
                    print(" ")
                }
            }
        }
    }
    
    func attendanceFromBranch()
    {
        print("------------------------------------------------------------------------------------------------------------")
        for i in branchData
        {
            i.attendanceFromFaculty()
        }
    }
    
    func getMarks()
    {
        print("------------------------------------------------------------------------------------------------------------")
        for i in branchData
        {
             marksDetail = i.getMarksDetails()
            var topTwo = marksDetail.sorted { $0.value > $1.value }.prefix(2)
            print("Top Two students in '\(i.branchName)' branch :",topTwo)
            print("")
            
            
        
    }
    
    
    
    
    
    }
    
}

//  ----------------------- ----------------------- ----------------------- ----------------------- -----------------------

var college1 = College(collegeName: "JNN", location: "SMG")

college1.addToBranchData(branchName: "EEE")
college1.addToBranchData(branchName: "CSE")

college1.addTotechnicalFacultyData(name: "Ajjanna", gender: "Male", branch: "EEE", experience: 27, subject: "Electrical machines")
college1.addTotechnicalFacultyData(name: "Padmashree", gender: "Female", branch: "EEE", experience: 4, subject: "DSD")

college1.addTotechnicalFacultyData(name: "Chakrapaani", gender: "Male", branch: "CSE", experience: 14, subject: "C programming")
college1.addTotechnicalFacultyData(name: "Chotu", gender: "Male", branch: "CSE", experience: 11, subject: "JAVA")

college1.addToNontechnicalFacultyData(name: "Naaganna", gender: "Male", departmet: "Hostel /  Mess", shift: "Day and Night")

college1.addToStudentData(studentName: "Harsha", branch: "EEE", registerNumber: 01)
college1.addToStudentData(studentName: "Vinay", branch: "EEE", registerNumber: 02)
college1.addToStudentData(studentName: "Jeegu", branch: "EEE", registerNumber: 03)


college1.addToStudentData(studentName: "Navaneeth", branch: "CSE", registerNumber: 04)
college1.addToStudentData(studentName: "Adiga", branch: "CSE", registerNumber: 05)
college1.addToStudentData(studentName: "Murali", branch: "CSE", registerNumber: 06)



//  ----------------------- ----------------------- ----------------------- ----------------------- -----------------------
college1.collegeDATA()
college1.attendanceFromBranch()
college1.getMarks()
