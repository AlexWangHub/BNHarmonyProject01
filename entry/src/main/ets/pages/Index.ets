/*
  主页面
 */
import { BNConstants } from '../common/BNConstants';
import { BNVideoInfoDataSource } from '../datasource/BNVideoInfoDataSource';
import { BNMainPage } from './BNMainPage';
import { BNMePage } from './BNMePage';
import { BNVideoPublishPage } from './BNVideoPublishPage';
import { router } from '@kit.ArkUI';
import { BNUserInfo } from '../model/BNUserInfo';
import { BNVideoInfo } from '../model/BNVideoInfo';

@Entry
@Component
struct Index {
  @State isShowVideoView : boolean = false;
  // 当前Tabs页面的索引
  @State currentIndex : number = 0;

  // 视频信息数据源
  @State videoInfoDataSource : BNVideoInfoDataSource = new BNVideoInfoDataSource(BNConstants.VIDEO_INFO_ARR);

  // Tabs组件的控制器
  private tabsController : TabsController = new TabsController();

  // 组件即将出现时回调
  aboutToAppear(): void {
    if (this.currentIndex === 0) {
      this.isShowVideoView = true;
    }
  }

  aboutToDisappear(): void {
    this.isShowVideoView = false;
  }

  // 页面每次显示时，包括路由过程、应用进入前后台
  onPageShow(): void {
    if (this.currentIndex === 0) {
      this.isShowVideoView = true;
    }

    // 从路由参数中获取用户信息
    //
    let params = router.getParams() as Record<string, BNUserInfo | BNVideoInfo>;
    if (params != null) {
      let userInfo: BNUserInfo = params[BNConstants.PARAM_LOGGED_USER_INFO_KEY] as BNUserInfo;
      if (userInfo != null) {
        // 设置应用全局的UI状态存储
        AppStorage.setOrCreate('UserInfo.username',userInfo.username);
        AppStorage.setOrCreate('UserInfo.portraitPath',userInfo.portraitPath);
      }
    }


  }

  onPageHide(): void {
    this.isShowVideoView = false;
  }

  build() {
    // 基于Tabs组件设置导航栏
    // 设置Tabs barPosition，将导航栏固定在底部
    // 设置Tabs的控制器
    Tabs({barPosition: BarPosition.End, controller : this.tabsController}) {
      TabContent() {
        BNMainPage({
          isShowVideoView:this.isShowVideoView,
          videoInfoDataSource:this.videoInfoDataSource
        });
      }.tabBar(this.TabBuilder('首页',0))

      TabContent() {
      }.tabBar(this.TabBuilder('朋友',1))

      TabContent() {
        // 将 BNVideoPublishPage 从Index中剥离掉
        // BNVideoPublishPage();
      }.tabBar(this.TabBuilder('+',2))

      TabContent() {
      }.tabBar(this.TabBuilder('消息',3))

      TabContent() {
        BNMePage();
      }.tabBar(this.TabBuilder('我',4))
    }
  }

  // 自定义导航栏样式
  @Builder
  TabBuilder(title : string, index : number) {
    Column() {
      // 设置选中和未选中的样式
      Text(title)
        .fontColor(this.currentIndex === index ? '#FFFFFF' : '#D3D3D3')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
    .onClick( () => {
      // 如果是视频发布页面的页签索引，则跳转到视频发表页
      if (index === 2) {
        router.pushUrl({
          url:'pages/BNVideoPublishPage'
        })
        return;
      }
      this.currentIndex = index;
      if (index === 0) {
        this.isShowVideoView = true;
      } else {
        this.isShowVideoView = false;
      }

      this.tabsController.changeIndex(index);

    })
  }

}


