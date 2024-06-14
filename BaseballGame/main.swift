//
//  main.swift
//  BaseballGame
//
//  Created by 김승희 on 6/13/24.
//
import Foundation

var numArr = (0...9).map{$0}
var logs = [Int: Int]()
var count = 0
var round = 0

while true {
    print("환영합니다! 원하시는 번호를 입력해주세요.\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    let gameNum = readLine()!
    
    
    switch Int(gameNum) {
    case 1:
        round += 1
        var nums = [Int]()
        repeat { nums = Array(numArr.shuffled().prefix(3))
        } while nums[0] == 0
        
        while true {
            
            count += 1
            
            print("\n숫자를 입력하세요.")
            var returnStr = ""
            var inputs = [Int]()
            if let input = readLine() {
                inputs = input.compactMap{Int(String($0))}
            }
            
            if Set(inputs).count != 3 {
                print("올바른 숫자를 입력해주세요: 중복되지 않는 세 자리 숫자")
            } else {
                var ball = inputs.filter {nums.contains($0)}.count
                var strike = 0
                for i in 0...2 {
                    if inputs[i] == nums[i] {
                        strike += 1
                    }
                }
                ball -= strike
                
                if strike != 0 {
                    returnStr.append("\(strike) 스트라이크")
                }
                
                if ball != 0 {
                    returnStr.append("\(ball) 볼")
                }
                
                if strike + ball == 0 {
                    returnStr.append("Nothing")
                }
                
                print(returnStr)
                
                if strike == 3 {
                    print("정답입니다!")
                    logs[round] = count
                    count = 0
                    break
                }
            }
        }
    case 2:
        print("< 게임 기록 보기 >")
        
        if let log = logs[1]  {
            let sortedLogs = logs.sorted{$0.key < $1.key}
            for (key, val) in sortedLogs {
                print("\(key)번째 게임 : 시도 횟수 - \(val)")
            }
        } else {
            print("게임을 플레이하고 확인해보세요!")
        }
        
    case 3:
        print("< 숫자 야구 게임을 종료합니다 >")
        round = 0
        logs = [:]
        exit(0)
    default:
        print("올바른 숫자를 입력해주세요!")
    }
}

