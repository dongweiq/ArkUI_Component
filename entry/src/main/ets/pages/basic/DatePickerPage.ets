import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SwitchCustom from '../../component/controller/SwitchCustom'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct DatePickerPage {
  @State selectTab: number = 1
  @State date: string = '选择日期'

  //lunar
  @State lunar: boolean = false

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'DatePicker 日期选择' })
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
            DatePicker()
              .lunar(this.lunar)
              .onChange((value: DatePickerResult) => {
                this.changeHandle(value)
              })
              .width(this.widthValue)
              .height(this.heightValue)
            Text(this.date)
              .margin({ top: 24 })
              .fontColor($r('app.color.font_normal'))
          }

          Blank()

          Column() {
            // tab 1
            Column() {
              SwitchCustom({ name: 'lunar', isOn: $lunar })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 100, max: 350 })
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

  changeHandle(value: DatePickerResult) {
    this.date = `${value.year}年${value.month + 1}月${value.day}日`
  }
}

