//
//  InAppNotification.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//

import Foundation
import SwiftUI

extension UIApplication{
    func inAppNotification<Content: View>(adaptForDynamicIsland: Bool = false, timeout: CGFloat = 5, swipeToClose: Bool = true, @ViewBuilder content: @escaping () -> Content){
        // Fetching Active Window VIA WindowScene
        if let activeWindow = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first(where: {$0.isKeyWindow}) {
            //Frame and safeArea Values
            let frame = activeWindow.frame
            let safeArea = activeWindow.safeAreaInsets
            
            var tag: Int = 1009
            let checkForDynamicIsland = adaptForDynamicIsland && safeArea.top >= 51
            
             if let previousTag = UserDefaults.standard.value(forKey: "in_app_notification_tag") as? Int {tag = previousTag + 1
            }
            
            UserDefaults.standard.setValue(tag, forKey: "in_app_notification_tag")
            
            //Creating UIView from SwiftUIView using UIHosting Configuration
            let config = UIHostingConfiguration{
                AnimatedNotificationView(
                    content: content(),
                    safeArea: safeArea,
                    tag: tag,
                    adaptForDynamicIsland: checkForDynamicIsland,
                    timeout: timeout,
                    swipeToClose: swipeToClose
                )
                //maximum notification Height will be 120
                .frame(width: frame.width - (checkForDynamicIsland ? 20: 30), height: 120, alignment: .top)
                .contentShape(.rect)
                
            }
            //Creating UIView
            let view = config.makeContentView()
            view.tag = tag
            view.backgroundColor = .clear
            view.translatesAutoresizingMaskIntoConstraints = false
            //Adding View to the window
            activeWindow.addSubview(view)
            
            //Layout Constraints
            view.centerXAnchor.constraint(equalTo: activeWindow.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: activeWindow.centerYAnchor, constant: (-(frame.height - safeArea.top) / 2) + (checkForDynamicIsland ? 11 : safeArea.top)).isActive = true
        }
    }
}

fileprivate struct AnimatedNotificationView<Content: View>: View {
    var content: Content
    var safeArea: UIEdgeInsets
    var tag: Int
    var adaptForDynamicIsland: Bool
    var timeout: CGFloat
    var swipeToClose: Bool
    
    //View Properties
    @State private var animateNotification: Bool = false
    var body: some View {
        content
            .blur(radius: animateNotification ? 0 : 10)
            .disabled(!animateNotification)
            .mask{
                if adaptForDynamicIsland {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                } else {
                    Rectangle()
                }
            }
        //Scaling Animation only for Dynamic Island Notification
            .scaleEffect(adaptForDynamicIsland ? (animateNotification ? 1 : 0.01) : 1, anchor: .init(x: 0.5 , y: 0.01))
        // Offset Animation for non Dynamic Island Notification
            .offset(y: offsetY )
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        if -value.translation.height > 50 && swipeToClose {
                            withAnimation(.smooth, completionCriteria : .logicallyComplete) {
                                animateNotification = false
                            } completion: {
                               removeNotificationViewFromWindow()
                            }
                        }
                    })
            )
            .onAppear(perform: {
                Task {
                    guard !animateNotification else { return }
                    withAnimation(.smooth){
                        animateNotification = true
                    }
                    //Timeout For notification
                    try await Task.sleep(for: .seconds(timeout < 1 ? 1 : timeout))
                    guard animateNotification else { return }
                    
                    withAnimation(.smooth, completionCriteria : .logicallyComplete) {
                        animateNotification = false
                    } completion: {
                       removeNotificationViewFromWindow()
                    }
                }
            })
    }
    var offsetY: CGFloat{
        if adaptForDynamicIsland{
            return 0
        }
        return animateNotification ? 10 : -(safeArea.top + 130)
    }
    func removeNotificationViewFromWindow(){
        if let activeWindow = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first(where: { $0.isKeyWindow}){
            if let view = activeWindow.viewWithTag(tag){
                print("Removed View with \(tag)")
                view.removeFromSuperview()
            }
        }
        }
    }


#Preview {
    ContentView()
}
