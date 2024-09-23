# DateTimeSupport

`DateTimeSupport` is a Swift project that provides a custom implementation for handling date and time without using native date types. It includes structures for representing dates and times, formatting them into various common styles, and working with them in a more readable and intuitive way.

## Features

- **Custom Date and Time Models**: Define `SimpleDate` and `Time` structs to represent dates and times.
- **Flexible Formatting**: Support for multiple date formats, including 24-hour and 12-hour (AM/PM) time formats.
- **No Native Date Dependencies**: Avoids using native date types, allowing for custom handling and formatting.

### Adding to Your Project

To include `DateTimeSupport` in your project, you can copy the relevant structs (`SimpleDate`, `Time`, and `DateFormat`) into your codebase.

## Usage

### 1. Creating a Simple Date and Time

```swift

// Creating a Time instance
let time = Time(hour: 14, minute: 30)

// Creating a SimpleDate instance with the above time
let date = SimpleDate(year: 2024, month: 9, day: 23, time: time)
