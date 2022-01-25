//
//  ExtendedDot.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit

public class ExtendedDotDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {
    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    func handleNormalBehavior(_ rect: CGRect) {
        let step: CGFloat = (space + width)
        for i in 0 ... numberOfPages {
            if i != Int(currentItem + 1), i != Int(currentItem) {
                var newX: CGFloat = 0
                var newY: CGFloat = 0
                var newHeight: CGFloat = 0
                var newWidth: CGFloat = 0
                
                let progress = currentItem - floor(currentItem)
                
                var dotColor = dotsColor
                
                if i == Int(currentItem + 2) {
                    // Draws Right dot
                    // Sujaet Right dot
                    dotColor = (dotsColor * Double(1 - progress)) + (indicatorColor * Double(progress))
                    
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let currPosProgress = currentItem - floor(currentItem)
                    let curPos = floor(currentItem + 2) - currPosProgress
                    let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    let halfMovementRatio = 1 - currPosProgress
                    // reverse the scale value
                    let scale = step - (halfMovementRatio * step)
                    
                    newHeight = size
                    newWidth = width + scale
                    newX = rect.origin.x + x
                    newY = y
                    
                } else {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    
                    newHeight = size
                    newWidth = width
                    newX = rect.origin.x + x
                    newY = y
                }
                
                drawItem(CGRect(x: newX, y: newY, width: newWidth, height: newHeight), raduis: radius,
                         color: dotColor,
                         borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }

    func handleLeftBorderBehavior(_ rect: CGRect) {
        let step: CGFloat = (space + width)
        for i in 0 ... numberOfPages {
            if i != Int(currentItem + 1), i != Int(currentItem) {
                var newX: CGFloat = 0
                var newY: CGFloat = 0
                var newHeight: CGFloat = 0
                var newWidth: CGFloat = 0
                
                let progress = -currentItem
                
                var dotColor = dotsColor
                
                if i == 1 {
                    // Draws Right dot
                    // Sujaet Right dot
                    
                    dotColor = (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress))
                    
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    
                    let x = getCenteredXPosition(rect, itemPos: 0, dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    let halfMovementRatio = -currentItem
                    // reverse the scale value
                    let scale = step - (halfMovementRatio * step)
                    
                    newHeight = size
                    newWidth = width + scale
                    newX = rect.origin.x + x
                    newY = y
                     
                    
                } else {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    
                    newHeight = size
                    newWidth = width
                    newX = rect.origin.x + x - progress * step
                    newY = y
                }
                
                drawItem(CGRect(x: newX, y: newY, width: newWidth, height: newHeight), raduis: radius,
                         color: dotColor,
                         borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }

    func handleRightBorderBehavior(_ rect: CGRect) {
        let step: CGFloat = (space + width)
        for i in 0 ... numberOfPages {
            if i != Int(currentItem + 1), i != Int(currentItem) {
                var newX: CGFloat = 0
                var newY: CGFloat = 0
                var newHeight: CGFloat = 0
                var newWidth: CGFloat = 0
                
                let progress = CGFloat(numberOfPages) - currentItem
                
                var dotColor = dotsColor
                
                if i == 0 {
                    // Draws Right dot
                    // Sujaet Right dot
                    
                    dotColor = (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress))
                    
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let currPosProgress = 1 - (CGFloat(numberOfPages) - currentItem)

                    let curPos = 0
                    let x = getCenteredXPosition(rect, itemPos: 0, dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    let halfMovementRatio = 1 - currPosProgress

                    let scale = step - (halfMovementRatio * step)
                    
                    newHeight = size
                    newWidth = width + scale
                    newX = rect.origin.x + x
                    newY = y
                     
                    
                } else {
                    let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
                    let y = rect.origin.y + centeredYPosition
                    let x = getCenteredXPosition(rect, itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages + 1)
                    
                    newHeight = size
                    newWidth = width
                    newX = rect.origin.x + x + (1 - progress) * step
                    newY = y
                }
                
                drawItem(CGRect(x: newX, y: newY, width: newWidth, height: newHeight), raduis: radius,
                         color: dotColor,
                         borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }

    func drawIndicators(_ rect: CGRect) {
        let step: CGFloat = (space + width)

        if currentItem < 0 {
            handleLeftBorderBehavior(rect)
        } else if currentItem > CGFloat(numberOfPages - 1) {
            handleRightBorderBehavior(rect)
        } else {
            handleNormalBehavior(rect)
        }
        
    }

    // Draws left dot
    // Rashiryaet left dot
    fileprivate func drawCurrentItem(_ rect: CGRect) {

        var dotColor: UIColor
        var drawingRect: CGRect
        let centeredYPosition = getCenteredYPosition(rect, dotSize: size)
        let y = rect.origin.y + centeredYPosition

        if currentItem > CGFloat(numberOfPages - 1) {
            let progress = CGFloat(numberOfPages) - currentItem
            let step: CGFloat = (space + width)
            dotColor = (dotsColor * Double(1 - progress)) + (indicatorColor * Double(progress))

            let currPosProgress = CGFloat(numberOfPages) - currentItem
            let curPos = CGFloat(numberOfPages) - currPosProgress
            let x = getCenteredXPosition(
                rect,
                itemPos: curPos,
                dotSize: width,
                space: space,
                numberOfPages: numberOfPages + 1
            )
            let halfMovementRatio = 1 - currPosProgress
            // reverse the scale value
            let scale = step - (halfMovementRatio * step)

            var newHeight = size
            var newWidth = width + scale
            var newX = rect.origin.x + x

            drawingRect = CGRect(
                x: newX,
                y: y,
                width: newWidth,
                height: newHeight
            )
        } else if currentItem < 0 {
            let progress = -currentItem
            let step: CGFloat = (space + width)
            dotColor = (dotsColor * Double(1 - progress)) + (indicatorColor * Double(progress))
            let currPosProgress = -currentItem
            let curPos = CGFloat(numberOfPages) - currPosProgress
            let x = getCenteredXPosition(rect, itemPos: curPos, dotSize: width, space: space, numberOfPages: numberOfPages + 1)
            let halfMovementRatio = 1 - currPosProgress
            // reverse the scale value
            let scale = step - (halfMovementRatio * step)

            var newHeight = size
            var newWidth = width + scale
            var newX = rect.origin.x + x

            drawingRect = CGRect(
                x: newX,
                y: y,
                width: newWidth,
                height: newHeight
            )
        } else {
            let progress = currentItem - floor(currentItem)
            dotColor = (dotsColor * Double(progress)) + (indicatorColor * Double(1 - progress))
            let step: CGFloat = (space + width)
            let currPosProgress = currentItem - floor(currentItem)
            let steadyPosition = floor(currentItem)
            
            let x = getCenteredXPosition(rect,
                                         itemPos: steadyPosition,
                                         dotSize: width,
                                         space: space,
                                         numberOfPages: numberOfPages + 1)
            
            let halfMovementRatio = 1 - currPosProgress
            let desiredWidth = width + (halfMovementRatio * step)
            let desiredX = rect.origin.x + x
            drawingRect = CGRect(
                x: desiredX,
                y: y,
                width: desiredWidth,
                height: size
            )
            
        }

        drawItem(
            drawingRect,
            raduis: radius,
            color: dotColor,
            borderWidth: borderWidth,
            borderColor: borderColor
        )
    }
}
