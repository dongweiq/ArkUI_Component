import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct TextPage {
  @State selectTab: number = 1

  //textAlign
  @State textAlign : TextAlign = TextAlign.Center
  @State textAlignList : TextAlign[] = [
  TextAlign.Center,
  TextAlign.Start,
  TextAlign.End
  ]
  @State textAlignValueList : Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' }
  ]

  //maxLines
  @State maxLines : number = 1

  //textOverflow
  @State textOverflow :TextOverflow = TextOverflow.None
  @State textOverflowList :TextOverflow[] = [
  TextOverflow.None,
  TextOverflow.Clip,
  TextOverflow.Ellipsis,
  ]
  @State textOverflowValueList: Array<ValueObject> = [
    { value: 'None' },
    { value: 'Clip' },
    { value: 'Ellipsis' }
  ]


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

  //baselineOffset
  @State baselineOffset : number = 0

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

  //width
  @State widthValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Text 文本' })
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
            Text('This is text demonstration')
              .textAlign(this.textAlign)
              .textOverflow({overflow:this.textOverflow})
              .decoration({type:this.type,color:this.color})
              .baselineOffset(this.baselineOffset)
              .letterSpacing(this.letterSpacing)
              .textCase(this.textCase)
              .fontSize(this.fontSize)
              .width(this.widthValue)
              .maxLines(this.maxLines)
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'textAlign',
                selectItem: $textAlign,
                itemsList: $textAlignList,
                valuesList: $textAlignValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'textOverflow',
                selectItem: $textOverflow,
                itemsList: $textOverflowList,
                valuesList: $textOverflowValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'maxLines',value:$maxLines,min:1,max:3})
              Divider().color($r('app.color.line_grey'))
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
              SliderCustom({name:'baselineOffset',value:$baselineOffset,min:-20,max:20})
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
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $widthValue, name: 'width', min: 200, max: 350 })
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