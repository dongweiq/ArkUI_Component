import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct TimePickerPage {
  @State selectTab: number = 1
  @State useMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2023-12-01T08:00:00')
  @State info: string = '选择时间'


  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TimePicker 时间选择' })
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
            TimePicker({
              selected: this.selectedTime,
            })
              .useMilitaryTime(this.useMilitaryTime)
              .onChange((value: TimePickerResult) => {
                this.selectedTime.setHours(value.hour, value.minute)
                this.info = JSON.stringify(value)
              })
              .width(this.widthValue)
              .height(this.heightValue)

            Text(this.info)
              .fontColor($r('app.color.font_light'))
              .margin({ top: 20 })

          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SwitchCustom({ name: 'useMilitaryTime', isOn: $useMilitaryTime })

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 200, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 350 })
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