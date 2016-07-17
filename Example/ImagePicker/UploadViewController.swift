// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import UIKit

class UploadData {
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
}

protocol UploadViewControllerDelegate: class {
	func uploadViewControllerDidCancel()
	func uploadViewControllerComplete(uploadData uploadData: UploadData, response: Response_DataUpload)
}

class UploadViewController: UIViewController {
	@IBOutlet weak var progressText: UILabel!
	@IBOutlet weak var progressView: UIProgressView!
	@IBOutlet weak var imagePreviewArea: ImagePreviewArea!
	
	private var uploadData: UploadData!
	private weak var delegate: UploadViewControllerDelegate?

	static func create(uploadData: UploadData, delegate: UploadViewControllerDelegate?) -> UploadViewController {
		let sb = UIStoryboard(name: "UploadViewController", bundle: nil)
		guard let vc = sb.instantiateInitialViewController() as? UploadViewController else {
			fatalError()
		}
		vc.uploadData = uploadData
		vc.delegate = delegate
		return vc
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		assert(uploadData != nil)
		imagePreviewArea.imageView.image = uploadData.image
		imagePreviewArea.mode = .ShowImage
		
		reloadProgress()

		navigationItem.rightBarButtonItem = cancelButton
	}
	
	lazy var cancelButton: UIBarButtonItem = {
		let instance = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(UploadViewController.cancelAction))
		return instance
	}()
	
	var totalBytesRead: Int64 = 0
	var totalBytesExpectedToRead: Int64 = 0

	@IBAction func cancelAction(sender: AnyObject) {
		delegate?.uploadViewControllerDidCancel()
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		upload()
	}
	
	func reloadProgress() {
		if totalBytesExpectedToRead > 0 {
			progressView.progress = Float(totalBytesRead) / Float(totalBytesExpectedToRead)
		} else {
			progressView.progress = 0
		}
		
		let formatter = NSByteCountFormatter()
		formatter.countStyle = .Binary
		formatter.zeroPadsFractionDigits = true
		let currentString = formatter.stringFromByteCount(totalBytesRead)
		let expectedString = formatter.stringFromByteCount(totalBytesExpectedToRead)
		progressText.text = "\(currentString) of \(expectedString)"
	}
	
	func upload() {
		assert(uploadData != nil)
		
		let progress: DataUploadProgress = { [weak self] (bytesRead: Int64, totalBytesRead: Int64, totalBytesExpectedToRead: Int64) in
//			DLog("!!!!!!!!!!! upload \(bytesRead)")
			dispatch_async(dispatch_get_main_queue()) {
				self?.totalBytesRead = totalBytesRead
				self?.totalBytesExpectedToRead = totalBytesExpectedToRead
				self?.reloadProgress()
			}
		}
		
		Network.service.data.upload(
			uploadData.data,
			filename: uploadData.filename,
			mimeType: uploadData.mimeType,
			progress: progress
		) { [weak self] uploadCompletion in
			do {
				let response: Response_DataUpload = try uploadCompletion()
				self?.didUpload(response: response)
			} catch {
				DLog("upload failure \(error)")
			}
		}
	}

	func didUpload(response response: Response_DataUpload) {
		assert(uploadData != nil)
		delegate?.uploadViewControllerComplete(uploadData: uploadData, response: response)
	}

}
