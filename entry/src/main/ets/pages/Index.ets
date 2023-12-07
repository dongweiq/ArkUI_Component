import router from '@ohos.router';
import basicCom from '../bean/basicCom'
import infoCom from '../bean/infoCom'
import inputCom from '../bean/inputCom'
import funcCom from '../bean/funcCom'
import containCom from '../bean/containCom'
import dialogCom from '../bean/dialogCom'
import ListTitle from '../component/title/ListTitle'

@Entry
@Component
struct Index {
  build() {

    Column() {
      Column() {
        Text('ArkUI 组件示例')
          .fontColor($r('app.color.font_main'))
          .fontSize(24)
          .fontWeight(700)
          .margin({ left: 2, bottom: 20, top: 20 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      List({ space: 16 }) {

        //基础组件
        ListItem() {
          ListTitle({ title: '基础组件' })
        }

        ForEach(basicCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

        //信息展示
        ListItem() {
          ListTitle({ title: '信息展示' })
        }

        ForEach(infoCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

        //信息输入
        ListItem() {
          ListTitle({ title: '信息输入' })
        }

        ForEach(inputCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

        //功能控件
        ListItem() {
          ListTitle({ title: '功能控件' })
        }

        ForEach(funcCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

        //容器
        ListItem() {
          ListTitle({ title: '容器' })
        }

        ForEach(containCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

        //弹窗
        ListItem() {
          ListTitle({ title: '弹窗' })
        }

        ForEach(dialogCom, (item: {
          name: string,
          address: string
        }) => {
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({ left: 8 })
                .fontColor($r('app.color.font_normal'))
            }
            .onClick(() => {
              onJumpClick(item.address)
            })
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

      }
      .width('100%')
      .height('94%')

    }
    .padding(20)
    .width('100%')
    .backgroundColor($r('app.color.background_grey'))

  }
}

function onJumpClick(src: string): void {
  router.pushUrl({
    url: src
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  });
}