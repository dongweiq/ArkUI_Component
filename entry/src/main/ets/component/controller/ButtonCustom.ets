@Component
export default struct ButtonCustom {
  @Prop name: string

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor($r('app.color.font_main'))
        Blank()
        Button(this.name)
          .backgroundColor($r('app.color.brand'))
      }
      .width('100%')
      .height(50)
    }
    .width('100%')
  }
}