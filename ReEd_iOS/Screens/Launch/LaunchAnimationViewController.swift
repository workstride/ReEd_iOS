import UIKit
import Lottie

class LaunchAnimationViewController: UIViewController {
    private var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { 
            self.playAnimation()
        }
    }
    
    private func loadAnimation() {
        let animation = LottieAnimation.named("flip_bookloader")
        animationView = LottieAnimationView(animation: animation)
        
        // 원하는 크기로 애니메이션 뷰의 프레임을 설정합니다.
        let animationSize = CGSize(width: 300, height: 300)
        let animationOrigin = CGPoint(x: view.bounds.midX - animationSize.width/2, y: view.bounds.midY -
                                      animationSize.height/2)
        animationView.frame = CGRect(origin: animationOrigin, size: animationSize)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
    }
    
    private func playAnimation() {
        if let animationView = animationView {
            view.addSubview(animationView)
            animationView.play(completion: { [weak self] _ in
                self?.showMyViewController()
            })
        }
    }
    
    private func showMyViewController() {
        let myViewController = ViewController()
        navigationController?.setViewControllers([myViewController], animated: true)
    }
    // MARK: 런치 스크린 로티 애니메이션
}
