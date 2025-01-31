/**
 * "我"页面菜单栏
 */

@Component
export struct BNMePageMenu {
  build() {
    Row() {
      // Flex主轴方向元素等距离布局
      // 组件在主轴方向终点端对齐，
      // 最后一个子组件与父元素边沿对齐
      Flex({justifyContent : FlexAlign.End}) {
        // 搜索
        Image($r('app.media.ic_public_search'))
          .width(22)
          .height(22)

        // 间隔
        Column()
          .width(22)

        // 菜单
        Image($r('app.media.ic_public_view_list'))
          .width(22)
          .height(22)
        

      }

    }
  }
}