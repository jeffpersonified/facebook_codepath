//
//  FeedViewController.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 5/31/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    var selectedImageView: UIImageView!
    var isPresenting: Bool = true
    var interactiveTransition: UIPercentDrivenInteractiveTransition!
    var window = UIApplication.sharedApplication().keyWindow
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        feedScrollView.contentSize = CGSize(width: feedImageView.frame.width, height: feedImageView.frame.height + 64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapWedding1(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        segueToPhotoView()
    }

    @IBAction func didTapWedding2(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        segueToPhotoView()
    }
    @IBAction func didTapWedding3(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        segueToPhotoView()
    }

    @IBAction func didTapWedding4(sender: AnyObject) {
        selectedImageView = sender.view as! UIImageView
        segueToPhotoView()
    }

    @IBAction func didTapWedding5(sender: AnyObject) {
        selectedImageView = sender.view as! UIImageView
        segueToPhotoView() 
    }
    
    func segueToPhotoView() {
        performSegueWithIdentifier("photoViewSegue", sender: nil)
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }       

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        
//        interactiveTransition = UIPercentDrivenInteractiveTransition()
//        // Setting the completion speed gets rid of a weird bounce effect bug when transitions complete
//        interactiveTransition.completionSpeed = 0.99
//        return interactiveTransition
//    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.selectedImageView.image
        imageTransition = ImageTransition()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = imageTransition
    }

}
