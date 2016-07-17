# SwiftyFORM Image picker cell

WARNING: This doesn't work out of the box, yet.

This image picker extracts the original image with exif metadata and uploads it to a remote server.
The original image may be way too big, eg. a panorama image can be 13 MB, so you may have to adjust it for your own needs.


1. The user taps the cell.
2. The image picker is shown.
3. The user picks an image.
4. An image uploader page is shown while uploading.
5. The 'valueDidChange' callback is invoked.



# Usage

	let model = BBIImagePickerCellModel()
	model.dataRef = "the id to assign to the image"
	model.valueDidChange = { (value: DataRef) in
		DLog("save the parameter")
	}

	let formItem = CustomFormItem()
	formItem.createCell = { context in
		model.viewController = context.viewController
		return try BBIImagePickerCell.cellWithModel(model)
	}
	formBuilder += formItem


# Dependencies

	pod 'Alamofire'
	pod 'AlamofireImage'
	pod 'SwiftyJSON'
	pod 'SSEventFlow', :git => 'https://github.com/neoneye/SSEventFlow.git', :tag => '0.2.0'
	pod 'SwiftyFORM', :git => 'https://github.com/neoneye/SwiftyFORM.git', :commit => '2a0195af9ab97baee8c2f1c1b78d84c8d3e41689'
	pod 'PKHUD', '3.1.0'
