//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김승희 on 6/17/24.
//

import Foundation


class BaseballGame {
    let game = Logics()
    
    func gameStart() {
        
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요.\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            var menu : Int
            if let input = readLine(), let inputInt = Int(input) {
                menu = inputInt
            } else {
                menu = -1
            }
            
            switch menu {
                
            case 1:
                let nums = game.generateRandomNums()
                var result: (Int, Int)? = nil
                var resultStr = ""
                
                repeat {
                    game.count += 1
                    guard let inputs = game.receiveInputs() else { continue }
                    
                    if let i = game.checkBallStrike(nums, inputs) {
                        result = i
                        resultStr = game.printResult(result!.0, result!.1)
                        print(resultStr)
                    }
                } while result?.1 != 3
                
            case 2:
                print("< 게임 기록 보기 >")
                print(game.checkLogs())
                
            case 3:
                print("< 숫자 야구 게임을 종료합니다 >")
                exit(0)
                
            default:
                print("올바른 숫자를 입력해주세요!")
            }
        }
    }
}
