//
//  ViewController.swift
//  SpotTheScientist
//
//  Created by Pawan Kumar on 28/04/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "scientists", bundle: nil) else  {
            fatalError("Could not load tracking images")
        }

        configuration.trackingImages = trackingImages
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let imageAnchor = anchor as? ARImageAnchor else { return nil }
        
        guard let name = imageAnchor.referenceImage.name else { return nil }
        
        guard let scientist =
        
        let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height:  imageAnchor.referenceImage.physicalSize.height)
        plane.firstMaterial?.diffuse.contents = UIColor.clear
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -pi / 2
        
        let node = SCNNode()
        node.addChildNode(planeNode)
        
        
        let spacing : Float = 0.005
        
        let titleNode = textNode(Scientist, font: <#T##UIFont#>)
        return planeNode
    }
    
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "Scientists", withExtension: "json") else {
            fatalError("Unable to find json in bundle")
        }
        
        
        
        let decoder  = JSONDecoder()
        
    }
    
    
}


extension ViewController {
    var width : Float {
        return (boundingBox.max.x - boundingBox.min.x) * scale.y
    }
    
    var height: Float {
          return (boundingBox.max.y - boundingBox.min.y) * scale.y
    }
    
    
    func pivotOnTopLeft() {
        let (min,max) = boundingBox
        pivot = SCNMatrix4Translate((max.x - min.x) / 2, (max.y - min.y) + min.y, 0)
    }
    
    func textNode(_ str: String, font: UIFont, maxWidth: Int? = nil) -> SCNNode {
        let text = SCNText(string: str, extrusionDepth: 0)
        
        text.flatness = 0.1
        text.font = font
        
        
        if let maxWidth = maxWidth {
            text.containerFrame = CGRect(origin: .zero , size: CGSize(width: maxWidth, height: 500))
            text.isWrapped = true
        }
        
        let textNode = SCNNode(geometry: text)
        
        textNode.scale = SCNVector3(0.002, 0.002, 0.002)
        
        return textNode
        
    }
}

 
