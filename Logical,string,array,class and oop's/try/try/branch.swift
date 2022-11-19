
class Branch
{
    var branchName : String
    
    var branchStudentDataFromCollege = [Student]()
    var branchFcultyDataFromCollege = [technicalFaculty]()
    
    var toppers : [Int:Int] = [:]
        

    init(branchName : String)
    {
        self.branchName = branchName
    }
    
    func addToBranchStudentDatafromCollege(some1: Student)
    {
        branchStudentDataFromCollege.append(some1)
        for i in branchFcultyDataFromCollege
        {            
            i.addToStudentData(temp: some1)
        }
    }
    
    func addTobranchFcultyDataFromCollege(some2: technicalFaculty)
    {
        branchFcultyDataFromCollege.append(some2)
    }
    
    
    
    func  attendanceFromFaculty()
    {
        for i in branchFcultyDataFromCollege
        {
            i.addToAttendance()
            
        }
    }
    
    func getMarksDetails() -> Dictionary<Int,Int>
    {
        for i in branchFcultyDataFromCollege
        {
            let totalMarksfromFaculty = i.addToIA1_addToIA2()
            
            for (x,y) in totalMarksfromFaculty
            {
                toppers[x] = (toppers[x] != nil ? toppers[x]! : 0) + y
            }
            
        }
        
        for (x,y) in toppers
        {
            toppers[x] = y / branchFcultyDataFromCollege.count
        }
//        let topTwoAre = toppers.sorted { $0.value > $1.value }.prefix(2)
        print("Students marks list is : ",toppers)
//        print("Top Two students in '\(branchName)' branch : ",topTwoAre)
//        print("")
        return toppers
    }
    
    
    
}
