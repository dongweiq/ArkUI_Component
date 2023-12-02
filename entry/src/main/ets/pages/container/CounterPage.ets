import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct CounterPage {
  @State selectTab: number = 2
  @State value: number = 0

  //width
  @State widthValue: number = 120

  //height
  @State heightValue: number = 40

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Counter 计数器' })
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
            Counter() {
              Text(this.value.toString())
                .fontColor($r('app.color.font_normal'))
            }
            .onInc(() => {
              this.value++
            })
            .onDec(() => {
              this.value--
            })
            .width(this.widthValue)
            .height(this.heightValue)
          }

          Blank()
          Column() {

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 50, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 300 })
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