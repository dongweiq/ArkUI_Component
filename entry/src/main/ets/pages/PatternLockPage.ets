import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SliderCustom from '../component/SliderCustom'
import SelectCustom from '../component/SelectCustom'

@Entry
@Component
struct PatternLockPage {
  @State selectTab: number = 1

  //backgroundColor
  @State selectBackgroundColor: Color = Color.White
  @State backgroundColorList: Color[] = [
  Color.White,
  Color.Gray,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State backgroundValueColorList: { value: string }[] = [
    { value: 'White' },
    { value: 'Gray' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //sideLength
  @State sideLength: number = 270

  //circleRadius
  @State circleRadius: number = 14

  //regularColor
  @State selectRegularColor: Color = Color.Black
  @State regularColorList: Color[] = [
  Color.Black,
  Color.Gray,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State regularColorValueList: { value: string }[] = [
    { value: 'Black' },
    { value: 'Gray' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //selectedColor
  @State selectSelectedColor: Color = Color.Black
  @State selectedColorList: Color[] = [
  Color.Black,
  Color.Gray,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State selectedColorValueList: { value: string }[] = [
    { value: 'Black' },
    { value: 'Gray' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //activeColor
  @State selectActiveColor: Color = Color.Black
  @State activeColorList: Color[] = [
  Color.Black,
  Color.Gray,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State activeColorValueList: { value: string }[] = [
    { value: 'Black' },
    { value: 'Gray' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //pathColor
  @State selectPathColor: Color = Color.Gray
  @State pathColorList: Color[] = [
  Color.Gray,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State pathColorValueList: { value: string }[] = [
    { value: 'Gray' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //pathStrokeWidth
  @State pathStrokeWidth: number = 34

  //autoReset
  @State autoReset: boolean = true

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'PatternLock 密码锁' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: true })
    }
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          Blank()
          Column() {
            PatternLock()
              .backgroundColor(this.selectBackgroundColor)
              .sideLength(this.sideLength)
              .circleRadius(this.circleRadius)
              .regularColor(this.selectRegularColor)
              .selectedColor(this.selectSelectedColor)
              .activeColor(this.selectActiveColor)
              .pathColor(this.selectPathColor)
              .pathStrokeWidth(this.pathStrokeWidth)
              .autoReset(this.autoReset)

          }


          Blank()
          Column() {
            if (this.selectTab === 1) {
              SliderCustom({ name: 'sideLength', value: $sideLength, min: 100, max: 270 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'circleRadius', value: $circleRadius, min: 5, max: 15 })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'regularColor',
                selectItem: $selectRegularColor,
                itemsList: $selectedColorList,
                valuesList: $selectedColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'selectedColor',
                selectItem: $selectSelectedColor,
                itemsList: $selectedColorList,
                valuesList: $selectedColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'activeColor',
                selectItem: $selectActiveColor,
                itemsList: $activeColorList,
                valuesList: $activeColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'pathColor',
                selectItem: $selectPathColor,
                itemsList: $pathColorList,
                valuesList: $pathColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'pathStroke', value: $pathStrokeWidth, min: 2, max: 15 })

            }
            if (this.selectTab === 2) {
              SelectCustom({
                name: 'backgroundColor',
                valuesList: $backgroundValueColorList,
                itemsList: $backgroundColorList,
                selectItem: $selectBackgroundColor
              })
            }
          }
          .padding({ left: 12, right: 12 })
          .backgroundColor($r('app.color.start_window_background'))
          .margin({ left: 20, right: 20, top: 16, bottom: 16 })
          .borderRadius(16)

        }
        .height('100%')
        .width('100%')

      }
      .height('100%')
      .width('100%')
      .title(this.pageTitle())
      .hideBackButton(false)

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_grey'))
  }
}