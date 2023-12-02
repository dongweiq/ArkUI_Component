import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct TextTimerPage {
  @State selectTab: number = 0
  textTimerController: TextTimerController = new TextTimerController()
  @State format: string = 'mm:ss.SS'

  //isCountDown
  @State isCountDown: boolean = false

  //count
  @State count: number = 6000

  //width
  @State fontSize: number = 50


  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TextTimer 计时器' })
      TitleTab({ selectTab: $selectTab, interface: true, property: false, common: true })
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
            TextTimer({ isCountDown: this.isCountDown, count: this.count, controller: this.textTimerController })
              .format(this.format)
              .fontColor($r('app.color.font_main'))
              .fontSize(this.fontSize)
              .onTimer((utc: number, elapsedTime: number) => {
                console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
              })
            Row({space:10}) {
              Button("start")
                .backgroundColor($r('app.color.brand'))
                .onClick(() => {
                this.textTimerController.start()
              })
              Button("pause")
                .backgroundColor($r('app.color.brand'))
                .onClick(() => {
                this.textTimerController.pause()
              })
              Button("reset")
                .backgroundColor($r('app.color.brand'))
                .onClick(() => {
                this.textTimerController.reset()
              })
            }
            .margin({top:15})
          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SwitchCustom({name:'isCountDown',isOn:$isCountDown})
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({name:'count',value:$count,min:3000,max:9000})

            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)


            // tab 2
            Column() {
              SliderCustom({ value: $fontSize, name: 'fontSize', min: 20, max: 80 })
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