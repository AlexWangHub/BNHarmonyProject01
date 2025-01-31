/**
 * 侧边操作栏
 */
import { BNVideoInfo } from '../model/BNVideoInfo'

@Component
export struct BNVideoSideOperationBar {
  @State videoInfo : BNVideoInfo = new BNVideoInfo();

  build() {
    // 侧边操作栏
    Column() {
      // 点赞
      // 点赞按钮
      Image(this.videoInfo.isThumbsUp ? $r('app.media.ic_like_red') : $r('app.media.ic_like'))
        .width(40)
        .height(40)

      // 点赞量
      Text(this.videoInfo.thumbsUpCount + '')
        .margin({top : 12})
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

      // 评论
      // 评论按钮
      // @binbin 如何在这里设置一个常量，CGFloat widHeight= 40
      // Ans : 声明 private 属性就好了
      Image($r('app.media.ic_comment'))
        .width(40)
        .height(40)

      // 评论量
      Text(this.videoInfo.commentCount + '')
        .margin({top : 12})
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

      // 收藏
      // 收藏按钮
      Image(this.videoInfo.isFavorite ? $r('app.media.ic_star_red') : $r('app.media.ic_star'))
        .width(40)
        .height(40)
      // 收藏量
      Text(this.videoInfo.favoriteCount + '')
        .margin({top : 12})
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

      // 分享
      // 分享按钮
      Image($r('app.media.ic_share'))
        .width(40)
        .height(40)
      // 分享量
      Text(this.videoInfo.shareCount + '')
        .margin({top : 12})
        .fontSize(12)
        .width(40)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)

    }.width(40)
    .height(262)
  }
}