//
//  StringExTests.swift
//  WirexUtilsTests
//
//  Created by Eugen Fedchenko on 9/25/17.
//  Copyright © 2017 wirex. All rights reserved.
//

import XCTest
import WirexUtils

class StringExTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   func testToNumberStr() {
        XCTAssertEqual("12rt".toNumberString(), "12")
        XCTAssertEqual("1234".toNumberString(), "1234")
        XCTAssertEqual("l567890l".toNumberString(), "567890")
        XCTAssertEqual("ljdjeel".toNumberString(), "")
    }
    
    func testHex() {
        let src = "This is string for test number 1234567890"
        let data = src.data(using: .utf8)!
        
        let hexStr = data.hexEncoded()
        let parsedHex = hexStr.parseHex()
        let dataHex = Data(bytes: parsedHex)
        let str2 = String(data: dataHex, encoding: .utf8)
        
        XCTAssertEqual(src, str2)
    }
    
    func testFormatWithParams() {
        let params = ["p1" : "1", "p2" : "22", "pp3" : "3333"]
        
        XCTAssertEqual(String.format("a {p1} b {p2}", withParams: params), "a 1 b 22")
        XCTAssertEqual(String.format("a {p1} b {p2} c {pp3}", withParams: params), "a 1 b 22 c 3333")
        XCTAssertEqual(String.format("a b c", withParams: params), "a b c")
        XCTAssertEqual(String.format("{p1}{p2}{pp3}", withParams: params), "1223333")
        XCTAssertEqual(String.format("a {p1} b {p2} c {p3}", withParams: [:]), "a {p1} b {p2} c {p3}")
        XCTAssertEqual(String.format("", withParams: params), "")
    }
}
