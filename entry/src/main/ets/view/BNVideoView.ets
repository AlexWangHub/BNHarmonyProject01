import { BNPlayState } from '../common/BNPlayState';
import { BNVideoInfo } from '../model/BNVideoInfo';
import { BNVideoClassificationTab } from './BNVideoClassificationTab';
import { BNVideoInfoDisplay } from './BNVideoInfoDisplay';
import { BNVideoSideOperationBar } from './BNVideoSideOperationBar';

@Preview
@Component
export struct  BNVideoView {
  // 当前视频信息
  videoInfo:BNVideoInfo = new BNVideoInfo();

  // 视图控制器
  private videoController:VideoController = new VideoController();

  // 播放器状态
  @State private playState:number = BNPlayState.STOP;

  // 根据videoIndex和isShowVideoView更改视频播放状态
  // @Link 表示和父组件保持一致
  @Link @Watch('handlePageShow') videoIndex:number; // Swiper
  @Link @Watch('handlePageShow') isShowVideoView : boolean; // 前后台相关

  // 组件即将出现时回调
  aboutToAppear(): void {
    this.handlePageShow();
  }

  // 当前视频的索引位置
  videoInfoPosition : number = 0; // 自己所在的位置

  /**
   * @binbin swipe的 deleteItem/insertItem/appendItems怎么处理？
   * Ans：使用IDataSource，这是可以和懒加载/监听数据变更的控件，有各种数据变更的监听器
   */

  build() {
    // 层叠布局
    Stack(){
      // 视频播放器
      // ({})里填的是初始化的信息，.是修饰调整的信息
      Video({
        src: $rawfile(this.videoInfo.videoPath),
        previewUri: $rawfile(this.videoInfo.coverPath),
        controller: this.videoController,
      })
        .controls(true)
        .autoPlay(this.playState === BNPlayState.START ? true : false)
        .objectFit(ImageFit.Contain) // 视频适配模式，不变形
        .loop(true)
        .width('100%')
        .height('100%')
        .onClick( () => this.handleOnClick())

      // 视频开始按钮
      Image($r('app.media.ic_public_play'))
        .width('50')
        .height('50')
        .visibility(this.playState === BNPlayState.START ? Visibility.Hidden : Visibility.Visible)
        .onClick( () => this.handleOnClick())

      // 视频信息展示区
      BNVideoInfoDisplay({
        videoInfo : this.videoInfo
      })
        .offset({x : '0%', y: '37%'})

      // 侧标操作栏
      BNVideoSideOperationBar({
        videoInfo: this.videoInfo
      })
        .position({x : '89%',y : '45%'})

      // 视频分类页签
      // @binbin 如果不按照Stack的顺序，有没有哪个属性可以执行层级的？ 不然只依赖代码位置有点危险
      // 可以用 zIndex ，如果不使用 zIndex ，那么所有元素的 zIndex 都是0。
      BNVideoClassificationTab()
        .position({x : 0, y :0}) // 绝对布局
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }

 /**
  * 播放
  */
  play():void {
    // 修改播放状态为START
    if (this.playState != BNPlayState.START) {
      this.playState = BNPlayState.START;
    }

    // 通过控制器执行播放
    this.videoController.start();
  }

  /**
   * 暂停
   */
  pause(): void {
    if (this.playState != BNPlayState.PAUSE) {
      this.playState = BNPlayState.PAUSE;
    }

    this.videoController.pause();
  }

  /**
   * 停止
   */
  stop() : void {
    if (this.playState != BNPlayState.STOP) {
      this.playState = BNPlayState.STOP;
    }
    this.videoController.stop();
  }

  /**
   * 点击处理
   */
  handleOnClick() : void {
    // 如果播放状态是开始，则暂停
    // 如果播放状态是暂停，则开始
    if (this.playState === BNPlayState.START) {
      this.pause();
    }else if(this.playState === BNPlayState.PAUSE || this.playState === BNPlayState.STOP) {
      this.play();
    }
  }

  /**
   * 根据videoIndex/isShowVideoView/videoInfoPosition 调整播放状态
   */
  handlePageShow() : void {
    // 判断视频界面是否进入前台
    // 同时判断当前视频索引是否为Swiper选中的视频
    if (this.isShowVideoView === true && this.videoInfoPosition === this.videoIndex) {
      this.play();
    }else{
      this.stop();
    }

  }

}