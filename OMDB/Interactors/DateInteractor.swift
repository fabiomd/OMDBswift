//
//  DateInteractor.swift
//  OMDB
//
//  Created by Fábio Moreira on 30/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

class DateInteractor: NSObject {
    let weekDays = ["Sunday","Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday"]
    func getDayOfWeek(today:String)->String {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday
        return weekDays[Int(weekDay!) - 1]
    }

    func today() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd"
        let calendar = Calendar.current
        return self.getDayOfWeek(today: formatter.string(from: date)) + ", " + date.monthAsString() + " " + String(calendar.component(.day, from: date))
    }
}

extension Date {
    func monthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)
    }
}
