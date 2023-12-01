//


//첫번째 제출시 답안


//class Calculator {
//    var firstNumber: Double
//    var secondNumber: Double
//    
//    init(firstNumber: Double, seconndNumber: Double) {
//        self.firstNumber = 0.0
//        self.secondNumber = 0.0
//    }
//    func calculator(firstNumber: Double, secondNumber: Double) -> Double {
//        
//        let add = firstNumber + secondNumber
//        let subtract = firstNumber - secondNumber
//        let multiply = firstNumber * secondNumber
//        let divide = firstNumber / secondNumber
//        
//        return 0
//        
//        print("add : \(add)")
//        print("subtract : \(subtract)")
//        print("multiply : \(multiply)")
//        print("divide : \(divide)")
//        
//    }
//}


//코드풀이

//class Calculator {
//    func calculate(operator: String, firstNumber: Int, seconNumber: Int) -> Double? {
//        if `operator` == "+" {
//            return Double(firstNumber + seconNumber)
//        }
//        if `operator` == "-" {
//            return Double(firstNumber - seconNumber)
//        }
//        if `operator` == "*" {
//            return Double(firstNumber * seconNumber)
//        }
//        if `operator` == "/" {
//            return Double(firstNumber / seconNumber)
//            
//            }
//
//        return nil
//    }
//}
//
//let calculator = Calculator()
//if let addResult = calculator.calculate(operator: "+", firstNumber: 10, seconNumber: 20) {
//    print("addResult : \(addResult)")
//}
//if let subtractResult = calculator.calculate(operator: "-", firstNumber: 30, seconNumber: 20) {
//    print("subtractResult : \(subtractResult)")
//}
//if let multiplyResult = calculator.calculate(operator: "*", firstNumber: 10, seconNumber: 5) {
//    print("multiplyResult : \(multiplyResult)")
//}
//if let divideResult = calculator.calculate(operator: "/", firstNumber: 40, seconNumber: 10) {
//    print("divideResult : \(divideResult)")
//}




//아직 옵셔널과nil에대한 이해도가 부족..
//전반적인 코드흐름에대한 이해는 가능해서
//최대한 스스로 이해할 수 있는 코드로 재정의 해봤습니다.


class Calculator {
    func calculate(operation: String, firstNumber: Int, seconNumber: Int) -> Double? {
                    //이부분은 굳이 ``해야할 이유를 납득할수 없어 이름을 임의로 변경.        //이부분에서 왜 ?(옵셔널)가 들어가야하는지..모르겠습니다.
        if operation == "+" {
            return Double(firstNumber + seconNumber)
        }
        if operation == "-" {
            return Double(firstNumber - seconNumber)
        }
        if operation == "*" {
            return Double(firstNumber * seconNumber)
        }
        if operation == "/" {
            return Double(firstNumber / seconNumber)
        }
        
        return 0
              //nil로 표현해야 하는 명확한 이유에대한 이해도가 없어 임의로 0으로 설정하였습니다..
    }
}

let calculator = Calculator()
//이부분에서 클래스를 가져온다는 뜻? 얼핏 알겠으나 명확하게 숙지하지 못하였습니다.
if let add = calculator.calculate(operation: "+", firstNumber: 10, seconNumber: 20) {
// if let은 if 조건문의 값이 nil인지 아닌지 체크, nil이 아닐시 해당 블럭이 실행됨. 으로 알고 있으나
// 옵셔널 자체에서 이해도가 막혀있어 사실상 왜 사용해야하는지 스스로 해답을 찾지 못하고 있습니다.
    print(add)
}
if let subtract = calculator.calculate(operation: "-", firstNumber: 30, seconNumber: 20) {
    print(subtract)
//  print("subtractResult : \(subtractResult)")
//  코드풀이 영상에서는 위처럼 prinrt 하였는데 이또한 이해가 안됩니다...
}
if let multiply = calculator.calculate(operation: "*", firstNumber: 10, seconNumber: 5) {
    print(multiply)
}
if let divide = calculator.calculate(operation: "/", firstNumber: 40, seconNumber: 10) {
    print(divide)
}
