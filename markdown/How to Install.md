# How to Install

## Swift Package Manager

### As a dependency

**MastodonKit** is a Swift package and can be integrated into other Swift packages as a package dependency:

```swift
.Package(url: "https://github.com/MastodonKit/MastodonKit.git", majorVersion: 1)
```

For instance:

```swift
import PackageDescription

let package = Package(
    name: "MastodonCLI",
    dependencies: [
        .Package(url: "https://github.com/MastodonKit/MastodonKit.git", majorVersion: 1)
    ]
)
```

### As an Xcode project

Another way to integrate a Swift Package into a project is by generating an Xcode project

```
$ swift package generate-xcodeproj
```

and dragging the generated project, ``MastodonKit.xcodeproj``, into another Xcode project.

## CocoaPods

CocoaPods is probably the easiest way to integrate MastodonKit into an existing project (since Swift Package Manager support isn't built into Xcode yet). Simply add ``MastodonKit`` to your ``Podfile`` and run ``pod install`` to install the pod.

```ruby
pod 'MastodonKit', '~> 1.0'
```

## Drag and Drop

Drag all the files from the ``Sources`` directory (and sub directories) into your project. Since MastodonKit has no dependencies on other libraries and frameworks, it should work fine. But remember to use [tagged versions](https://github.com/MastodonKit/MastodonKit/releases) instead of using code from master or any other development branch.