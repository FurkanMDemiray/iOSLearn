//
//  ViewController.swift
//  CrayzBirds
//
//  Created by Melik Demiray on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var angleText: UITextField!
    @IBOutlet weak var velocityText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    var bottle: Bottle?
    var bullet: Bullet?

    override func viewDidLoad() {
        super.viewDidLoad()
        createCanon()
        createBottle()
    }
    func createCanon() {
        let imageView = UIImageView(image: UIImage(named: "canon"))
        imageView.frame = CGRect(x: 40, y: UIScreen.main.bounds.height - 40, width: 40, height: 40)
        view.addSubview(imageView)
    }
    func addAnimationToImage(_ distance: Double) {
        let imageView = UIImageView(image: UIImage(named: "bullet"))
        let frame = CGRect(x: 40, y: UIScreen.main.bounds.height - 40, width: 25, height: 25)
        imageView.frame = frame
        view.addSubview(imageView)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.path = makePath(distance).cgPath
        imageView.layer.add(animation, forKey: nil)
    }
    func makePath(_ distance: Double) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: UIScreen.main.bounds.height - 30)) // current point
        path.addCurve(to: CGPoint(x: abs(distance), y: UIScreen.main.bounds.height - 15), controlPoint1: CGPoint(x: abs(distance) / 2, y: abs(distance) / 6), controlPoint2: CGPoint(x: UIScreen.main.bounds.width - 30, y: abs(distance) / 8))
        return path
    }
    func createBottle() {
        let imageView = UIImageView(image: UIImage(named: "bottle"))
        let randomX = CGFloat.random(in: UIScreen.main.bounds.width / 2 ... UIScreen.main.bounds.width - 100)
        let frame = CGRect(x: randomX, y: UIScreen.main.bounds.height - 53, width: 100, height: 53)
        imageView.frame = frame
        view.addSubview(imageView)
        bottle = Bottle(position: Double(randomX), size: 35, isHit: false)
    }
    func isHit(distance: Double, size: Double, bottlePosition: Double) -> Bool {
        print(abs(distance) - 40, size, bottlePosition)
        return bottlePosition - size <= abs(distance) - 40 && abs(distance) - 40 <= bottlePosition + size
    }
    @IBAction func btnClicked(_ sender: Any) {
        if let velocity = Double(velocityText.text ?? "0"), let angle = Double(angleText.text ?? "0") {
            bullet = Bullet(velocity: velocity, angle: angle)
            addAnimationToImage(bullet!.distance())
            if isHit(distance: bullet!.distance(), size: bottle!.size, bottlePosition: bottle!.position) {
                resultLabel.text = "HIT"
            } else {
                resultLabel.text = "MISS"
            }
        }
    }
    @IBAction func restartButton(_ sender: Any) {
        let subviews = self.view.subviews
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
        resultLabel.text = ""
        velocityText.text = ""
        angleText.text = ""
        createCanon()
        createBottle()
    }
}

