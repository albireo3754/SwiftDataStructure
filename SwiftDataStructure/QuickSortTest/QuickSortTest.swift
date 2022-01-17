//
//  QuickSortTest.swift
//  QuickSortTest
//
//  Created by 윤상진 on 2022/01/17.
//

import XCTest

class QuickSortTest: XCTestCase {
    func test_정수_정렬() throws {
        XCTAssertEqual(QuickSort().sorted([2, 1]), [1, 2])
        XCTAssertEqual(QuickSort().sorted([1, 2]), [1, 2])
        XCTAssertEqual(QuickSort().sorted([1, 2, 3]), [1, 2, 3])
        XCTAssertEqual(QuickSort().sorted([2, 1, 3]), [1, 2, 3])
        XCTAssertEqual(QuickSort().sorted([1, 2, 2, 3, 7, 4, 4, 2, 1]), [1, 2, 2, 3, 7, 4, 4, 2, 1].sorted())
        let testArray = (1...1000).reversed() + Array(1...10000)
        XCTAssertEqual(QuickSort().sorted(testArray), testArray.sorted())
    }
}
