//
//  Logics.swift
//  BaseballGame
//
//  Created by 김승희 on 6/14/24.
//

import Foundation

class Logics{
    
    var count = 0
    var logs: [Int] = []
    
    func generateRandomNums() -> [Int] {
        let numArr = (0...9).map{$0}
        var nums = [Int]()
        
        repeat { nums = Array(numArr.shuffled().prefix(3))
        } while nums[0] == 0
        return nums
    }
    
    func receiveInputs() -> [Int]? {
        print("숫자를 입력하세요.")
        var inputs = [Int]()
        
        if let input = readLine() {
            if Set(input).count == 3 && input.allSatisfy({$0.isNumber}) {
                inputs = input.compactMap{Int(String($0))}
            } else {
                print("올바른 숫자를 입력해주세요!")
                return nil
            }
        }
        return inputs
    }
    
    func checkBallStrike(_ nums: [Int], _ inputs: [Int] ) -> (Int, Int)? {
        
        var ball = 0
        var strike = 0
        
        
        ball = inputs.filter {nums.contains($0)}.count
        for i in 0...2 {
            if inputs[i] == nums[i] {
                strike += 1
            }
        }
        ball -= strike
        
        return (ball, strike)
    }
    
    func printResult(_ ball: Int, _ strike: Int) -> String {
        var returnStr = [String]()
        
        if strike != 0 && strike != 3 {
            returnStr.append("\(strike) 스트라이크")
        }
        if ball != 0 {
            returnStr.append("\(ball) 볼")
        }
        if strike + ball == 0 {
            returnStr.append("Nothing")
        }
        
        if strike == 3 {
            returnStr.append("정답입니다!\n")
            logs.append(count)
            count = 0
        }
        return returnStr.joined(separator: " ")
    }
    
    
    func checkLogs() -> String {
        var logsStr = ""
        
        if logs.isEmpty {
            return("게임을 플레이하고 확인해보세요!")
        } else {
            for (idx, i) in logs.enumerated() {
                logsStr.append("\(idx+1)번째 게임 : 시도 횟수 - \(i)\n")
            }
        }
        return logsStr
    }
}
