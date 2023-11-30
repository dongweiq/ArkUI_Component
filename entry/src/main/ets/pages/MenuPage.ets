import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SliderCustom from '../component/SliderCustom'
import SwitchCustom from '../component/SwitchCustom'

@Entry
@Component
struct MenuPage {
  @State selectTab: number = 1

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Menu 菜单' })
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
            Text('click to show menu')
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
          }


          Blank()
          Column() {
            if (this.selectTab === 1) {

            }
            if (this.selectTab === 2) {
              SliderCustom({ value: $widthValue, name: 'width', min: 200, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 350 })
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