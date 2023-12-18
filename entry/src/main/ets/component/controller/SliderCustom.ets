@Component
export default struct SelectCustom {
  @Prop name: string
  @Link value: number
  @Prop min: number
  @Prop max: number
  private step? : number

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor($r('app.color.font_main'))
        Blank()

        Slider({ value: this.value, min: this.min, max: this.max, step: this.step ? this.step : 1 })
          .blockColor($r('app.color.start_window_background'))
          .selectedColor($r('app.color.brand'))
          .onChange((value: number, _) => {
            this.value = value
          })
          .width('55%')

        Text(`${Math.floor(this.value)}`)
          .textAlign(TextAlign.End)
          .width(32)
          .fontColor($r('app.color.font_light'))
          .fontSize(14)
      }
      .width('100%')
      .height(50)

    }
    .width('100%')
  }
}