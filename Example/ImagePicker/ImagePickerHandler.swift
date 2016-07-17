// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import UIKit
import ImageIO
import Photos
import Result
import PKHUD

class ImageUploadedModel {
	let image: UIImage
	let data: NSData
	let filename: String
	let mimeType: String
	let response: Response_DataUpload
	
	init(image: UIImage, data: NSData, filename: String, mimeType: String, response: Response_DataUpload) {
		self.image = image
		self.data = data
		self.filename = filename
		self.mimeType = mimeType
		self.response = response
	}
}

class ImageData {
	let image: UIImage
	let data: NSData
	let filename: String
	let mimeType: String
	
	init(image: UIImage, data: NSData, filename: String, mimeType: String) {
		self.image = image
		self.data = data
		self.filename = filename
		self.mimeType = mimeType
	}
	
	var uploadData: UploadData {
		return UploadData(image: image, data: data, filename: filename, mimeType: mimeType)
	}
}


class LandscapeAndPortraitImagePickerController: UIImagePickerController {
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return [.Landscape, .Portrait]
	}
}

protocol ImagePickerHandlerDelegate: class {
	func imagePickerHandler_cancel()
	func imagePickerHandler_didUploadImage(model: ImageUploadedModel)
}

class ImagePickerHandler: NSObject {
	private weak var parentViewController: UIViewController?
	private weak var childNavigationController: UINavigationController?
	private weak var delegate: ImagePickerHandlerDelegate?
	
	init(parentViewController: UIViewController, delegate: ImagePickerHandlerDelegate) {
		self.parentViewController = parentViewController
		self.delegate = delegate
	}
	
	func dismiss() {
		parentViewController?.dismissViewControllerAnimated(true, completion: nil)
		self.childNavigationController = nil
	}
	
	func cancel() {
		dismiss()
		delegate?.imagePickerHandler_cancel()
	}
	
	func success(model: ImageUploadedModel) {
		dismiss()
		delegate?.imagePickerHandler_didUploadImage(model)
	}

	func show() {
		let imagePickerController = createImagePickerController()
		self.childNavigationController = imagePickerController
		parentViewController?.presentViewController(imagePickerController, animated: true, completion: nil)
	}
	
	private func createImagePickerController() -> UIImagePickerController {
		let instance = LandscapeAndPortraitImagePickerController()
		instance.allowsEditing = false
		instance.sourceType = .PhotoLibrary
		instance.delegate = self
		return instance
	}
	
	enum ImageError: ErrorType {
		case Message(text: String)
	}
	
	typealias ImageResult = Result<ImageData, ImageError>
	typealias CompletionBlock = (result: ImageResult) -> Void

	func obtainImageDataFromPickedImage(info: [String : AnyObject], completion: CompletionBlock) {
		/*
		The obtainImageDataFromPickedImage() is horrible to work with.
		There is no easy way to obtain the raw data+metadata.
		The raw image has to be obtained one way.
		The metadata has to be obtained another way.
		
		The AssetsLibrary is deprecated with iOS9.
		This code uses the newer Photos api.
		*/

		guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
			completion(result: .Failure(.Message(text: "OriginalImage")))
			return
		}
		guard let url = info[UIImagePickerControllerReferenceURL] as? NSURL else {
			completion(result: .Failure(.Message(text: "ReferenceURL")))
			return
		}
		let result: PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([url], options: nil)
		if result.count < 1 {
			completion(result: .Failure(.Message(text: "PHFetchResult")))
			return
		}
		guard let asset = result.firstObject as? PHAsset else {
			completion(result: .Failure(.Message(text: "PHAsset")))
			return
		}
		let ars: [PHAssetResource] = PHAssetResource.assetResourcesForAsset(asset)
		if ars.count < 1 {
			completion(result: .Failure(.Message(text: "PHAssetResources")))
			return
		}
		let ar = ars.first!
		let filename: String = ar.originalFilename
		//print("original: \(ar.originalFilename)")
		
		let uti: String = ar.uniformTypeIdentifier
		//print("uti: \(uti)")
		
		guard let cgImage = image.CGImage else {
			completion(result: .Failure(.Message(text: "CGImage")))
			return
		}
		

		// obtain mimetype from UTI
		var mimeType = "image/png"
		switch uti {
		case "public.jpeg":
			mimeType = "image/jpeg"
		case "public.png":
			mimeType = "image/png"
		case "com.compuserve.gif":
			mimeType = "image/gif"
		default:
			DLog("unknown uti: \(uti)")
		}

		// Asyncronously obtain image metadata
		let options = PHContentEditingInputRequestOptions()
		options.networkAccessAllowed = true // download asset metadata from iCloud if needed
		asset.requestContentEditingInputWithOptions(options) { (contentEditingInput: PHContentEditingInput?, _) in
			guard let cei = contentEditingInput else {
				completion(result: .Failure(.Message(text: "contentEditingInput")))
				return
			}
			guard let fullSizeImageURL = cei.fullSizeImageURL else {
				completion(result: .Failure(.Message(text: "fullSizeImageURL")))
				return
			}
			guard let fullImage = CoreImage.CIImage(contentsOfURL: fullSizeImageURL) else {
				completion(result: .Failure(.Message(text: "fullImage")))
				return
			}

			// The 'fullImage' metadata contains GPS, orientation and other EXIF data
			// The original image doesn't contain anything useful
			var mergedProperties: [String : AnyObject] = info
			for (key, value) in fullImage.properties {
				mergedProperties[key] = value
			}
			
			
			let data = NSMutableData()
			guard let destination: CGImageDestinationRef = CGImageDestinationCreateWithData(data as CFMutableDataRef, uti, 1, nil) else {
				completion(result: .Failure(.Message(text: "CGImageDestinationCreateWithData")))
				return
			}
			
			CGImageDestinationAddImage(destination, cgImage, mergedProperties as CFDictionaryRef)
			if CGImageDestinationFinalize(destination) == false {
				completion(result: .Failure(.Message(text: "CGImageDestinationFinalize")))
				return
			}

			let maxByteCount = BBEConstants.ImagePicker.maxByteCount
			if data.length > maxByteCount {
				completion(result: .Failure(.Message(text: "image is too big. \(data.length) > \(maxByteCount)")))
				return
			}
			
			let imageData = ImageData(image: image, data: data, filename: filename, mimeType: mimeType)
			completion(result: .Success(imageData))
		}
	}
	
	func didObtainImageData(imageData: ImageData) {
		guard let nc = self.childNavigationController else {
			DLog("no navigationcontroller")
			return
		}
		let vc = UploadViewController.create(imageData.uploadData, delegate: self)
		nc.setViewControllers([vc], animated: true)
	}
}

extension ImagePickerHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		HUD.show(.LabeledProgress(title: "Image picker", subtitle: "Preparing image"))
		obtainImageDataFromPickedImage(info) { [weak self] result in
			switch result {
			case let .Success(imageData):
				HUD.hide()
				self?.didObtainImageData(imageData)
			case let .Failure(ImageError.Message(text)):
				HUD.flash(.LabeledError(title: "Image picker", subtitle: "Could not pick image"))
				DLog("ERROR: Unable to obtain image data. message: \(text)")
				self?.cancel()
			}
		}
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		cancel()
	}
}

extension ImagePickerHandler: UploadViewControllerDelegate {
	func uploadViewControllerDidCancel() {
		cancel()
	}
	
	func uploadViewControllerComplete(uploadData uploadData: UploadData, response: Response_DataUpload) {
		let model = ImageUploadedModel(image: uploadData.image, data: uploadData.data, filename: uploadData.filename, mimeType: uploadData.mimeType, response: response)
		success(model)
	}
}
