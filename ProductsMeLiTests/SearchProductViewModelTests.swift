//
//  SearchProductViewModelTests.swift
//  ProductsMeLiTests
//
//  Created by _ on 25/07/22.
//

import XCTest
@testable import ProductsMeLi

class SearchProductViewModelTests: XCTestCase {

    private var viewModel: SearchProductViewModel!
    private var requestExpectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        viewModel = SearchProductViewModel(repository: SearchProductRepositoryMock(), router: .init())
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testGetProducts() {
        let expectatedValues = [Product(title: "Celular", price: 1, image: nil, productUrl: nil)]
        viewModel.searchText.postValue("Celular")
        
        let exp = expectation(description: "Test after 0.9 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 0.9)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(expectatedValues.first?.title, viewModel.products.first?.title)
        } else {
             XCTFail("Delay interrupted")
        }
    }
    
    func testValidateEvents() {
        requestExpectation = expectation(description: ResponseExpectation.go.rawValue)
        viewModel.searchText.postValue("Celular")
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        if let requestExpectation = requestExpectation {
            wait(for: [requestExpectation], timeout: 1)
        }
        XCTAssertEqual(requestExpectation?.expectationDescription, ResponseExpectation.ok.rawValue)
    }
    
    private func validateEvents(event: SearchProductViewModelOutput) {
        if case .didGetData = event {
            requestExpectation?.expectationDescription = ResponseExpectation.ok.rawValue
            requestExpectation?.fulfill()
        }
        if case .errorMessage = event {
            requestExpectation?.expectationDescription = ResponseExpectation.error.rawValue
            requestExpectation?.fulfill()
        }
    }

}
