// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit
import SwiftyFORM

class PrecisionSlidersViewController: RFFormViewController {
	override func populate(_ builder: RFFormBuilder) {
		builder.navigationTitle = "Precision Sliders"
		builder.toolbarMode = .none
		builder.demo_showInfo("Zoom can be adjusted\nusing a pinch gesture")

		builder += RFSectionHeaderTitleFormItem().title("Zoom UI enabled")
		builder += RFPrecisionSliderFormItem().decimalPlaces(0).minimumValue(0).maximumValue(255).value(127).title("A 0 255").enableZoomUI()
		builder += RFPrecisionSliderFormItem().decimalPlaces(2).minimumValue(-100).maximumValue(100).value(25).title("B -1 1").enableZoomUI()

		builder += RFSectionHeaderTitleFormItem().title("Partial one-cell")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(250).maximumValue(500).value(450).title("A 0.25 0.5")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-500).maximumValue(-250).value(-450).title("B -0.5 -0.25")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(800).maximumValue(900).value(850).title("C 0.8 0.9")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-900).maximumValue(-800).value(-850).title("D -0.9 -0.8")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(499).maximumValue(501).value(500).title("E 0.499 0.501")

		builder += RFSectionHeaderTitleFormItem().title("Partial. No full")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-50).maximumValue(50).value(0).title("A -0.05 0.05")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-3_050).maximumValue(-2_950).value(-3_000).title("B -3.05 -2.95")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(2_950).maximumValue(3_050).value(3_000).title("C 2.95 3.05")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-750).maximumValue(750).value(0).title("D -0.75 0.75")

		builder += RFSectionHeaderTitleFormItem().title("First cell")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(1_100).maximumValue(6_000).value(2_000).title("A 1.1 6.0")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(1_400).maximumValue(6_000).value(2_000).title("B 1.4 6.0")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(1_600).maximumValue(6_000).value(2_000).title("C 1.6 6.0")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(1_900).maximumValue(6_000).value(2_000).title("D 1.9 6.0")

		builder += RFSectionHeaderTitleFormItem().title("Last cell")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(4_100).value(4_000).title("A 0 4.1")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(4_400).value(4_000).title("B 0 4.4")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(4_600).value(4_000).title("C 0 4.6")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(4_900).value(4_000).title("D 0 4.9")

		builder += RFSectionHeaderTitleFormItem().title("Partial full positive negative")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-1_333).maximumValue(1_333).value(0).title("A -1.333 1.333")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-3_000).maximumValue(3_000).value(0).title("B -3 3")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-8_900).maximumValue(8_900).value(0).title("C -8.9 8.9")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-250).maximumValue(3_250).value(1_500).title("D -0.25 3.25")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-500).maximumValue(500).value(0).title("E -0.5 0.5")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-1_000).maximumValue(1_000).value(0).title("F -1 1")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-2_666).maximumValue(2_666).value(-2_000).title("G -2.666 2.666")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-5_220).maximumValue(5_220).value(0).title("H -5.22 5.22")

		builder += RFSectionHeaderTitleFormItem().title("Huge positive negative")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-475_000).maximumValue(475_000).value(0).title("A -475 475")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-100_000).maximumValue(100_000).value(0).title("B -100 100")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-333_333).maximumValue(333_333).value(0).title("C -333.333 333.333")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-1_000_000).maximumValue(1_000_000).value(0).title("D -1000 1000")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-33_000_000).maximumValue(33_000_000).value(0).title("E -33k 33k")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-256_000_000).maximumValue(256_000_000).value(0).title("F -256k 256k")

		builder += RFSectionHeaderTitleFormItem().title("Partial full positive")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(255_000).value(255_000).title("A 0 255")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(100_000).value(50_000).title("B 0 100")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(360_000).value(0).title("C 0 360")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(3_141).value(1_570).title("D 0 PI")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(0).maximumValue(3_500).value(0).title("E 0 3.5")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(250).maximumValue(3_750).value(0).title("F 0.25 3.75")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(1_400).maximumValue(4_400).value(4_000).title("G 1.4 4.4")

		builder += RFSectionHeaderTitleFormItem().title("Partial full negative")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-20_100).maximumValue(-15_000).value(-18_000).title("A -20.1 -15")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-20_000).maximumValue(-15_000).value(-18_000).title("B -20 -15")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-20_000).maximumValue(-15_100).value(-18_000).title("C -20 -15.1")

		builder += RFSectionHeaderTitleFormItem().title("Behavior")
		builder += RFPrecisionSliderFormItem().title("A Initially collapsed").behavior(.collapsed)
		builder += RFPrecisionSliderFormItem().title("B Initially expanded").behavior(.expanded)
		builder += RFPrecisionSliderFormItem().title("C Always expanded").behavior(.expandedAlways)

		builder += RFSectionHeaderTitleFormItem().title("Decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(0).minimumValue(-1000).maximumValue(1000).value(0).title("0 decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(1).minimumValue(-1000).maximumValue(1000).value(0).title("1 decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(2).minimumValue(-1000).maximumValue(1000).value(0).title("2 decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(3).minimumValue(-1000).maximumValue(1000).value(0).title("3 decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(4).minimumValue(-1000).maximumValue(1000).value(0).title("4 decimal places")
		builder += RFPrecisionSliderFormItem().decimalPlaces(5).minimumValue(-1000).maximumValue(1000).value(0).title("5 decimal places")
	}
}
