//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김승희 on 6/14/24.
//

import Foundation

class BaseballGame {
    
    // 0-9 배열을 만들고, 배열을 섞은다음 맨 앞부터 3개를 가져옴
    // 0을
    func generateRandomNums() -> [Int] {
        let numArr = (0...9).map{$0}
        var nums = [Int]()
        repeat { nums = Array(numArr.shuffled().prefix(3))
        } while nums[0] == 0
        return nums
    }
}
