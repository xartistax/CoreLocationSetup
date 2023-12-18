# CoreLocation SwiftUI Example

This repository contains a SwiftUI-based project that demonstrates the use of CoreLocation services in conjunction with SwiftUI's Map view. The project is structured to provide a clear example of how to request, manage, and display the user's current location on a map within a SwiftUI application.

## Features

- **Location Permission Handling:** Efficiently handles location services permissions, ensuring the app correctly requests access to the user's location.
- **Dynamic Location Updates:** Showcases how to receive and handle dynamic updates to the user's location.
- **Map Integration:** Incorporates SwiftUI's Map view to display the user's location with a custom marker.
- **SwiftUI and Combine Integration:** Utilizes SwiftUI and Combine frameworks to create a responsive and modern iOS application.

## Components

- `MapView`: A SwiftUI view that embeds a Map view, showing the user's current location or a default location if not available.
- `MapViewModel`: A ViewModel that conforms to `CLLocationManagerDelegate`. It manages location updates and communicates with the `MapView` to update the UI accordingly.
- `LocationManager`: A custom class that encapsulates CoreLocation's CLLocationManager, handling location requests, and authorization status changes.

## Getting Started

To run this project:
1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Ensure you have a valid Apple developer account configured in Xcode.
4. Run the app on a simulator or a physical device.

## Prerequisites

- Xcode 12 or later.
- iOS 14 or later.
- A valid Apple Developer account (for running on a physical device).

## Note

- When running on a simulator, set a simulated location for testing the location features.
