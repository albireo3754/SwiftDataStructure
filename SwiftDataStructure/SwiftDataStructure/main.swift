//
//  main.swift
//  SwiftDataStructure
//
//  Created by 윤상진 on 2022/01/07.
//



import Foundation

let M = 3

struct BTree<Key: Comparable> {
    fileprivate final class Node {
        private(set) var keys: [Key?]
        private(set) var isLeaf: Bool
        private(set) var childs: [Node?]
        
        init(isLeaf: Bool = true) {
            self.keys = [Key?].init(repeating: nil, count: M - 1)
            self.isLeaf = isLeaf
            self.childs = [Node?].init(repeating: nil, count: M)
        }
        
        // MARK: B-Tree의 key는 정렬되어있기 때문에 추후 B-search로 변경가능
        func index(of key: Key) -> Int {
            var i = 0
            while i < M - 1 {
                if let candidateKey = keys[i], key <= candidateKey {
                    break
                }
                i += 1
            }
            return i
        }
        
        subscript(_ index: Int) -> Key? {
            guard (0..<M).contains(index) else {
                return nil
            }
            return keys[index]
        }
    }
    
    private let root = Node(isLeaf: true)
    
    subscript(_ key: Key) -> Bool {
        var node = root
        var index = node.index(of: key)
        while !node.isLeaf {
            if node.keys[index] == key {
                return true
            }
            guard let currentNode = node.childs[index] else {
                return false
            }
            node = currentNode
            index = node.index(of: key)
        }
        return index < M - 1 && node.keys[index] == key
    }
}

let tree = BTree<Int>()
print(tree[0])
print(Optional(3) == 3)
print(tree[1])
