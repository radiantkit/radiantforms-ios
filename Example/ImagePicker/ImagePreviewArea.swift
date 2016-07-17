// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import UIKit

@IBDesignable
class ImagePreviewArea: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		addSubview(borderView)
		borderView.addSubview(imageView)
		addSubview(emptyLabel)
		addSubview(activityIndicatorView)
		reloadMode()
	}
	
	/// Outer Inset Top
	@IBInspectable var oiTop: CGFloat = 10 {
		didSet {
			setNeedsLayout()
		}
	}
	
	/// Outer Inset Left
	@IBInspectable var oiLeft: CGFloat = 10 {
		didSet {
			setNeedsLayout()
		}
	}
	
	/// Outer Inset Bottom
	@IBInspectable var oiBottom: CGFloat = 10 {
		didSet {
			setNeedsLayout()
		}
	}
	
	/// Outer Inset Right
	@IBInspectable var oiRight: CGFloat = 10 {
		didSet {
			setNeedsLayout()
		}
	}
	
	@IBInspectable var innerInset: CGFloat = 10 {
		didSet {
			setNeedsLayout()
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat = 5 {
		didSet {
			borderView.layer.cornerRadius = cornerRadius
			borderView.layer.masksToBounds = cornerRadius > 0
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		didSet {
			borderView.backgroundColor = borderColor
		}
	}
	
	lazy var borderView: UIView = {
		let instance = UIView()
		instance.backgroundColor = UIColor.clearColor()
		return instance
	}()
	
	lazy var imageView: UIImageView = {
		let instance = UIImageView()
		instance.contentMode = .ScaleAspectFit
		instance.backgroundColor = UIColor.clearColor()
		return instance
	}()
	
	lazy var emptyLabel: UILabel = {
		let instance = UILabel()
		instance.text = "No Image"
		instance.textColor = UIColor.whiteColor()
		return instance
	}()
	
	lazy var activityIndicatorView: UIActivityIndicatorView = {
		let instance = UIActivityIndicatorView()
		instance.activityIndicatorViewStyle = .WhiteLarge
		return instance
	}()
	
	enum Mode {
		case ShowImage
		case ShowEmptyMessage
		case ShowSpinner
	}
	
	var mode: Mode = .ShowImage {
		didSet {
			reloadMode()
		}
	}
	
	func reloadMode() {
		switch mode {
		case .ShowImage:
			imageView.hidden = false
			emptyLabel.hidden = true
			activityIndicatorView.stopAnimating()
		case .ShowEmptyMessage:
			imageView.hidden = true
			emptyLabel.hidden = false
			activityIndicatorView.stopAnimating()
		case .ShowSpinner:
			imageView.hidden = true
			emptyLabel.hidden = true
			activityIndicatorView.startAnimating()
		}
	}
	
	override func prepareForInterfaceBuilder() {
		let bundle = NSBundle(forClass: self.dynamicType)
		imageView.image = UIImage(named: "lena", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
		imageView.backgroundColor = UIColor.redColor()
		borderView.backgroundColor = UIColor.blackColor()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let outerInsets = UIEdgeInsetsMake(oiTop, oiLeft, oiBottom, oiRight)
		let adjustedRect = UIEdgeInsetsInsetRect(self.bounds, outerInsets)
		
		let innerInset = self.innerInset
		borderView.frame = adjustedRect
		
		
		imageView.frame = borderView.bounds.insetBy(dx: innerInset, dy: innerInset)

		
		emptyLabel.sizeToFit()
		emptyLabel.center = adjustedRect.mid

		
		activityIndicatorView.center = adjustedRect.mid
	}
}
