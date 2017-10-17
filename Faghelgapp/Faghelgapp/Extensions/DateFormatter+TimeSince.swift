//
//  DateFormatter+TimeSince.swift
//  Faghelgapp
//
//  Created by Idar Vassdal on 01/11/16.
//  Copied from https://samoylov.tech/2016/09/19/implementing-time-since-function-in-swift-3/

import Foundation

extension DateFormatter {
    /**
     Formats a date as the time since that date (e.g., “Last week, yesterday, etc.”).

     - Parameter from: The date to process.
     - Parameter numericDates: Determines if we should return a numeric variant, e.g. "1 month ago" vs. "Last month".

     - Returns: A string with formatted `date`.
     */
    func timeSince(from: NSDate, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)

        var result = ""

        if components.year! >= 1 || components.month! >= 1 || components.weekOfYear! >= 1 || components.day! >= 2 {
            let date: Date = from as Date
            result += date.🕗🕗()
        } else if components.day! >= 1 {
            if numericDates {
                result = "Én dag siden"
            } else {
                result = "I går"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!) timer siden"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 time siden"
            } else {
                result = "Én time siden"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!) minutter siden"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1 minutt siden"
            } else {
                result = "Ett minutt siden"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!) sekunder siden"
        } else {
            result = "Akkurat nå"
        }

        return result
    }
}
