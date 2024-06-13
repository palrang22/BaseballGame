//
//  main.swift
//  BaseballGame
//
//  Created by 김승희 on 6/13/24.
//
import Foundation

var nums = (0...9).map{$0}
var logs = [Int: Int]()
var round = 0

while true {
    print("환영합니다! 원하시는 번호를 입력해주세요.\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    let gameNum = readLine()!
    var count = 0
    
    switch Int(gameNum) {
    case 1:
        print()
    case 2:
        print("< 게임 기록 보기 >")
        for (key, val) in logs {
            print("\(key)번째 게임 : 시도 횟수 - \(val)")
        }
    case 3:
        print("< 숫자 야구 게임을 종료합니다 >")
        round = 0
        logs = [:]
        break
    default:
        print("올바른 숫자를 입력해주세요!")
    }
}

