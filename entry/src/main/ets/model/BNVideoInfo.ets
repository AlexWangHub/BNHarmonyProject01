export class BNVideoInfo {
  // 视频id
  videoId:number = 0;

  // 视频文件路径
  videoPath : string = '';

  // 作者
  author:string = '';

  // 作者头像路径
  portraitPath :string = '';

  // 视频封面路径
  coverPath :string='';

  // 内容
  content:string = '';

  // 点赞数量
  thumbsUpCount :number = 0;

  // 评论数量
  commentCount :number = 0;

  // 收藏数量
  favoriteCount :number = 0;

  // 分享数量
  shareCount :number = 0;

  // 是否关注
  isFollow : boolean = false;

  // 是否点赞
  isThumbsUp:boolean = false;

  // 是否收藏
  isFavorite:boolean = false;


}