/**
 * 用户
 */
export class BNUserInfo {
  // 用户ID
  userId: number = 0;
  // 输入的账号
  username: string;
  // 输入的密码
  password: string;
  // 头像路径
  portraitPath: string;

  // 构造函数
  constructor(username: string, password: string, portraitPath: string) {
    this.username = username;
    this.password = password;
    this.portraitPath = portraitPath;
  }
}