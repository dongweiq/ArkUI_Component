@Component
export default struct SelectCustom {
  @Prop name: string
  @Link valuesList: { value: string }[]
  @Link itemsList: any[]
  @Link selectItem: any

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor($r('app.color.font_main'))
        Blank()
        Select(this.valuesList)
          .fontColor($r('app.color.font_normal'))
          .value(this.valuesList[0].value)
          .onSelect((index: number, _) => {
            this.selectItem = this.itemsList[index]
          })
      }
      .width('100%')
      .height(50)
    }
    .width('100%')
  }
}