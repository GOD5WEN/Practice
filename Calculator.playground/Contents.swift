
class Calculator {
    var firstNumber: Double
    var secondNumber: Double
    
    init(firstNumber: Double, seconndNumber: Double) {
        self.firstNumber = 0.0
        self.secondNumber = 0.0
    }
    func calculator(firstNumber: Double, secondNumber: Double) -> Double {
        
        let add = firstNumber + secondNumber
        let subtract = firstNumber - secondNumber
        let multiply = firstNumber * secondNumber
        let divide = firstNumber / secondNumber
        
        return 0
        
        print("add : \(add)")
        print("subtract : \(subtract)")
        print("multiply : \(multiply)")
        print("divide : \(divide)")
        
    }
}
