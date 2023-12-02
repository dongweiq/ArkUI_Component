@Component
export default struct SwitchCustom {
  @Prop name: string
  @Link isOn: boolean

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor($r('app.color.font_main'))
        Blank()
        Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          .selectedColor($r('app.color.brand'))
          .switchPointColor($r('app.color.start_window_background'))
          .onChange(() => {
            this.isOn = !this.isOn
          })
      }
      .width('100%')
      .height(50)

    }
    .width('100%')
  }
}