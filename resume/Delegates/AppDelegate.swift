import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	private let rootCoordinator: RootCoordinator
	
	override init() {
		self.rootCoordinator = RootCoordinator()
		super.init()
	}
	
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		if isTesting { return true }
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = rootCoordinator.viewController
		window.makeKeyAndVisible()
		
		self.window = window
		
		return true
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		
	}
	
	private var isTesting: Bool {
		return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
	}
}
