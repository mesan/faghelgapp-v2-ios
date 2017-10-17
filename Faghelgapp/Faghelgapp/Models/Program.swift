//
//  Program.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 03/10/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation

class Program {
    var numberOfEvents: Int
    var events: [Event]

    init(numberOfEvents: Int, events: [Event]) {
        self.numberOfEvents = numberOfEvents
        self.events = events
    }

    func addEvent(event: Event) {
        events.append(event)
    }

    func addEvents(events: [Event]) {
        for event in events {
            addEvent(event: event)
        }
    }

    class func from(json: [String: Any]) -> Program? {
        var events: [Event] = []

        if
            let numberOfEvents = json["numberOfEvents"] as? Int,
            let eventsDict: [[String: Any]] = json["events"] as? [[String : Any]]
        {
            for eventDict in eventsDict {
                let event = Event.from(json: eventDict)
                events.append(event)
            }

            return Program(numberOfEvents: numberOfEvents, events: events)
        }

        return nil
    }

    func getEventsForDay(day: Day) -> [Event] {
        var eventsForDay: [Event] = []
        for event in events {
            if event.start.weekday() == day {
                eventsForDay.append(event)
            }
        }

        return eventsForDay
    }
}
