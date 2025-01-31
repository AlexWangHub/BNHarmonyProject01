/**
 * 视频发布页面
 */
import { router } from '@kit.ArkUI'
import { BNVideoInfo } from '../model/BNVideoInfo';

@Entry  // 转为能路由的页面
@Preview
@Component
export struct BNVideoPublishPage {
  @State selectedVideoInfo : BNVideoInfo = new BNVideoInfo();

  onPageShow(): void {
    // 获取选中的视频
    // 通过传递过来的路由参数中的对象
    let params = router.getParams();

    // 判断参数对象是否存在，存在再获取视频封面
    if (params != null) {
      this.selectedVideoInfo = (params as Record<string, BNVideoInfo>)['${BNConstants.PARAM_SELECTED_VIDEO_INFO_KEY}']
    }
  }

  build() {
    Navigation() {
      Row(){
        Column(){
          // 视频封面
          Image($rawfile(this.selectedVideoInfo.coverPath.length > 0 ? this.selectedVideoInfo.coverPath :  'video/ic_video_upload.png'))
            .width(136)
            .height(180)
            .onClick(()=> {
              // 跳转到视频相册
              router.pushUrl({
                url: 'pages/BNVideoAlbumPage'
              })
            })

          // 视频内容
          TextArea({
            placeholder: '请输入视频内容'
          })
            .width(320)
            .height(100)
            .borderRadius(8)
            .backgroundColor('#F9F9F9')
            .margin({
              top:10
            })
            .fontSize(20)

          // @binbin 在鸿蒙工程里，如果搞一个全局单例service？ 怎么弄MVVM结构？
          // 如果想存全局缓存，可以使用 AppStorage
          // MVVM结构，Model、View、ViewModel
          // 可以参考 LazyForEach 和 IDataSource 的组合方式

          // 发布按钮
          Button('发布',{type : ButtonType.Normal})
            .width(320)
            .height(50)
            .borderRadius(8)
            .backgroundColor('#FFD0DA')
            .margin({
              top : 10
            })
            .fontSize(24)
            .onClick(() => {
              // 校验通过
              // 跳转到Index页面
              router.replaceUrl({
                url : 'pages/Index'
              })
            })

        }.width('100%')

      }.height('100%')
    }    .title('发布视频')
    .hideBackButton(false) // 显示返回按钮
    .titleMode(NavigationTitleMode.Mini) // 小标题模式

  }
}