import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct TimePickerDialogPage {
  @State selectTab: number = 1

  @State useMilitaryTime: boolean = false
  selectedDate: Date = new Date('2023-12-01T08:30:00')
  @State value: string = ''

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TimePickerDialog 时间选择弹窗' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: false })
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

            Text(this.value)
              .fontColor($r('app.color.font_normal'))
              .margin({ bottom: 30 })

            Text('TimePickerDialog')
              .fontSize(16)
              .height(40)
              .padding(8)
              .backgroundColor($r('app.color.start_window_background'))
              .borderRadius(8)
              .margin({ bottom: 30 })
              .onClick(() => {
                TimePickerDialog.show({
                  selected: this.selectedDate,
                  useMilitaryTime: this.useMilitaryTime,
                  onAccept: (value: TimePickerResult) => {
                    this.value = `已选择 ${value.hour} 时 ${value.minute} 分`
                  }
                })
              })
          }

          Blank()

          Column() {
            SwitchCustom({ name: 'useMilitaryTime', isOn: $useMilitaryTime })
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