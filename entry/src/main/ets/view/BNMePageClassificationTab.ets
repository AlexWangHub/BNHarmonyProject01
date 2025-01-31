/**
 * "我"作品分类
 */
@Component
export struct BNMePageClassificationTab {
  // 当前Tabs页签的索引
  @State currentIndex : number = 0;


  build() {
    Column() {
      // 设置Tab组件为BarPosition.Start，
      // 将导航栏固定在顶部位置
      Tabs({barPosition:BarPosition.Start}) {
        TabContent() {

        }.tabBar(this.TabBuiler('作品',0))

        TabContent() {

        }.tabBar(this.TabBuiler('喜欢',1))

        TabContent() {

        }.tabBar(this.TabBuiler('收藏',2))

        TabContent() {

        }.tabBar(this.TabBuiler('关注',3))


      }
      .onChange((index : number) => {
        // 记录当前Tabs页签的索引
        this.currentIndex = index;
      })
    }
    .width('100%')
    .height('100%')
  }

  // 自定义导航栏
  @Builder
  TabBuiler(title:string, index:number) {
    Column() {
      // 设置选中和不选中的样式
      // @binbin 怎么做类似抖音的那种导航栏，下面有一个横线的那种
      Text(title)
        .fontColor(this.currentIndex === index ? '#FFFFFF' : '#F8FAEC')
        .fontSize(this.currentIndex === index ? 20 : 18)

      // 设置选中时下划线效果
      Divider()
        .strokeWidth(1)
        .color('#FFFFFF')
        .visibility(this.currentIndex === index ? Visibility.Visible : Visibility.Hidden)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center) // 对齐方式
  }
}