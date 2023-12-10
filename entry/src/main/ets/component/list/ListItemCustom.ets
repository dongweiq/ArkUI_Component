import router from '@ohos.router'

@Component
export default struct ListItemCustom {
  @Prop name: string
  @Prop address: string

  build() {
    Column() {
      Text(this.name)
        .fontSize(16)
        .margin({ left: 8 })
        .fontColor($r('app.color.font_normal'))
    }
    .onClick(() => {
      onJumpClick(this.address)
    })
    .alignItems(HorizontalAlign.Start)
    .padding(8)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(8)
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