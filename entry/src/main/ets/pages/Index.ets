import router from '@ohos.router';
import pageIndex from '../bean/pageIndex'

@Entry
@Component
struct Index {
  build() {

    Column() {
      List({ space: 20 }) {
        ForEach(pageIndex,(item:{  name: string,
        address: string})=>{
          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(16)
                .margin({left:8})
                .fontColor($r('app.color.font_normal'))
                .onClick(() => {
                  onJumpClick(item.address)
                })
            }
            .alignItems(HorizontalAlign.Start)
            .padding(8)
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        })

      }
      .width('100%')
      .height('100%')

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