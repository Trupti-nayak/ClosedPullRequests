//
//  GitHubPullRequestsDemoTests.swift
//  GitHubPullRequestsDemoTests
//
//  Created by Trupti Vg on 25/06/22.
//

import XCTest
@testable import GitHubPullRequestsDemo

class GitHubPullRequestsDemoTests: XCTestCase {
    
    var presenter = GPRPresenterMock()
    var networkManager = NetworkManagerMock()
    
    var sut: GPRInteractor?
    
    override func setUpWithError() throws {
        sut = GPRInteractor(with: presenter)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInteractorInitialization() {
        // This test will check if an initializer is initialzed presenter shoul be set
        XCTAssertNotNil(sut?.presenter)
    }

}

final class GPRPresenterMock: GPRPresentable {
    
    var presentClosedPullRequestsCalled = false
    
    func presentClosedPullRequests(responseList: [GPRResponseModel]) {
        presentClosedPullRequestsCalled = true
    }
    
    func presentToastError(withMessage message: String) {
        presentClosedPullRequestsCalled = false
    }
}

final class NetworkManagerMock: NetworkManagerProtocol {
    var requestApiCalled = false
    func request<Type>(from url: URL, queryParam: GPRQueryParamType, httpMethod: HttpMethod, completion: @escaping (Result<[Type], GPRCustomErrors>) -> Void) where Type : Decodable {
        requestApiCalled = true
        completion(.success([]))
    }
}
