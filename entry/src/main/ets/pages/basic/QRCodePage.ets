import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct QRCodePage {
  @State selectTab: number = 1

  //value
  @State value : string = '二维码原始数据字符串'

  //color
  @State selectColor: Color = Color.Black
  @State colorList: Color[] = [
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State colorValueList: Array<ValueObject> = [
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //backgroundColor
  @State selectBackgroundColor: Color = Color.White
  @State backgroundColorList: Color[] = [
  Color.White,
  Color.Gray,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State backgroundColorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Gray' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'QRCode 二维码' })
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
            QRCode(this.value)
              .width(this.widthValue)
              .height(this.heightValue)
              .color(this.selectColor)
              .backgroundColor(this.selectBackgroundColor)
          }

          Blank()

          Column() {

            //tab 1
            Column() {
              SelectCustom({
                name: 'color',
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name:'backgroundColor',
                valuesList:$backgroundColorValueList,
                itemsList:$backgroundColorList,
                selectItem:$selectBackgroundColor
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider().color($r('app.color.line_grey'))
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
}