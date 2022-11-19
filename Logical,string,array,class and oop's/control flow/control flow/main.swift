print("enter the marks of the student")
let marks = Float(readLine()!)!

switch marks
{
case (75...100):
    print("A+")
    
case (60...75):
    print("A")
    
case (45...60):
    print("B+")
    
case (35...45):
    print("B")
    
case (0...35):
    print("F")
    
default:
    print("invalid")
    
}
