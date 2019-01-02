# Inspectable Interface
#### A sample framework illustrating how to export designable and inspectable views.


It's common for us to want to abstract custom views into a shared framework. But for some reason the `@IBDesignable` and `@IBInspectable` annotations get stripped off our framework's `Project-Swift.h` header. This is a big impediment to using these UI elements in IB as they're displayed as blank white rects and we have to manually set User Defined Runtime Attributes to customize them.

This framework illustrates a proposed work-around for this situation. It breaks `@IBDesignable` and `@IBInspectable` annotations out into internal extensions that are then exported from the framework as private headers. As such, these extension are visible to host projects, parsed as appropriate, and properly interpreted by IB.


## Usage
1. Build and link the `InspectableInterface` framework (I use [Carthage](https://github.com/Carthage/Carthage) for this).
1. Add a `UIView` to an interface in IB.
1. In the Identity Inspector, set the view's "Custom Class" to `MyView` and **importantly** also set its "Module" to `InspectableInterface`

After a quick build, we ought to see a blue rect where we placed our view. This is evidence `@IBDesignable` is working.

Moving to the Attributes Inspector should reveal a "My View" section header with an "Inspectable Color" property. This shows us `@IBInspectable` is being recognized.


## Impact
This strategy for exposing `@IBDesignable/Inspectable` ought to be minimally invasive as Xcode strips framework headers when copying them into bundles. But I'm *very* interested to hear others' experiences. Please [post an issue](https://github.com/jemmons/InspectableInterface/issues).


## Troubleshooting
The way IB automatically builds and parses `@IBDesignable/Inspectable` interfaces can be a little fiddly at the best of times. Some strategies for coping when ready to scream:

* Uncheck Editor→Automatically Refresh Views. Thereafter we can (and must!) manually force builds with Editor→Refresh All Views
* If building or linking multiple (or different) frameworks, Product→Clean Build Folder (⌥⇧⌘K) is sometimes necessary to clear out old caches or build artifacts.
* When IB just doesn't seem in sync with changes we've made, quitting and restarting Xcode is a time-honored way to give it a kick in the pants.

