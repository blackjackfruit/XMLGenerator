//
//  XMLGeneratorTests.swift
//  XMLGeneratorTests
//
//  Created by iury bessa on 7/11/14.
//  Copyright (c) 2014 yellokrow. All rights reserved.
//

import Cocoa
import XCTest
import XMLGenerator

class XMLGeneratorTests: XCTestCase {
    
    /**
    Due to Swift not having try-catch and not offering the ability to use XCTAssert macros, this current state of testing will have to do
    */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasicStructure()
    {
        let xml = XMLGenerator(ver: 1.0, encode: "UTF-8");
        xml.tag("Library");
        xml.tagAttributes(["address":"0000 Candy Land Drive"]);xml.end()
        xml.tag("catalog")
            xml.tag("book")
            xml.tagAttributes(["id":"0000"])
                xml.tag("author")
                xml.addElement("Steven King") //The closing tag is automatically added
            xml.endTag()
            xml.tag("book")
            xml.tagAttributes(["id":"0001"])
                xml.tag("author")
                xml.addElement("Paulo Coehlo") //The closing tag is automatically added
            xml.endTag()
        xml.endTag()
        
        let out = xml.output()
        println(out);
    }
    
    func testEmptyTagName()
    {
//        let xml = XMLGenerator()
//        xml.tag("") // should fail here
//        xml.endTag()
//        let out = xml.output()
//        println(out)
    }
    
    func testAssertionWithEnd()
    {
//        let xml = XMLGenerator()
//        xml.tag("tag")
//        xml.end()
//        xml.end() // Should fail here
//        let out = xml.output()
//        println(out)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
