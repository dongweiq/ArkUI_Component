import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct BadgePage {
  @State selectTab: number = 0
  private count: number = 1
  private value: string = '标记文本'
  @State badgePosition: BadgePosition = BadgePosition.RightTop
  @State badgePositionList: BadgePosition[] = [
  BadgePosition.RightTop,
  BadgePosition.Right,
  BadgePosition.Left
  ]
  @State badgePositionValueList: Array<ValueObject> = [
    { value: 'RightTop' },
    { value: 'Right' },
    { value: 'Left' }
  ]

  //color
  @State color: Color = Color.White
  @State colorList: Color[] = [
  Color.White,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State colorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //fontSize
  @State fontSize: number = 10

  //badgeSize
  @State badgeSize: number = 16

  //badgeColor
  @State badgeColor: Color = Color.Red
  @State badgeColorList: Color[] = [
  Color.Red,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State badgeColorValueList: Array<ValueObject> = [
    { value: 'Red' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //width
  @State widthValue: number = 115

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Badge 信息标记' })
      TitleTab({ selectTab: $selectTab, interface: true, property: false, common: true })
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
            Badge({ count: this.count, position: this.badgePosition, style: {
              color: this.color,
              fontSize: this.fontSize,
              badgeSize: this.badgeSize,
              badgeColor: this.badgeColor
            } }) {
              Column() {
                Text('容器内文本')
                  .fontColor($r('app.color.font_normal'))
              }
              .backgroundColor($r('app.color.start_window_background'))
              .padding({ top: 8, bottom: 8, right: 16, left: 16 })
              .borderRadius(4)
            }
            .width(this.widthValue)
            .margin({ bottom: 20 })

            Badge({ value: this.value, position: this.badgePosition, style: {
              color: this.color,
              fontSize: this.fontSize,
              badgeSize: this.badgeSize,
              badgeColor: this.badgeColor
            } }) {
              Column() {
                Text('容器内文本')
              }
              .backgroundColor($r('app.color.start_window_background'))
              .padding({ top: 8, bottom: 8, right: 16, left: 16 })
              .borderRadius(4)
            }
            .width(this.widthValue)

          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SelectCustom({
                name: 'position',
                selectItem: $badgePosition,
                itemsList: $badgePositionList,
                valuesList: $badgePositionValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'color',
                selectItem: $color,
                itemsList: $colorList,
                valuesList: $colorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'fontSize', value: $fontSize, min: 6, max: 32 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'badgeSize', value: $badgeSize, min: 8, max: 32 })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'badgeColor',
                selectItem: $badgeColor,
                itemsList: $badgeColorList,
                valuesList: $badgeColorValueList
              })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 20, max: 300 })
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