import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'

@Entry
@Component
struct MenuPage {
  @State selectTab: number = 1
  private editIcon: Resource = $r('app.media.ic_gallery_photoedit_more')

  //fontSize
  @State fontSize: number = 16

  //width
  @State widthValue: number = 150

  //height
  @State heightValue: number = 150

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Menu 菜单' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: true })
    }
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.editIcon, content: '菜单名称1' })
      MenuItem({ startIcon: this.editIcon, content: '菜单名称2' })
      MenuItem({ startIcon: this.editIcon, content: '菜单名称3' })
    }
    .width(this.widthValue)
    .height(this.heightValue)

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
              .bindMenu(this.MyMenu())
          }


          Blank()
          Column() {

            //tab 1
            Column() {
              SliderCustom({ value: $fontSize, name: 'fontSize', min: 10, max: 40 })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)


            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 10, max: 200 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 200 })
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