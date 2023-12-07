import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct MarqueePage {
  @State selectTab: number = 0

  //start
  @State start: boolean = true

  //step
  @State step: number = 6

  //loop

  @State loop: number = -1

  //fromStart
  @State fromStart: boolean = true

  //src
  private src: string = '跑马灯组件，用于滚动展示一段单行文本，仅当文本内容宽度超过跑马灯组件宽度时滚动。'

  //allowScale
  @State allowScale: boolean = false

  //width
  @State widthValue: number = 300

  //height
  private heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Marquee 跑马灯' })
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
            Marquee({
              start: this.start,
              step: this.step,
              loop: this.loop,
              fromStart: this.fromStart,
              src: this.src
            })
              .width(this.widthValue)
              .allowScale(this.allowScale)

          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SwitchCustom({ name: 'start', isOn: $start })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'step', value: $step, min: 0, max: 40 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'loop', value: $loop, min: -1, max: 3 })
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({ name: 'fromStart', isOn: $fromStart })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)


            // tab 1
            Column() {
              SwitchCustom({ name: 'allowScale', isOn: $allowScale })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)


            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
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