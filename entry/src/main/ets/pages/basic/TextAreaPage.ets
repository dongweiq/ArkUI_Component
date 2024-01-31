import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct TextAreaPage {
  @State selectTab: number = 1
  @State text: string = ''
  controller: TextAreaController = new TextAreaController()

  //placeholderColor
  @State placeholderColor: Color = Color.Grey
  @State placeholderColorList: Color[] = [
  Color.Grey,
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State placeholderColorValueList: Array<ValueObject> = [
    { value: 'Grey' },
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //placeholderFont
  @State placeholderFont: number = 16

  //textAlign
  @State textAlign: TextAlign = TextAlign.Center
  @State textAlignList: TextAlign[] = [
  TextAlign.Center,
  TextAlign.Start,
  TextAlign.End
  ]
  @State textAlignValueList: Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' }
  ]

  //caretColor
  @State caretColor: Color = Color.Blue
  @State caretColorList: Color[] = [
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State caretColorValueList: Array<ValueObject> = [
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  //fontSize
  @State fontSize: number = 16

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TextArea 多行文本' })
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
            TextArea({
              placeholder: 'The text area can hold an unlimited amount of text. input your word...',
              controller: this.controller
            })
              .placeholderFont({ size: this.placeholderFont, weight: 400 })
              .placeholderColor(this.placeholderColor)
              .textAlign(this.textAlign)
              .caretColor(this.caretColor)
              .width(this.widthValue)
              .height(this.heightValue)
              .fontSize(this.fontSize)
              .fontColor($r('app.color.font_normal'))
              .backgroundColor($r('app.color.start_window_background'))
              .onChange((value: string) => {
                this.text = value
              })
            Text(this.text)
              .margin({ top: 15 })
              .fontColor($r('app.color.font_normal'))
            Button('Set caretPosition 1')
              .backgroundColor($r('app.color.brand'))
              .margin(15)
              .onClick(() => {
                // 设置光标位置到第一个字符后
                this.controller.caretPosition(1)
              })
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'placeholderColor',
                selectItem: $placeholderColor,
                itemsList: $placeholderColorList,
                valuesList: $placeholderColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'Font', value: $placeholderFont, min: 10, max: 40 })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'textAlign',
                selectItem: $textAlign,
                itemsList: $textAlignList,
                valuesList: $textAlignValueList
              })
              SelectCustom({
                name: 'caretColor',
                selectItem: $caretColor,
                itemsList: $caretColorList,
                valuesList: $caretColorValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 300 })
              Divider().color($r('app.color.line_grey'))
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