//
//  SettingView.swift
//  SwiftUIs
//
//  Created by Jovins on 2021/6/29.
//

import SwiftUI

class Settings: ObservableObject {
    
    enum AccountBehavior: CaseIterable {
        case register, login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color, favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
    
    @Published var showEnglishName: Bool = true
    @Published var sorting = Sorting.id
    @Published var showFavoriteOnly: Bool = false
}

extension Settings.Sorting {
    var text: String {
        switch self {
        case .id:
            return "ID"
        case .name:
            return "名字"
        case .color:
            return "颜色"
        case .favorite:
            return "最爱"
        }
    }
}

extension Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
}

struct SettingView: View {
    
    @ObservedObject var settings = Settings()
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(selection: $settings.accountBehavior, label: Text("")) {
                ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            Button(settings.accountBehavior.text) {
                print("登录/注册")
            }
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: $settings.showEnglishName) {
                Text("显示英文名")
            }
            Picker(selection: $settings.sorting, label: Text("排序方式")) {
                ForEach(Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: $settings.showFavoriteOnly) {
                Text("只显示收藏")
            }
        }
    }
    
    var actionSection: some View {
        Section {
            Button(action: {
                print("清空缓存")
            }) {
                Text("清空缓存").foregroundColor(.red)
            }
        }
    }
    
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
