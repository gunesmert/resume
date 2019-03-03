import UIKit

final class MainCoordinator: Coordinator {
	lazy private(set) var viewController: UIViewController = {
		return MainViewController()
	}()
}
