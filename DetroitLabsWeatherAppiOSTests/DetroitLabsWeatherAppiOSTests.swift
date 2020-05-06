//
//  DetroitLabsWeatherAppiOSTests.swift
//  DetroitLabsWeatherAppiOSTests
//
//  Created by richard Haynes on 5/4/20.
//  Copyright © 2020 richqualitydevelopment. All rights reserved.
//

import XCTest
@testable import DetroitLabsWeatherAppiOS

class DetroitLabsWeatherAppiOSTests: XCTestCase {
    let apiKey = "11d190b14006127cf0e41d6868e79aff"
    
    func testApiKeyIsCorrect(){
        let controller = ViewController()
        
        let key = controller.apiKey
        
        XCTAssertEqual(key, apiKey)
    }
    func testAJsonReturnsDetroit(){
       
        let state = "MI"
        let city = "Detroit"
        let country = "USA"
        let  apiUrlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city),\(state),\(country)&units=imperial&APPID=\(apiKey)"
       
        XCTAssertEqual(apiUrlString, "http://api.openweathermap.org/data/2.5/weather?q=Detroit,MI,USA&units=imperial&APPID=11d190b14006127cf0e41d6868e79aff")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
