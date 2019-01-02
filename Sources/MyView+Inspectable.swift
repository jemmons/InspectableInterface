import UIKit



@IBDesignable
internal extension MyView {
  @IBInspectable var inspectableColor: UIColor {
    get {
      return internalColor
    }
    set {
      internalColor = newValue
    }
  }
}
