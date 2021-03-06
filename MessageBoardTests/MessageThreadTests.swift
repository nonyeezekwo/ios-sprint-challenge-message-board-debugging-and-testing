//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    let mockController = MessageThreadController()
    var tableView: UITableView?

    func testCreateThreadOnServer() {
        let title = "Testy"
        var count = mockController.messageThreads.count
        
        mockController.createMessageThread(with: title) {
            count += 1
        }
        XCTAssertEqual(count, mockController.messageThreads.count)
     }
    
    func testFetchDataFromServer() {

           let didFinish = expectation(description: "didFinish")

           var messageThreads: [MessageThread] = []

           mockController.fetchMessageThreads {
               didFinish.fulfill()
               messageThreads = self.mockController.messageThreads
           }
           wait(for: [didFinish], timeout: 5)
           XCTAssertNotNil(messageThreads)
    }
}
