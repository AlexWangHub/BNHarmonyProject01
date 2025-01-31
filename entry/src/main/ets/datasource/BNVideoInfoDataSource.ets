/**
 * 视频信息数据源：继承BasicDataSource类，指定泛型为VideoInfo类型
 */
import { BNVideoInfo } from '../model/BNVideoInfo';
import { BNBasicDataSource } from './BNBasicDataSource';

export class BNVideoInfoDataSource extends BNBasicDataSource<BNVideoInfo> {
  constructor(videoArray : Array<BNVideoInfo>) {
    // 调用父类构造函数进行初始化
    super(videoArray);
  }
}