//
//  XCTest+Ext.swift
//  BarakaTests
//
//  Created by Nour Araar on 7/17/22.
//

import XCTest
import Combine

extension XCTestCase {
  func wait<T: Publisher>(
    for publisher: T,
    afterChange change: () -> Void,
    file: StaticString = #file,
    line: UInt = #line) throws
  -> T.Output where T.Failure == Never {

    let publisherExpectation = expectation(
      description: "Wait for publisher in \(#file)"
    )

    var result: T.Output?
    let token = publisher
      .dropFirst()
      .sink { value in
        result = value
        publisherExpectation.fulfill()
      }

    change()

    wait(for: [publisherExpectation], timeout: 1)
    token.cancel()

    let unwrappedResult = try XCTUnwrap(
      result,
      "Publisher did not publish any value",
      file: file,
      line: line
    )

    return unwrappedResult
  }
}
