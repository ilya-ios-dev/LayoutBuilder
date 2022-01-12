# LayoutBuilder

Layout builder is a package with extensions for simplified layout. It allows you to create constraints programmatically simpler and more elegant than ever.

## Overview

Now, using this package, you can reduce the amount of time allocated for installing constraints and make them more readable.
This package supports both the more standard view of the constraints via the **ConstraintLayoutBuilder** and the more concise syntax using keyPath via the **KeyPathLayoutBuilder**.

## Installation
To integrate LayoutBuilder into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ilya-ios-dev/LayoutBuilder", .upToNextMajor(from: "1.0.0"))
]
```

## Explanation

An example of the **old style** of object placement through NSLayoutConstraint:
```swift
view.addSubview(orangeView)
orangeView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    orangeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    orangeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
    orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    orangeView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
])

view.addSubview(cyanView)
cyanView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    cyanView.topAnchor.constraint(equalTo: orangeView.topAnchor),
    cyanView.heightAnchor.constraint(equalTo: orangeView.heightAnchor),
    cyanView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    cyanView.widthAnchor.constraint(equalTo: orangeView.widthAnchor)
])

view.addSubview(systemGrayView)
systemGrayView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    systemGrayView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
    systemGrayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
    systemGrayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    systemGrayView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
])
```

An example of placement via **ConstraintLayoutBuilder**: 
```swift
view.addSubview(redView) { container, view in
    view.topAnchor.constraint(equalTo: systemGrayView.bottomAnchor)
    view.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
    view.leadingAnchor.constraint(equalTo: container.leadingAnchor)
    view.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.5)
}

view.addSubview(blueView) { container, view in
    view.topAnchor.constraint(equalTo: redView.topAnchor)
    view.heightAnchor.constraint(equalTo: redView.heightAnchor)
    view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
    view.widthAnchor.constraint(equalTo: redView.widthAnchor)
}

view.addSubview(darkGrayView) { container, view in
    view.topAnchor.constraint(equalTo: redView.bottomAnchor)
    view.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
    view.leadingAnchor.constraint(equalTo: container.leadingAnchor)
    view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
}
```

An example of placement via **KeyPathLayoutBuilder**: 
```swift
view.addSubview(greenView) {
    $0.equal(\.topAnchor, to: darkGrayView, \.bottomAnchor)
    $0.equal(\.heightAnchor, multiplier: 0.1)
    $0.equal(\.leadingAnchor)
    $0.equal(\.widthAnchor, multiplier: 0.5)
}

view.addSubview(yellowView) {
    $0.equal(\.topAnchor, to: greenView)
    $0.equal(\.heightAnchor, to: greenView)
    $0.equal(\.trailingAnchor)
    $0.equal(\.widthAnchor, to: greenView)
}

view.addSubview(lightGrayView) {
    $0.equal(\.leadingAnchor)
    $0.equal(\.trailingAnchor)
    $0.equal(\.topAnchor, to: yellowView, \.bottomAnchor)
    $0.equal(\.heightAnchor, multiplier: 0.1)
}
```
