// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import UIKit
import SwiftyFORM
import Alamofire
import AlamofireImage

class BBIImagePickerCellModel: NSObject {
	weak var viewController: UIViewController?
	var dataRef: DataRef?
	
	var valueDidChange: DataRef -> Void = { (value: DataRef) in
		DLog("not overridden, value \(value)")
	}
}

class BBIImagePickerCell: UITableViewCell, SelectRowDelegate, ImagePickerHandlerDelegate {
	@IBOutlet weak var imagePreviewArea: ImagePreviewArea!
	private var model: BBIImagePickerCellModel!
	private var handler: ImagePickerHandler?
	
	static func cellWithModel(model: BBIImagePickerCellModel) throws -> BBIImagePickerCell {
		let cell: BBIImagePickerCell = try NSBundle.mainBundle().form_loadView("BBIImagePickerCell")
		cell.model = model
		if let vc = model.viewController {
			cell.handler = ImagePickerHandler(parentViewController: vc, delegate: cell)
		} else {
			DLog("cannot create image picker handler, because the viewController is nil")
		}
		return cell
	}
	
	@IBAction func changeImageAction(sender: AnyObject) {
		handler?.show()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let tinyDelay = dispatch_time(DISPATCH_TIME_NOW, Int64(0.001 * Float(NSEC_PER_SEC)))
		dispatch_after(tinyDelay, dispatch_get_main_queue()) {
			self.reloadModel()
		}
	}
	
	func reloadModel() {
		guard let model = self.model else {
			DLog("model is nil")
			imagePreviewArea.mode = .ShowEmptyMessage
			return
		}
		
		let imageViewSize: CGSize = imagePreviewArea.imageView.bounds.size
		if imageViewSize.width < 1 || imageViewSize.height < 1 {
			DLog("imageView is empty")
			imagePreviewArea.mode = .ShowEmptyMessage
			return
		}
		
		if let dataRef: DataRef = model.dataRef {
			imagePreviewArea.mode = .ShowSpinner
			let url = ServerURL.dataPreview(dataRef)
			
			let ur = NSMutableURLRequest(URL: url)
			let imageDownloader = imagePreviewArea.imageView.af_imageDownloader ?? UIImageView.af_sharedImageDownloader
			let imageCache: ImageRequestCache? = imageDownloader.imageCache
			imageCache?.removeAllImagesForRequest(ur)
			
			imagePreviewArea.imageView.af_setImageWithURL(
				url,
				placeholderImage: nil,
				filter: AspectScaledToFitSizeFilter(size: imageViewSize),
				completion: { [weak self] _ in
					self?.imagePreviewArea.mode = .ShowImage
				}
			)
		} else {
			imagePreviewArea.mode = .ShowEmptyMessage
		}
	}
	
	func form_didSelectRow(indexPath: NSIndexPath, tableView: UITableView) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		DLog("user tapped the 'show details' for image button")
		// TODO: show image viewer with the image and details such as width x height, png/jpg
	}

	func didUpload(image image: UIImage, response: Response_DataUpload) {
		DLog("upload success")
		imagePreviewArea.imageView.image = image
		imagePreviewArea.mode = .ShowImage
		
		let dataRef = DataRef(json: response.raw_value)
		model.valueDidChange(dataRef)
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		imagePreviewArea.imageView.af_cancelImageRequest()
		imagePreviewArea.imageView.layer.removeAllAnimations()
		imagePreviewArea.imageView.image = nil
		imagePreviewArea.mode = .ShowEmptyMessage
	}
	
	// MARK: ImagePickerHandlerDelegate
	
	func imagePickerHandler_cancel() {
		DLog("cancel")
	}
	
	func imagePickerHandler_didUploadImage(model: ImageUploadedModel) {
		DLog("success")
		didUpload(image: model.image, response: model.response)
	}
}
