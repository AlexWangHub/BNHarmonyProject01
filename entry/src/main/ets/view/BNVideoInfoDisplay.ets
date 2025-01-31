/**
 * 视频信息展示区
 */
import { BNVideoInfo } from '../model/BNVideoInfo'

@Component
export struct BNVideoInfoDisplay {
  @State videoInfo : BNVideoInfo = new BNVideoInfo();

  build() {
    // 视频信息展示区
    Column() {
      // 用户信息
      Row() {
        // 头像
        Image($rawfile(this.videoInfo.portraitPath))
          .width(60)
          .height(60)
          .borderRadius(30)

        // 账号
        Text(this.videoInfo.author)
          .margin({left : 6})
          .fontSize(25)
          .fontColor(Color.White)

        // 关注按钮
        Text(this.videoInfo.isFollow ? '取关' : '关注')
          .margin({left:6})
          .textAlign(TextAlign.Center)
          .fontSize(16)
          .fontColor('#FEFEFE')
          .backgroundColor(this.videoInfo.isFollow ? Color.Gray : Color.Red)
          .borderRadius(5)
          .width(35)
          .height(20)

      }
      .width('100%')
      .height(70)

      // 视频信息
      Row() {
        Text(this.videoInfo.content)
          .fontSize(16)
          .height(40)
          .fontColor('#FEFEFE')
          .maxLines(2) // 设置文本的最大行数
          .textOverflow({
            overflow:TextOverflow.Ellipsis
          })

      }
      .width('100%')
      .height(40)

    }
    .width('100%')
    .height(118)
    .padding({left : 4 , right: 4 ,top : 4 ,bottom : 4}) //距离父组件的间距

  }
}