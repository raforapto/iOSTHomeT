//
//  iOSTestTakeHomeRafaelTests.swift
//  iOSTestTakeHomeRafaelTests
//
//  Created by Rafael Mirza on 09/10/2022.
//

import XCTest
@testable import iOSTestTakeHomeRafael

final class iOSTestTakeHomeRafaelTests: XCTestCase {


    
    
    // Were I to do this with more time (I have already spent 3 hours on this) I would consider mocking the networking class, and checking things such as how errors are handled etc
    // I however have just done a simple check to see if a conversion between

    func test_currency_conversion_loaded() throws {
        let currenciesTest = DLwithCombine().conversions
        let timeInSeconds = 5.0
        let expectation = XCTestExpectation(description: "If the conversions have loaded, the USD/GBP exchange != 1")

        DispatchQueue.main.asyncAfter(deadline: .now() + timeInSeconds) {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: timeInSeconds + 5.0)

        // do your XCTAssertions here
        XCTAssertNotEqual(1, currenciesTest?.rates.usd)

    }

  

}
