import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct DividerPage {
  @State selectTab: number = 1

  //vertical
  @State vertical: boolean = false

  //color
  @State selectColor: Color = Color.Black
  @State colorList: Color[] = [Color.Black, Color.Blue, Color.Brown, Color.Green, Color.Orange, Color.Grey]
  @State colorValueList: Array<ValueObject> = [
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //strokeWidth
  @State strokeWidth: number = 1

  //lineCap
  @State selectLineCap: LineCapStyle = LineCapStyle.Butt
  @State lineCapList: LineCapStyle[] = [LineCapStyle.Butt, LineCapStyle.Round, LineCapStyle.Square]
  @State lineCapValueList: Array<ValueObject> = [{ value: 'Butt' }, { value: 'Round' }, { value: 'Square' }]

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Divider 分隔器' })
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
            Divider()
              .width(this.widthValue)
              .height(this.heightValue)
              .vertical(this.vertical)
              .color(this.selectColor)
              .strokeWidth(this.strokeWidth)
              .lineCap(this.selectLineCap)
          }

          Blank()

          Column() {

            // tab 1
            Column() {
              SwitchCustom({ name: 'vertical', isOn: $vertical })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'color',
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor
              })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'strokeWidth', value: $strokeWidth, min: 1, max: 10 })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'lineCap',
                valuesList: $lineCapValueList,
                itemsList: $lineCapList,
                selectItem: $selectLineCap
              })

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
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