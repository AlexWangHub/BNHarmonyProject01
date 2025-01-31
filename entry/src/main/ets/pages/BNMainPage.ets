import { BNConstants } from '../common/BNConstants';
import { BNVideoInfoDataSource } from '../datasource/BNVideoInfoDataSource';
import { BNVideoInfo } from '../model/BNVideoInfo';
import { BNVideoView } from '../view/BNVideoView';

@Preview
@Component
export struct BNMainPage {
  @State private videoInfo:BNVideoInfo = new BNVideoInfo();
  // private videoArray: Array<BNVideoInfo> = BNConstants.VIDEO_INFO_ARR;

  // 视频信息数据源
  // @Link 数据源的双向绑定
  @Link videoInfoDataSource : BNVideoInfoDataSource;

  // 当前播放的视频索引
  @State videoIndex : number = 0;
  // 是否显示视频界面
  @Link isShowVideoView : boolean;

  aboutToAppear(): void {
    // 只有page页才会走 onPageShow 的回调
    // 如果不是page页，只是普通的自定义组件，那就看 aboutToAppear 这个回调
  }

  build() {
    /*
    Row(){
      Column(){
          .fontSize(45)
        Text(this.message)
      }.width('100%')
    }.height('100%')

    上面这个框架是常用的默认初始化框架

     */

    Row(){
      Column(){
        Swiper() {
          // 数据懒加载，从提供的数据源中按需迭代数据
          LazyForEach(this.videoInfoDataSource, (videoInfo: BNVideoInfo, position) => {
            BNVideoView({
              videoInfo: videoInfo,
              videoInfoPosition: position,
              videoIndex: this.videoIndex,
              isShowVideoView: this.isShowVideoView
            })
          })
        }
          .width('100%')
          .height('100%')
          .indicator(false)
          .loop(false)
          .vertical(true)
        .onChange((index: number) => {
          // 记录播放的索引
          this.videoIndex = index;
        })
      }.width('100%')
    }.height('100%')


  }
}