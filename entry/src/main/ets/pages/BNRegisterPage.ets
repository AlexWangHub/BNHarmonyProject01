/**
 * 注册登录界面
 */
import { promptAction, router } from '@kit.ArkUI';
import { BNConstants } from '../common/BNConstants';
import { BNPortraitInfo } from '../model/BNPortraitInfo';
import { BNUserInfo } from '../model/BNUserInfo';

@Entry
@Component
struct BNRegisterPage {
  // 选择的头像
  @State selectedPortraitInfo: BNPortraitInfo = new BNPortraitInfo();
  // 输入的账号
  @State username:string = '';
  // 输入的密码
  @State password:string = '';

  // 页面显示时的触发（生命周期）
  onPageShow(): void {
    // 从路由参数中获取选中的头像
    let params = router.getParams();
    // 判断路由参数对象是否存在
    if (params != null) {
      /**
       * @binbin 有问题，如果上个页面pushBack的时候塞了不同类型的参数，那这里解析会不会crash？
       * Ans : 会crash，所以还是很危险的，要做好保护
       * 取value的时候，要判断类型 : let isInstance = obj instanceof (typeof MyClass);
       */
      this.selectedPortraitInfo = (params as Record<string,BNPortraitInfo>)['${BNConstants.PARAM_SELECTED_PORTRAIT_INFO_KEY}'];
    }
  }

  build() {
    // row就设高，因为row行宽默认是100%
    // column就设宽，因为column列高默认是100%
    Row() {
      Column(){
        // 编写方式和html的嵌套方式十分类似

        // 头像
        Image($rawfile(this.selectedPortraitInfo.portraitPath.length > 0 ? this.selectedPortraitInfo.portraitPath : 'portrait/ic_portraitmaleplus.png'))
          .height(108)
          .width(108)
          .onClick(() => {
            // 读取头像JSON数据，转成对象
            // 通过路由参数的形式，传递给头像相册页面
            router.pushUrl({
              url : "pages/BNPortraitAlbumPage",
              params:{'${BNConstants.PARAM_PORTRAINT_INFO_ARR_KEY}' : BNConstants.PORTRAINT_INFO_ARR}
            });

          })

        // @binbin 如果要求是self.view.width - 12 * 2 这种怎么设置？
        // 设置 width : 100% ，然后设置padding就好了

        // 账号输入框
        TextInput({placeholder:'请输入账号'})
          .width('320')
          .height('50')
          .borderRadius('8')
          .margin({top:'10'})
          .fontSize(27)
          .backgroundColor('#f9f9f9')
          .type(InputType.Normal) // 常见的输入框
          .onChange((value:string) => {
            this.username = value;
          })

        // 密码输入框
        TextInput({placeholder:'请输入密码'})
          .width('320')
          .height('50')
          .borderRadius('8')
          .margin({top:'10'})
          .fontSize(27)
          .backgroundColor('#f9f9f9')
          .type(InputType.Password)
          .onChange((value:string) => {
            this.password = value;
          })


        Button('注册/登录', {type:ButtonType.Normal})
          .width(320)
          .height(50)
          .borderRadius(8)
          .backgroundColor("#ffd0da")
          .margin({top:10})
          .fontSize(24)
          .onClick(() => {
            // 校验账号和密码，以及头像
            if (this.username.length > 0 && this.password.length > 0 && this.selectedPortraitInfo.portraitPath.length > 0) {
              // 校验通过
              // 跳转到Index界面，同时传递用户登录信息

              let userInfo: BNUserInfo
                = new BNUserInfo(this.username, this.password,
                this.selectedPortraitInfo.portraitPath);
              router.replaceUrl({
                url : 'pages/Index',
                // @binbin 鸿蒙的 ' 和 ` 是有区别的，`是引用模板
                /**
                 * 1. 使用方括号 [] 来定义属性名是 ES6 引入的计算属性名特性。这允许你在对象字面量中使用任何表达式作为属性名
                 * let propName = 'name';
                 * let obj = {[propName]: 'OpenAI'};
                 * console.log(obj.name); // 输出 'OpenAI'
                 *
                 * 2. 模板字符串 ${} 包围的表达式。模板字符串是 ES6 引入的，允许字符串中嵌入表达式
                 * let user = 'Alice';
                 * console.log(`Hello, ${user}!`); // 输出 'Hello, Alice!'
                 *
                 */
                // params: { [BNConstants.PARAM_LOGGED_USER_INFO_KEY] : userInfo }
                params: { 'loggedUserInfo' : userInfo }
              })
            }else{
              // 校验不通过
              // 提示
              promptAction.showToast({
                message: '账号\密码\头像 不能为空!',
                duration:2000
              })
            }
          })

      }.width('100%')

    }.height('100%')
  }
}