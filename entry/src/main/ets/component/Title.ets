@Component
export default struct Title {
  @Prop pageTitle: string

  build() {
    Row() {
      Text(this.pageTitle)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height(60)
  }
}