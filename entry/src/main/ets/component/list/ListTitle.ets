@Component
export default struct ListTitle{

  @Prop title : string

  build(){
    Row(){
      Rect()
        .width(4)
        .height(16)
        .radius(2)
        .fill($r('app.color.brand'))
        .margin({right:8})
      Text(this.title)
        .fontColor($r('app.color.font_normal'))
        .fontSize(16)
        .fontWeight(500)
    }
    .margin({top:8})
    .alignItems(VerticalAlign.Center)
  }
}