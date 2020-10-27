//
//  DesignableView.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 27/10/20.
//

import UIKit
@IBDesignable class RoundRectView: UIView {

//@IBInspectable var cornerRadius: CGFloat = 30.0
    
    @IBInspectable var cornerRadius: CGFloat {
          get {
              return layer.cornerRadius
          }
          set {
              layer.cornerRadius = newValue
              layer.masksToBounds = newValue > 0
              layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
          }
      }
//
//    @IBInspectable var topLeftCorner: CGFloat
//    @IBInspectable var topRightCorner: CGFloat
//    @IBInspectable var bottomLeftCorner: CGFloat
//    @IBInspectable var bottomRightCorner: CGFloat

    
    
//@IBInspectable var borderColor: UIColor = UIColor.black
//@IBInspectable var borderWidth: CGFloat = 0.5
private var customBackgroundColor = UIColor.white
override var backgroundColor: UIColor?{
    didSet {
        customBackgroundColor = backgroundColor!
        super.backgroundColor = UIColor.clear
    }
}

func setup() {
//    layer.shadowColor = UIColor.black.cgColor;
//    layer.shadowOffset = CGSize.zero
//    layer.shadowRadius = 5.0;
//    layer.shadowOpacity = 0.5;
    

    
//    let rectShape = CAShapeLayer()
//    rectShape.bounds = layer.frame
//    rectShape.position = layer.contentsCenter
//    rectShape.path = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: [ .topLeft,.topRight , .bottomRight ,.bottomLeft], cornerRadii: CGSize(width: 20, height: 20)).cgPath

//    layer.backgroundColor = UIColor.green.cgColor
    //Here I'm masking the textView's layer with rectShape layer
   // layer.mask = rectShape
    
    super.backgroundColor = UIColor.clear
}

override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
}

override func draw(_ rect: CGRect) {
    customBackgroundColor.setFill()
    UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).fill()

//    let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
//    let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
//    borderColor.setStroke()
//    borderPath.lineWidth = borderWidth
//    borderPath.stroke()

    // whatever else you need drawn
}
    
}


//extension UIView {
//    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
//    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [ .topLeft,.topRight , .bottomRight ,.bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
//    let mask = CAShapeLayer()
//    mask.path = path.cgPath
//    self.layer.mask = mask
//  }
//}
