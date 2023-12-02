import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct PanelPage {
  @State selectTab: number = 0

  //show
  @State show: boolean = false


  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Panel 滑动面板' })
      TitleTab({ selectTab: $selectTab, interface: true, property: false, common: false })
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

            SwitchCustom({ name: 'show', isOn: $show })
              .width(100)

            Panel(this.show) {
              Column() {
                Text('Panel 容器')
                  .fontColor($r('app.color.font_light'))
              }
            }
          }
          Blank()
          Column() {

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