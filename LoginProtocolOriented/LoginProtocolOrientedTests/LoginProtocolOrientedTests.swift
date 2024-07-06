//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by Melik Demiray on 2.02.2024.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {

    private var viewModel: RootViewModel!
    private var loginStorageService: MockLoginStorageService!
    private var output: MockRootViewModelOutput!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()

        viewModel.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginStorageService = nil
        viewModel = nil
        output = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken()throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken()throws {

    }

}


class MockLoginStorageService: LoginStorageService {

    var storage: [String: String] = [:]

    var userAccessToken: String {
        return "ACCESS_TOKEN"
    }

    func setUserAccessToken(token: String) {
        storage[userAccessToken] = token
    }

    func getUserAccessToken() -> String? {
        return storage[userAccessToken]
    }

}

class MockRootViewModelOutput: RootViewModelOutput {

    enum Check {
        case main
        case login
    }

    var checkArray: [Check] = []
    func showMainView() {
        checkArray.append(.main)
    }

    func showLoginView() {
        checkArray.append(.login)
    }

}
