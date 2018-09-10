import XCTest

import PostgreSQLUserTests

var tests = [XCTestCaseEntry]()
tests += PostgreSQLUserTests.allTests()
XCTMain(tests)