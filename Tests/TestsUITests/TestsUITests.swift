//
//  TestsUITests.swift
//  TestsUITests
//
//  Created by Melik Demiray on 10.01.2024.
//

import XCTest

final class TestsUITests: XCTestCase {

    func testToDoUI()throws {


        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["Tests.View"].buttons["Item"]


        let textField = app.alerts["Add ToDo"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter ToDo"]/*[[".cells.textFields[\"Enter ToDo\"]",".textFields[\"Enter ToDo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = app.alerts["Add ToDo"].scrollViews.otherElements.buttons["OK"]
        let cell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Buy milk"]/*[[".cells.staticTexts[\"Buy milk\"]",".staticTexts[\"Buy milk\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        addButton.tap()
        textField.tap()
        textField.typeText("Buy milk")
        okButton.tap()

        XCTAssertTrue(cell.exists)
    }

    func testDelete() throws {

        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["Tests.View"].buttons["Item"]

        let textField = app.alerts["Add ToDo"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter ToDo"]/*[[".cells.textFields[\"Enter ToDo\"]",".textFields[\"Enter ToDo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = app.alerts["Add ToDo"].scrollViews.otherElements.buttons["OK"]
        let cell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Buy milk"]/*[[".cells.staticTexts[\"Buy milk\"]",".staticTexts[\"Buy milk\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        addButton.tap()
        textField.tap()
        textField.typeText("Buy milk")
        okButton.tap()

        // tables
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]

        cell.swipeLeft()
        deleteButton.tap()

        XCTAssertFalse(cell.exists)
    }
}
