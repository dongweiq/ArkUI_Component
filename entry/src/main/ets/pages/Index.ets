import router from '@ohos.router';

@Entry
@Component
struct Index {
  build() {

    Column({space:40}) {
      Text('ButtonPage')
        .fontSize(50)
        .onClick(() => {
          onJumpClick('pages/basic/ButtonPage')
        })

      Text('CheckboxPage')
        .fontSize(50)
        .onClick(() => {
          onJumpClick('pages/basic/CheckboxPage')
        })

      Text('TabsPage')
        .fontSize(50)
        .onClick(() => {
          onJumpClick('pages/container/TabsPage')
        })
    }

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