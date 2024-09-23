import Foundation
import UIKit

// Enum for defining date formats
enum DateFormat {
    case dateOnly
    case shortDate
    case fullDate24h
    case fullDate12h
    
    var datePattern: String {
        switch self {
        case .dateOnly: "%02d/%02d/%04d"
        case .shortDate: "%02d/%02d"
        case .fullDate24h: "%02d/%02d/%04d %@"
        case .fullDate12h: "%02d/%02d/%04d %@"
        }
    }
}

struct Time {
    enum HourFormatType {
        case hour24, hour12
        
        var hourPattern: String {
            switch self {
            case .hour24: "%02d:%02d"
            case .hour12: "%02d:%02d %@"
            }
        }
    }
    
    var hour: Int
    var minute: Int

    // Init
    init(hour: Int = 0, minute: Int = 0) {
        self.hour = hour
        self.minute = minute
    }

    // Function to return time as string in 24-hour or 12-hour format (Default is 24 hour)
    func formattedTime(_ hourFormatType: HourFormatType = .hour24) -> String {
        if hourFormatType == .hour24 {
            return String(format: hourFormatType.hourPattern, hour, minute)
        } else {
            let hour12 = hour % 12 == 0 ? 12 : hour % 12
            let amPm = hour < 12 ? "AM" : "PM"
            return String(format: hourFormatType.hourPattern, hour12, minute, amPm)
        }
    }
}

struct SimpleDate {
    var year: Int
    var month: Int
    var day: Int
    var time: Time

    // Init
    init(year: Int, month: Int, day: Int, time: Time = Time()) {
        self.year = year
        self.month = month
        self.day = day
        self.time = time
    }

    // Function to return date as string based on the specified format
    func formattedDate(_ format: DateFormat) -> String {
        switch format {
        case .dateOnly: String(format: format.datePattern, month, day, year)
        case .shortDate: String(format: format.datePattern, month, year % 100)
        case .fullDate24h: String(format: format.datePattern, month, day, year, time.formattedTime(.hour24))
        case .fullDate12h: String(format: format.datePattern, month, day, year, time.formattedTime(.hour12))
        }
    }
}

let time = Time(hour: 14, minute: 30)
let date = SimpleDate(year: 2024, month: 9, day: 23, time: time)

print(date.formattedDate(.dateOnly))    // "09/23/2024"
print(date.formattedDate(.shortDate))   // "09/24"
print(date.formattedDate(.fullDate24h)) // "09/23/2024 14:30"
print(date.formattedDate(.fullDate12h)) // "09/23/2024 02:30 PM"
