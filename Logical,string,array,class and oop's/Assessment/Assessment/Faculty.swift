

class Faculty
{
    var name : String
    var gender : String
    
    init(name: String,gender:String)
    {
        self.name = name
        self.gender = gender
    }
}


class technicalFaculty: Faculty,Attendance
{
    var branch : String
    var experience : Int
    var subject : String
    
    var studentData = [Student]()
    var attendance : [Int:Int] = [:]
    
    var IA1 : [Int:Int] = [:]
    var IA2 : [Int:Int] = [:]
    
    var finalMarks : [Int:Int] = [:]
    
    init(name: String,gender:String,branch : String,experience : Int,subject : String)
    {
        self.branch = branch
        self.experience = experience
        self.subject = subject
        
        super.init(name: name, gender: gender)
    }
    
    func displayTechnicalFaculty()
    {
        print("faculty name : ",name)
        print("gender : ",gender)
        print("branch : ",branch)
        print("experience :",experience)
        print("subject : ",subject)
    }
    
    func addToStudentData(temp : Student)
    {
        studentData.append(temp)
    }
    

    
    func addToAttendance()
    {
        
        print("--- \(branch) branch attendance details submitted by '\(name)' ---")
        for i in studentData
        {
            if (i.branch == branch)
            {
                attendance[i.registerNumber] = Int.random(in: 25...100)
            }
        }
        print(attendance)
        print("")
    }
    
    func addToIA1_addToIA2() -> Dictionary <Int,Int>
    {

        print("--- '\(branch)' branch marks submitted by  '\(name)' ---")
        for i in studentData
        {
            if (i.branch == branch)
            {
                IA1[i.registerNumber] = Int.random(in: 25...100)
                IA2[i.registerNumber] = Int.random(in: 25...100)

                    finalMarks[i.registerNumber] = (IA1[i.registerNumber]! + IA2[i.registerNumber]!) / 2
                
            }
        }
        print("Internals Assessment 1 marks are :",IA1)
        print("Internals Assessment 2 marks are :",IA2)
        print("Total : ",finalMarks)
        print("")

        return finalMarks
    }
    
    
}


class NonTechnicalFaulty: Faculty
{
    var department : String
    var shift : String
    
    init(name: String,gender:String,departmet : String,shift: String)
    {
        self.department = departmet
        self.shift = shift
        super.init(name: name, gender: gender)
    }
    
    func displayNonTechnicalFacultyData()
    {
        print("faculty name : ",name)
        print("gender : ",gender)
        print("department :",department)
        print("shift : ",shift)

    }
    
}
