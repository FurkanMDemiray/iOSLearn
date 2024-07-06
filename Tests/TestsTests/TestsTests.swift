//
//  TestsTests.swift
//  TestsTests
//
//  Created by Melik Demiray on 10.01.2024.
//

import XCTest
@testable import Tests

final class TestsTests: XCTestCase {

    let math = MathFunctions()

    func testAdd() {
        XCTAssertEqual(math.add(1, 2), 3)
    }

    func testMultiply() {
        XCTAssertEqual(math.multiply(1, 2), 2)
    }

    func testDivide() {
        XCTAssertEqual(math.divide(1, 2), 0)
    }

    func testSubtract() {
        XCTAssertEqual(math.subtract(1, 2), -1)
    }

    func testPerformanceExample() {
        self.measure {
            _ = math.add(1, 2)
        }
    }

}
