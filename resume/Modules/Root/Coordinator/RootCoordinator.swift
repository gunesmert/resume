import UIKit

final class RootCoordinator: Coordinator {
	lazy private(set) var viewController: UIViewController = {
		return RootViewController()
	}()
}
