/**
 * 视频分类页签
 */

@Component
export struct BNVideoClassificationTab {
  build() {

    Row() {
      // Flex 主轴方向元素等间距布局
      // 间距配置：相邻子组件之间的间距、第一个子组件起始端的间距、最后一个子组件到主轴终点的间距
      Flex({
        justifyContent:FlexAlign.SpaceEvenly
      }) {
        Text('直播')
          .fontColor('#FEFEFE')
          .fontSize(18)

        Text('同城')
          .fontColor('#FEFEFE')
          .fontSize(18)

        Text('关注')
          .fontColor('#FEFEFE')
          .fontSize(18)

        Text('推荐')
          .fontColor('#FEFEFE')
          .fontSize(18)

        Text('搜索')
          .fontColor('#FEFEFE')
          .fontSize(18)

      }
    }.height('50')

  }
}