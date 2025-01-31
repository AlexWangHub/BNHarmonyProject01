/**
 * "我"页面个人信息展示
 */

@Component
export struct BNMePageUserInfo {
  build() {
    Row() {
      // 头像
      Image($rawfile(AppStorage.get('UserInfo.portraitPath')))
        .width(80)
        .height(80)
        .borderRadius(40)

      // 账号
      Text(AppStorage.get('UserInfo.username'))
        .fontSize(25)
        .fontColor(Color.White)
        .margin({left : 6})


    }
    .width('100%')
    .height('80')
  }
}