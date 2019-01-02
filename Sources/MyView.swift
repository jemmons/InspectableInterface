import UIKit



public class MyView: UIView {
  internal var internalColor: UIColor = .blue
  
  
  public override func draw(_ rect: CGRect) {
    internalColor.setFill()
    UIBezierPath(rect: bounds).fill()
  }
}
