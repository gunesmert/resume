import UIKit
import SnapKit

final class RootCoordinator: Coordinator {
	private let mainCoordinator = MainCoordinator()
	
	lazy private(set) var viewController: UIViewController = {
		return RootViewController()
	}()
	
	// MARK: - Constructors
	init() {
		activateMainCoordinator()
	}
	
	// MARK: - Coordination Methods
	private func addChildCoordinator(_ coordinator: Coordinator) {
		DispatchQueue.main.async { [weak self] in
			guard let strongSelf = self else { return }
			if strongSelf.viewController.children.contains(coordinator.viewController) { return }
			strongSelf.viewController.addChild(coordinator.viewController)
			strongSelf.viewController.view.addSubview(coordinator.viewController.view)
			coordinator.viewController.view.snp.makeConstraints { $0.edges.equalToSuperview() }
			coordinator.viewController.didMove(toParent: strongSelf.viewController)
		}
	}
	
	private func removeChildCoordinator(_ coordinator: Coordinator) {
		DispatchQueue.main.async {
			coordinator.viewController.willMove(toParent: nil)
			coordinator.viewController.view.removeFromSuperview()
			coordinator.viewController.removeFromParent()
		}
	}
	
	private func activateMainCoordinator() {
		addChildCoordinator(mainCoordinator)
	}
}
