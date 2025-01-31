/**
 * 头像相册
 */
import { BNPortraitInfo } from '../model/BNPortraitInfo'
import { BNConstants } from '../common/BNConstants'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct BNPortraitAlbumPage {
  @State portraitInfoArr : Array<BNPortraitInfo> = (router.getParams() as Record<string , Array<BNPortraitInfo>>)['${BNConstants.PARAM_PORTRAINT_INFO_ARR_KEY}'];

  build() {

    Navigation() {
      // 网格Grid
      Grid() {
        // 网格GridItem
        ForEach(this.portraitInfoArr,(portraitInfo:BNPortraitInfo) => {
          GridItem() {
            Image($rawfile(portraitInfo.portraitPath))
              .width('100%')
              .height('100%')
              .onClick(()=>{ // 点击选择头像
                // 返回注册登录界面
                router.back({
                  url:"pages/BNRegisterPage",
                  // 传回选择的头像
                  // 上一个页面通过 OnPageShow 的方式来获取头像选择的结果
                  params:{['${BNConstants.PARAM_SELECTED_PORTRAIT_INFO_KEY}']:portraitInfo}
                })
              })
          }
          .width('100%')
          .aspectRatio(1) // GridItem 高和宽 的比例
        })
      }.columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(2)

    }.title('头像相册')
    .hideBackButton(false)
   .titleMode(NavigationTitleMode.Mini)

  }

}