import XCTest
@testable import HDF5Kit

class AttributeTests: XCTestCase {

    func testName() {
        let filePath = tempFilePath()
        guard let file = File.create(filePath, mode: .truncate) else {
            fatalError("Failed to create file")
        }
        let group = file.createGroup("group")
        XCTAssertEqual(group.name, "/group")

        let dataspace = Dataspace(dims: [4])
        guard let attribute = group.createIntAttribute("attribute", dataspace: dataspace) else {
            XCTFail()
            return
        }
        XCTAssertEqual(attribute.name, "attribute")
    }

    func testWriteReadInt() {
        let filePath = tempFilePath()
        guard let file = File.create(filePath, mode: .truncate) else {
            fatalError("Failed to create file")
        }
        let group = file.createGroup("group")
        XCTAssertEqual(group.name, "/group")

        let dataspace = Dataspace(dims: [4])
        guard let attribute = group.createIntAttribute("attribute", dataspace: dataspace) else {
            XCTFail()
            return
        }

        do {
            let writeData = [1, 2, 3, 4]
            try attribute.write(writeData)
            XCTAssertEqual(try attribute.read(), writeData)
        } catch {
            XCTFail()
        }
    }

    func testWriteReadString() throws {
        let filePath = tempFilePath()
        guard let file = File.create(filePath, mode: .truncate) else {
            fatalError("Failed to create file")
        }
        let group = file.createGroup("group")
        let attribute = try XCTUnwrap(group.createStringAttribute("attribute"))

        let writeData = "ABCD😀"
        try attribute.write(writeData)
        XCTAssertEqual(try attribute.read(), [writeData])
    }

    func testWriteReadFixedString() throws {
        let filePath = tempFilePath()
        guard let file = File.create(filePath, mode: .truncate) else {
            fatalError("Failed to create file")
        }
        let group = file.createGroup("group")
        let attribute = try XCTUnwrap(group.createFixedStringAttribute("attribute", size: 50))

        let writeData = "ABCD😀"
        try attribute.write(writeData)
        XCTAssertEqual(try attribute.read(), [writeData])
    }

    static let allTests = [
        ("testName", testName),
        ("testWriteReadInt", testWriteReadInt),
        ("testWriteReadString", testWriteReadString),
        ("testWriteReadFixedString", testWriteReadFixedString)
    ]
}
