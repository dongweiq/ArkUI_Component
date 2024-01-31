import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct SpanPage {
  @State selectTab: number = 1

  //type
  @State type: TextDecorationType = TextDecorationType.Underline
  @State typeList: TextDecorationType[] = [
  TextDecorationType.Underline,
  TextDecorationType.Overline,
  TextDecorationType.LineThrough,
  TextDecorationType.None
  ]
  @State typeValueList: Array<ValueObject> = [
    { value: 'Underline' },
    { value: 'Overline' },
    { value: 'LineThrough' },
    { value: 'None' }
  ]

  //color
  @State color: Color = Color.Blue
  @State colorList: Color[] = [
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State colorValueList: Array<ValueObject> = [
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //letterSpacing
  @State letterSpacing: number = 5

  //textCase
  @State textCase: TextCase = TextCase.Normal
  @State textCaseList: TextCase[] = [
  TextCase.Normal,
  TextCase.LowerCase,
  TextCase.UpperCase,
  ]
  @State textCaseValueList: Array<ValueObject> = [
    { value: 'Normal' },
    { value: 'LowerCase' },
    { value: 'UpperCase' }
  ]

  //fontSize
  @State fontSize: number = 20

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Span 行内文本' })
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
            Text() {
              Span('I am Span')
                .decoration({
                  type: this.type,
                  color: this.color
                })
                .letterSpacing(this.letterSpacing)
                .textCase(this.textCase)
                .fontSize(this.fontSize)
            }
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'decoration-type',
                selectItem: $type,
                itemsList: $typeList,
                valuesList: $typeValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'decoration-color',
                selectItem: $color,
                itemsList: $colorList,
                valuesList: $colorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'letterSpacing', value: $letterSpacing, min: -10, max: 20 })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'textCase',
                selectItem: $textCase,
                itemsList: $textCaseList,
                valuesList: $textCaseValueList
              })

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ name: 'fontSize', value: $fontSize, min: 10, max: 40 })
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