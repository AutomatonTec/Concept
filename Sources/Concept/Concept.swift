import Foundation
import UIKit

@objc public class Concept: NSObject {
    private let viewController: UIViewController
    private let configuration: Configuration
    let evenView: UIView
    let oddView: UIView

    @objc public init(with controller: UIViewController, configuration config: Configuration) {
        print(#function)
        viewController = controller
        configuration = config
        evenView = UIView(frame: .zero)
        oddView = UIView(frame: .zero)
        super.init()
        prepareView()
    }

    private func prepareView() {
        print(#function)
        viewController.view.backgroundColor = .black

        viewController.view.addSubview(evenView)
        viewController.view.addSubview(oddView)

        evenView.backgroundColor = configuration.evenColor
        oddView.backgroundColor = configuration.oddColor
    }

    @objc public func didLayout() {
        print(#function)
        let cubit = round(min(viewController.view.bounds.width, viewController.view.bounds.height) / 8)
        let midHeight = viewController.view.bounds.origin.y + (viewController.view.bounds.height / 2)
        let midWidth = viewController.view.bounds.origin.x + (viewController.view.bounds.width / 2)

        let evenBox = CGRect(x: midWidth - (2 * cubit), y: midHeight - cubit, width: cubit, height: cubit)
        let oddBox = CGRect(x: midWidth + (1 * cubit), y: midHeight - cubit, width: cubit, height: cubit)

        evenView.frame = evenBox
        oddView.frame = oddBox

        makeCircle(for: oddView)
    }

    func makeCircle(for view: UIView) {
        view.layer.sublayers?.removeAll()
        let path = UIBezierPath(ovalIn: view.bounds)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 5
        shape.strokeColor = UIColor.white.cgColor
        view.layer.addSublayer(shape)
    }

    @objc public func willAppear() {
        print(#function)
    }

    @objc public func didDisappear() {
        print(#function)
    }
}
