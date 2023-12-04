import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct TextPickerDialogPage {
  @State selectTab: number = 1
  private range: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5']
  @State value: string = ''
  @State defaultPickerItemHeight: number = 40

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TextPickerDialog 文本选择弹窗' })
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

            Text('TextPickerDialog')
              .fontSize(16)
              .height(40)
              .padding(8)
              .backgroundColor($r('app.color.start_window_background'))
              .borderRadius(8)
              .margin({ bottom: 30 })
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.range,
                  defaultPickerItemHeight: this.defaultPickerItemHeight,
                  onAccept: (value: TextPickerResult) => {
                    this.value = `value:${value.value} index:${value.index}`
                  }
                })
              })
          }

          Blank()

          Column() {
            SliderCustom({ name: 'ItemHeight', value: $defaultPickerItemHeight, min: 10, max: 100 })
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