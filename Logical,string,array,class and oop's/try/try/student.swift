class Student
{
    var studentName : String
    var branch : String
    var registerNumber : Int
    
//    var myTotalMarks = [Int]()
    
    init(studentName : String,branch : String,registerNumber : Int)
    {
        self.studentName = studentName
        self.branch = branch
        self.registerNumber = registerNumber
    }
    
    func displayStudentData()
    {
        print("student name is : ",studentName)
        print("branch is :",branch)
        print("registration number is : ",registerNumber)
        

    }
    

    
}
