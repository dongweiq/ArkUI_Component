import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SelectCustom from '../component/SelectCustom'
import SliderCustom from '../component/SliderCustom'

@Entry
@Component
struct LoadingProgressPage {
  @State selectTab: number = 1
  //color
  @State selectColor: Color = Color.Black
  @State colorList: Color[] = [Color.Black, Color.Blue, Color.Brown, Color.Green, Color.Orange, Color.Grey]
  @State colorValueList: { value: string }[] = [
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //width
  @State widthValue: number = 48

  //height
  @State heightValue: number = 48

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'LoadingProgress 加载动效' })
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
            LoadingProgress()
              .width(this.widthValue)
              .height(this.heightValue)
              .color(this.selectColor)
          }

          Blank()

          Column() {
            if (this.selectTab === 1) {
              SelectCustom({
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor,
                name: 'color'
              })
            }
            if (this.selectTab === 2) {
              SliderCustom({ value: $widthValue, name: 'width', min: 24, max: 100 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 24, max: 100 })
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