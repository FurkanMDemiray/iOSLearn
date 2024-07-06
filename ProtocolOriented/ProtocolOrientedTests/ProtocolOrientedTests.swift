//
//  ProtocolOrientedTests.swift
//  ProtocolOrientedTests
//
//  Created by Melik Demiray on 22.01.2024.
//

import XCTest
@testable import ProtocolOriented

final class ProtocolOrientedTests: XCTestCase {

    var userViewModel: UserViewModel!
    var userService: MockService!
    var output: MockUserViewModelOutput!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userService = MockService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userService = nil
        userViewModel = nil
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

    func testUpdateView_when_API_Success() throws {
        // Given
        let mockUser = User.init(id: 1, name: "Test", username: "Test", email: "Test", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        userViewModel.fetchUser()
        XCTAssertEqual(output.updateArray.first?.name, "Test")
    }
}

class MockService: UserService {
    var fetchUserMockResult: Result<ProtocolOriented.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOriented.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}

class MockUserViewModelOutput: UserViewModelProcotol {
    var updateArray: [(name: String, email: String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateArray.append((name, email, userName))
    }
}



