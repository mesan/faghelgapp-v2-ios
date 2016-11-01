//
//  Date+Format.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

extension Date {
    struct Formatter {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZ"
            return formatter
        }()
        
        static let timeSentFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "nb_NO")
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "'kl.' HH:mm"
            return formatter
        }()
    }
    
    /*
     Formats date like 13:59
     */
    func 🕗() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: self)
    }
    
    /*
     Formats date like Tirsdag 20.10, 13:59
     */
    func 🕗🕗() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM, HH:mm"
        let norwegianWeekday = 🇳🇴🕗()
        let dateTime = formatter.string(from: self)
        
        return "\(norwegianWeekday) \(dateTime)"
    }
    
    /*
     Get Norwegian weekday name
     */
    func 🇳🇴🕗() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let day = formatter.string(from: self)
        
        switch day{
        case "Monday":
            return "Mandag"
        case "Tuesday":
            return "Tirsdag"
        case "Wednesday":
            return "Onsdag"
        case "Thursday":
            return "Torsdag"
        case "Friday":
            return "Fredag"
        case "Saturday":
            return "Lørdag"
        case "Sunday":
            return "Søndag"
        default:
            return "Ukjent"
        }
    }
    
    var timeSentFormat: String {
        let dateFormatter = DateFormatter()
        //dateFormatter.timeSince(from: NSDate(), numericDates: true)  // Just now
        //dateFormatter.timeSince(from: NSDate.init(timeInterval: 600, since: NSDate() as Date), numericDates: true)
        return dateFormatter.timeSince(from: self as NSDate, numericDates: false)
        //return Formatter.timeSentFormat.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
}


