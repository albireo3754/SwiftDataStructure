//
//  QuickSort.swift
//  SwiftDataStructure
//
//  Created by 윤상진 on 2022/01/17.
//

import Foundation

// MARK: 포인터를 이용해 재귀 적으로 만드는 C 예제와는 달리, 불변성을 지키느라 분할정복방식을 이용해 속도가 조금 느림
struct QuickSort<Element: Comparable> {
    typealias Collection = [Element]
    
    func sorted(_ collection: Collection) -> Collection {
        if collection.count <= 1 {
            return collection
        }
        let (collection, pivot) = partition(collection: collection)
        let result =
            sorted(Array(collection[0..<pivot]))
            + [collection[pivot]]
            + sorted(Array(collection[(pivot + 1)...]))
        return result
    }
    
    private func partition(collection: Collection) -> (collection: Collection, pivot: Int) {
        var collection = collection
        let pivot = 0
        var (l, r) = (1, collection.count - 1)
        while l <= r {
            while l < collection.count && collection[l] <= collection[pivot] {
                l += 1
            }
            while r > pivot && collection[r] >= collection[pivot] {
                r -= 1
            }
            if l <= r {
                (collection[l], collection[r]) = (collection[r], collection[l])
            }
        }
        (collection[pivot], collection[r]) = (collection[r], collection[pivot])
        return (collection, r)
    }
}
