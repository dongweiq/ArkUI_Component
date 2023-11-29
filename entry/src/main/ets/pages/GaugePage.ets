import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SliderCustom from '../component/SliderCustom'

@Entry
@Component
struct GaugePage {
  @State selectTab: number = 0

  //interface
  @State value : number = 50
  @State min : number = 0
  @State max : number = 100

  //prop
  @State propValue : number = 75
  @State startAngle : number = 0
  @State endAngle : number = 360

  //strokeWidth
  @State strokeWidth : number = 4

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Gauge 量规图表' })
      TitleTab({ selectTab: $selectTab, interface: true, property: true, common: true })
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
            Gauge({ value: this.value, min: this.min, max: this.max })
              .value(this.propValue)
              .startAngle(this.startAngle)
              .endAngle(this.endAngle)
              .colors([[Color.Black, 20], [Color.Blue, 20], [Color.Red, 20], [Color.Green, 20]])
              .strokeWidth(this.strokeWidth)
              .width(this.widthValue)
              .height(this.heightValue)
          }


          Blank()
          Column() {
            if (this.selectTab === 0) {
              SliderCustom({ value: $value, name: 'value', min: 0, max: 100 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $min, name: 'min', min: 0, max: 100 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $max, name: 'max', min: 0, max: 100 })
            }
            if (this.selectTab === 1) {
              SliderCustom({ value: $propValue, name: 'value', min: 0, max: 100 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $startAngle, name: 'startAngle', min: 0, max: 360 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $endAngle, name: 'endAngle', min: 0, max: 360 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $strokeWidth, name: 'strokeWidth', min: 1, max:30 })
            }
            if (this.selectTab === 2) {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 100, max: 350 })
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