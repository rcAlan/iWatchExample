//
//  ScheduleInterfaceController.swift
//  iWatchExample
//
//  Created by mac on 1/5/17.
//  Copyright © 2017 mac. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {
    
    @IBOutlet var flightsTable: WKInterfaceTable!
    var flights = Flight.allFlights()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
        
        for index in 0..<flightsTable.numberOfRows{
            if let controller = flightsTable.rowController(at: index) as? FlightRowController{
                controller.flight = flights[index]
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let flight = flights[rowIndex]
        presentController(withName: "Flight", context: flight)
    }
    
    
}
