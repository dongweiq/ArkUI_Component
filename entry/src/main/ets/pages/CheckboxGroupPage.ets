import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SelectCustom from '../component/SelectCustom'
import SliderCustom from '../component/SliderCustom'

@Entry
@Component
struct CheckboxPage {
  @State selectTab: number = 1
  //color
  @State selectColor: Color = Color.Blue
  @State colorList: Color[] = [Color.Black, Color.Blue, Color.Brown, Color.Green, Color.Orange, Color.Grey]
  @State colorValueList: { value: string }[] = [
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //width
  @State widthValue: number = 24

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'CheckBox 多选框' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: true })
    }
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          Column()
            .height(200)
          Column() {
            Row() {
              CheckboxGroup({ group: 'checkboxGroup' })
                .selectedColor(this.selectColor)
                .width(this.widthValue)
              Text('全选')
                .fontColor($r('app.color.font_normal'))
            }
            .margin({ bottom: 12 })

            Row() {
              Checkbox({ name: '123', group: 'checkboxGroup' })
                .selectedColor(this.selectColor)
                .width(this.widthValue)
              Text('选项1')
                .fontColor($r('app.color.font_normal'))
            }

            Row() {
              Checkbox({ name: '123', group: 'checkboxGroup' })
                .selectedColor(this.selectColor)
                .width(this.widthValue)
              Text('选项2')
                .fontColor($r('app.color.font_normal'))
            }

            Row() {
              Checkbox({ name: '123', group: 'checkboxGroup' })
                .selectedColor(this.selectColor)
                .width(this.widthValue)
              Text('选项3')
                .fontColor($r('app.color.font_normal'))
            }
          }
          .alignItems(HorizontalAlign.Start)

          Blank()

          Column() {
            if (this.selectTab === 1) {
              SelectCustom({
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor,
                name: 'color'
              })
            }
            if (this.selectTab === 2) {
              SliderCustom({ name: 'width', value: $widthValue, min: 12, max: 48 })
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