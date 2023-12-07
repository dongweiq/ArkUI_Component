@Component
export default struct TitleTab {
  @Link selectTab: number
  @Prop interface: boolean
  @Prop property: boolean
  @Prop common: boolean

  build() {
    Row({ space: 32 }) {
      if (this.interface) {
        if (this.selectTab === 0) {
          Text('接口')
            .fontColor($r('app.color.brand'))
            .textAlign(TextAlign.Center)
            .width(60)
        } else {
          Text('接口')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              this.selectTab = 0
            })
        }
      }

      if (this.property) {
        if (this.selectTab === 1) {
          Text('属性')
            .fontColor($r('app.color.brand'))
            .textAlign(TextAlign.Center)
            .width(60)
        } else {
          Text('属性')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              this.selectTab = 1
            })
        }
      }

      if (this.common) {
        if (this.selectTab === 2) {
          Text('通用')
            .fontColor($r('app.color.brand'))
            .textAlign(TextAlign.Center)
            .width(60)
        } else {
          Text('通用')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              this.selectTab = 2
            })
        }
      }
    }
    .height(40)
  }
}