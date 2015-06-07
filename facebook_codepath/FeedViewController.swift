//
//  FeedViewController.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 5/31/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {


    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    var selectedImageView: UIImageView!
    
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.selectedImageView.image
        
    }

}
