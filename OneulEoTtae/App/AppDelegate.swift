//
//  AppDelegate.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/1/24.
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    /// 앱이 처음 호출될때 실행되는 메서드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        /// 필요한 알림권한 설정
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, . badge]) { granted, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("\(granted)")
            }
        }
        /// 앱 실행 시 사용자에게 알림 허용 권한을 받음
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
        sendNotification(hour: 16, minute: 16)
        return true
    }
    
    /// 앱이 foreground상태 일 때, 알림이 온 경우 어떻게 표현할 것인지 처리
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }

    func sendNotification(hour: Int, minute: Int) {
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "오늘어때??"
            notificationContent.body = "어제보다 오늘 몇도 높습니다."
            
            var date = DateComponents()
            date.hour = hour
            date.minute = minute
            /// UNCalendarNotificationTrigger: 특정 날짜와 시간에 시스템에서 알림을 전송하도록 하는 트리거
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            /// UNNotificationRequest: 알림의 콘텐츠와 배달 트리거 조건이 포함된 로컬 알림 예약 요청
            let request = UNNotificationRequest(identifier: "Notification", content: notificationContent, trigger: trigger)
            /// UNUserNotificationCenter: 앱 또는 앱 확장 프로그램의 알림 관련 활동을 관리하기 위한 중심 개체
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
