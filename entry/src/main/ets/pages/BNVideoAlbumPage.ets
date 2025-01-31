/**
 * 视频相册
 */
import { BNConstants } from '../common/BNConstants'
import { BNVideoInfo } from '../model/BNVideoInfo'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct BNVideoAlbumPage {
  build() {
    // 导航布局
    Navigation() {
      // 相册网格
      Grid() {
        ForEach(BNConstants.VIDEO_INFO_UPLOAD_ARR, (videoInfo : BNVideoInfo) => {
          // 生成GridItem
          GridItem() {
            // 相片
            Image($rawfile(videoInfo.coverPath))
              .width('100%')
              .height('100%')
              .onClick(() => {
                // 返回视频发布页面
                router.back({
                  // TODO : 这里鸿蒙有bug，在上一级页面不是按page使用时，这里back加上url不生效了
                  url: 'pages/BNVideoPublishPage',
                  // 传回选择的视频
                  params:{['${BNConstants.PARAM_SELECTED_VIDEO_INFO_KEY}']:videoInfo}
                })
              })
          }
          .width('100%')
          .aspectRatio(0.755) // 调整宽高比例

        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr') // 列在网格布局宽度上的占比是均匀的
      .rowsGap(2) // 行间距
      .columnsGap(2) // 列间距



    }
    .title('视频相册')
    .hideBackButton(false) // 显示返回按钮
    .titleMode(NavigationTitleMode.Mini) // 小标题模式


  }
}