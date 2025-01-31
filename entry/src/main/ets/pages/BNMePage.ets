import { BNMePageClassificationTab } from "../view/BNMePageClassificationTab";
import { BNMePageMenu } from "../view/BNMePageMenu";
import { BNMePageUserInfo } from "../view/BNMePageUserInfo";

@Preview
@Component
export struct BNMePage {

  @State message:string = "Me Page";
  build() {
      Column() {
        // 菜单栏
        BNMePageMenu()
          .padding({right:10,top:10})

        // 个人信息展示区
        BNMePageUserInfo()
          .padding({left:10,top : 60})

        // 作品分类
        // @binbin 什么时候用 .margin ，什么时候用 .padding ?
        // 跟其它开发是一样的，padding是控制内部子元素的，用于统治。margin是用于社交
        BNMePageClassificationTab()
          .padding({left : 10, right : 10, top : 10 ,bottom : 10})

      }
      .width('100%')
    .height('100%')
      // @binbin 图片加载的$r和$rawfile有什么区别？
      /**
       * 在鸿蒙（HarmonyOS）开发中，$r(“”) 和 $rawfile(“”) 是两种不同的资源引用方式，它们分别用于引用不同的资源类型。
       * 1、$r("")
       *  $r 函数通常用于引用字符串、颜色、尺寸、样式等定义在资源文件（如 strings.json, colors.json, dimens.json, styles.xml 等）中的资源。
       *  这些资源文件通常位于 resources 目录下，并且可以通过 $r 函数结合资源文件的命名空间（如 app.string）和具体的资源名称（如 work）来引用。
       *  注意！ 也可以是引用图片资源，放在 base/media 下就好
       *
       * 2、$rawfile("")
       *   $rawfile 函数则用于引用原始文件资源，如图片、音频、视频、HTML等。这些原始文件通常位于 resources/rawfile 目录下，
       *   你可以通过 $rawfile 函数直接引用这些文件的路径（相对于 rawfile 目录）。
       *   resources/rawfile/
       *
       */
    .backgroundImage($r('app.media.background'))
    .backgroundImageSize({width : '100%', height : '100%'})

  }
}