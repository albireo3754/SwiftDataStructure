//
//  QuickSortTest.swift
//  QuickSortTest
//
//  Created by 윤상진 on 2022/01/17.
//

import XCTest

class QuickSortTest: XCTestCase {

    func test_정수_정렬() throws {
        XCTAssertEqual(QuickSort.sort(collection: [1, 2, 3]), [1, 2, 3])
        XCTAssertEqual(QuickSort.sort(collection: [2, 1, 3]), [1, 2, 3])
    }
}
