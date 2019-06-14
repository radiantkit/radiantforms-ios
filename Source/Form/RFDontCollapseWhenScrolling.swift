// MIT license. Copyright (c) 2019 RadiantKit. All rights reserved.
import UIKit

/**
# Don't collapse when scrolling

Use this protocol for cells that shouldn't be collapsed when the user scrolls.
This is usually inline controls, such as inline date pickers.
*/
public protocol RFDontCollapseWhenScrolling {}


@available(*, unavailable, renamed: "RFDontCollapseWhenScrolling")
typealias DontCollapseWhenScrolling = RFDontCollapseWhenScrolling
