
func baseballGame() {
    
    // Step 1: 정답 생성
    var answer = [Int]()
    // - [ ] 를 사용해서 '배열'을 사용할 수 있게 한다.
    for _ in 1...3 {
        answer.append(Int.random(in: 1...9))
    }
    // - 정답은 1부터 9까지의 숫자 중 3개를 무작위로 선택하여 구성된다.
    // - for 문과 Int.random 함수를 사용하여 정답 배열을 생성한다.
    // - append를 사용하는 이유는 선언해준 [ ] 배열에 랜덤으로 생성되는 정수를 추가 하기 위해서 이다.
    
    // Step 2: 게임 시작
    // - 시도 횟수를 기록하기 위한 변수 attempts를 초기화한다.
    var attempts = 0
    
    // Step 3: 무한 루프를 통해 게임 진행
    while true {
        //while 문을 이용해서 무한 루프를 돌릴 수 있게 하며, 게임 클리어 조건이 되면 break로 탈출할 계획이다.
        
        // Step 4: 사용자 입력 받기
        // - 사용자에게 3자리 숫자를 입력하도록 요청한다.
        // - 게임 종료를 원할 경우 'exit'를 입력할 수 있다.
        print("3자리 숫자를 입력하세요. (게임 종료: 'exit')")
        
        // Step 5: 사용자 입력을 읽어온다.
        // - readLine 함수를 사용하여 사용자의 입력을 '문자열'로 읽어온다.
        // - if let를 사용하는 이유에대해서는 ??????????????
        if let input = readLine() {
            
            // Step 6: 사용자가 'exit'를 입력하면 게임 종료
            // - 입력값이 'exit'이면 게임을 종료하고 정답을 표시한다.
            if input == "exit" {
                print("게임을 종료합니다. 정답은 \(answer)입니다.")
                break
                // - 게임 종료시 무한루프를 끊어주어야 하기 때문에 break 선언
                // - 종료하지 않을시 인풋이 3개인지 확인하고 유저 입력값을 받기위한 변수 userGuess를 초기화 한다.
            } else if input.count == 3, let userGuess = Int(input) {
                // - 사용자 입력이 3자리 문자열인지 확인하고 이것을 Int로 반환 한다.
                
                // Step 7: 정상적인 입력일 경우 시도 횟수 증가
                // - 입력값이 3자리 숫자이면서 정수로 변환 가능한 경우에만 시도 횟수를 증가시킨다.
                attempts += 1
                
                // Step 8: 정답과 비교하여 스트라이크와 볼 판단
                // - 사용자 입력과 정답을 비교하여 스트라이크와 볼의 개수를 계산하기 위해 변수 스트라이크와 볼을 초기화 한다.
                var strikes = 0
                var balls = 0
                
                // Step 9: 사용자 입력을 각 자리수로 분리해서 정답과 비교
                // - 입력값을 각 자리수로 분리하여 정답과 비교하며 스트라이크와 볼을 판단한다.
                var tempUserGuess = userGuess
                for i in 0..<3 {
                    if answer[i] == tempUserGuess % 10 {
                    // % 연산은 10으로 나눈 나머지를 구한다. 이로인해 1의 자리 숫자를 얻을 수 있다.

                        // Step 9-1: 같은 자리에 일치하면 스트라이크 증가
                        strikes += 1
                    } else if answer.contains(tempUserGuess % 10) {
                        // Step 9-2: 다른 자리에 일치하면 볼 증가
                        balls += 1
                    }
                    tempUserGuess /= 10
                }
                
                // Step 10: 결과 출력
                // - 판단 결과를 사용자에게 출력한다.
                print("결과: \(strikes) 스트라이크, \(balls) 볼")
                
                // Step 11: 정답을 맞추면 게임 종료
                // - 스트라이크가 3이면 정답을 맞춘 것으로 게임을 종료한다.
                if strikes == 3 {
                    print("축하합니다! 정답을 맞췄습니다. 시도 횟수: \(attempts)")
                    break
                }
            
            }
        }
    }
}
// Step 13: 게임 실행
// - baseballGame 함수를 호출하여 숫자 야구 게임을 실행한다.
baseballGame()

