import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct TextClockPage {
  @State selectTab: number = 2
  @State accumulateTime: number = 0
  controller: TextClockController = new TextClockController()

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  //fontSize
  @State fontSize: number = 32

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TextClock 系统时间' })
      TitleTab({ selectTab: $selectTab, interface: false, property: false, common: true })
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
            Text(`${this.accumulateTime}`)
              .fontColor($r('app.color.font_light'))
              .margin({ bottom: 15 })
            TextClock({ controller: this.controller })
              .format('hms')
              .fontSize(this.fontSize)
              .onDateChange((value: number) => {
                this.accumulateTime = value
              })
            Button('start')
              .onClick(() => {
                this.controller.start()
              })
              .backgroundColor($r('app.color.brand'))
              .height(32)
              .margin(30)

            Button('stop')
              .onClick(() => {
                this.controller.stop()
              })
              .backgroundColor($r('app.color.brand'))
              .height(32)

          }

          Blank()
          Column() {

            // tab 2
            Column() {
              SliderCustom({ name: 'fontSize', value: $fontSize, min: 14, max: 80 })
            }
            .visibility(this.selectTab === 2 ? Visibility.Visible : Visibility.None)

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