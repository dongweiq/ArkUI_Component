import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct TextInputPage {
  @State selectTab: number = 1
  @State text: string = ''
  controller: TextAreaController = new TextAreaController()

  //type
  @State type: InputType = InputType.Normal
  @State typeList: InputType[] = [
  InputType.Normal,
  InputType.Number,
  InputType.PhoneNumber,
  InputType.Email,
  InputType.Password
  ]
  @State typeValueList: Array<ValueObject> = [
    { value: 'Normal' },
    { value: 'Number' },
    { value: 'PhoneNumber' },
    { value: 'Email' },
    { value: 'Password' }
  ]

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

  //enterKeyType
  @State enterKeyType: EnterKeyType = EnterKeyType.Go
  @State enterKeyTypeList: EnterKeyType[] = [
  EnterKeyType.Go,
  EnterKeyType.Search,
  EnterKeyType.Send,
  EnterKeyType.Next,
  EnterKeyType.Done
  ]
  @State enterKeyTypeValueList: Array<ValueObject> = [
    { value: 'Go' },
    { value: 'Search' },
    { value: 'Send' },
    { value: 'Next' },
    { value: 'Done' }
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

  //maxLength
  @State maxLength: number = 11

  //showPasswordIcon
  @State showPasswordIcon: boolean = true

  //style
  @State style: TextInputStyle = TextInputStyle.Default
  @State styleList: TextInputStyle[] = [
  TextInputStyle.Default,
  TextInputStyle.Inline
  ]
  @State styleValueList: Array<ValueObject> = [
    { value: 'Default' },
    { value: 'Inline' }
  ]

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


  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  //fontSize
  @State fontSize: number = 16

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'TextInput 单行文本' })
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
            TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
              .type(this.type)
              .placeholderColor(this.placeholderColor)
              .placeholderFont({ size: this.placeholderFont })
              .enterKeyType(this.enterKeyType)
              .caretColor(this.caretColor)
              .maxLength(this.maxLength)
              .showPasswordIcon(this.showPasswordIcon)
              .style(this.style)
              .textAlign(this.textAlign)
              .width(this.widthValue)
              .onChange((value: string) => {
                this.text = value
              })
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'type',
                selectItem: $type,
                itemsList: $typeList,
                valuesList: $typeValueList
              })
              Divider().color($r('app.color.line_grey'))
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
                name: 'enterKeyType',
                selectItem: $enterKeyType,
                itemsList: $enterKeyTypeList,
                valuesList: $enterKeyTypeValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'caretColor',
                selectItem: $caretColor,
                itemsList: $caretColorList,
                valuesList: $caretColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'maxLength', value: $maxLength, min: 4, max: 20 })
              Divider().color($r('app.color.line_grey'))
              SwitchCustom({name:'showPasswordIcon',isOn:$showPasswordIcon})
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name:'style',
                selectItem:$style,
                itemsList:$styleList,
                valuesList:$styleValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'textAlign',
                selectItem: $textAlign,
                itemsList: $textAlignList,
                valuesList: $textAlignValueList
              })

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
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