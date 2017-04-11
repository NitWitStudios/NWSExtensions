//
//  NWSModalAnimator.swift
//  Pods
//
//  Created by James Hickman on 3/14/17.
//
//

import UIKit

public enum NWSModalAnimatorType {
    case transparent
    case blurred
}

public class NWSModalAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    public var type: NWSModalAnimatorType = .transparent
    
    private var isPresenting: Bool!
    private var backgroundView: UIView!
    private var containerView: UIView!

    // MARK: - NWSModalAnimator
    
    public func performPresentationAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: .to)!
        let fromViewController = transitionContext.viewController(forKey: .from)!
        containerView = transitionContext.containerView

        var backgroundView: UIView!
        switch type {
        case .transparent:
            backgroundView = transparentBackgroundView()
        case .blurred:
            backgroundView = blurredBackgroundView()
        }

        self.backgroundView = backgroundView
        containerView.addSubview(backgroundView)
        
        toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.transform = CGAffineTransform(translationX: 0.0, y: toViewController.view.bounds.size.height)
        fromViewController.view.frame = transitionContext.finalFrame(for: fromViewController)
        containerView.addSubview(toViewController.view)
        
        let animationDuration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: animationDuration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.35, options: [], animations: {
            toViewController.view.transform = transitionContext.targetTransform
            if let blurredBackgroundView = self.backgroundView as? UIVisualEffectView {
                UIView.animate(withDuration: 0.5) {
                    blurredBackgroundView.effect = UIBlurEffect(style: .light)
                }
            }
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        UIView.animate(withDuration: animationDuration * 0.75, delay: 0.0, options: [.curveEaseIn], animations: {
            self.backgroundView.alpha = 1.0
        }, completion: nil)
    }
    
    public func performDismissalAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let animationDuration = self.transitionDuration(using: transitionContext)
        let fromViewController = transitionContext.viewController(forKey: .from)!
        fromViewController.view.frame = transitionContext.finalFrame(for: fromViewController)
        fromViewController.view.transform = transitionContext.targetTransform
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: {
            fromViewController.view.transform = CGAffineTransform(translationX: 0.0, y: fromViewController.view.bounds.size.height)
            if let blurredBackgroundView = self.backgroundView as? UIVisualEffectView {
                UIView.animate(withDuration: 0.5) {
                    blurredBackgroundView.effect = nil
                }
            }
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseInOut, animations: { 
            self.backgroundView.alpha = 0.0
        }) { (finished) in
            self.backgroundView.removeFromSuperview()
        }
    }
    
    private func transparentBackgroundView() -> UIView {
        let backgroundView = UIView(frame: containerView.bounds)
        backgroundView.alpha = 0.0
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return backgroundView
    }
    
    private func blurredBackgroundView() -> UIView {
        let backgroundView = UIVisualEffectView(frame: containerView.bounds)
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return backgroundView
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if self.isPresenting {
            performPresentationAnimation(transitionContext: transitionContext)
        } else {
            performDismissalAnimation(transitionContext: transitionContext)
        }
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if self.isPresenting {
            return 0.5
        }
        return 0.3
    }
    
    // MARK: - UIViewControllerTransitioningDelegate

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
}
