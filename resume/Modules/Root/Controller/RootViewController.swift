import UIKit

final class RootViewController: UIViewController {
	// MARK: - Status Bar
	override var childForStatusBarStyle: UIViewController? {
		return children.last
	}
	
	override var childForStatusBarHidden: UIViewController? {
		return children.last
	}
}
