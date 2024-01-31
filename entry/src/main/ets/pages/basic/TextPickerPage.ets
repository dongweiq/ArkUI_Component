import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct TextPickerPage {
  @State selectTab: number = 1
  private select: number = 1
  private fruits: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5', '选项6']
  @State text: string = ''
  //defaultPickerItemHeight
  @State defaultPickerItemHeight: number = 40
  //width
  @State widthValue: number = 300
  //height
  @State heightValue: number = 300

  @Builder
  pageTitle() {
    Column() {
      Title({ pageTitle: 'TextPicker 滑动选择' })
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
            Text(this.text)
              .fontColor($r('app.color.font_light'))
              .margin({ bottom: 20 })
            TextPicker({ range: this.fruits, selected: this.select })
              .onChange((value, index) => {
                this.text = `index : ${index} - value : ${value}`
              })
              .defaultPickerItemHeight(this.defaultPickerItemHeight)
          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SliderCustom({ name: 'itemHeight', value: $defaultPickerItemHeight, min: 20, max: 80 })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

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