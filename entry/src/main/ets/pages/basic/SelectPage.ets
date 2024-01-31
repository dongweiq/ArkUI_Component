import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct SelectPage {
  @State selectTab: number = 1

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Select 下拉选择' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: true })
    }
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }

  private value: Array<ValueObject> = [
    { value: '选项1' },
    { value: '选项2' },
    { value: '选项3' },
    { value: '选项4' },
  ]

  @State selected: number = -1
  @State selectedValue : string = '下拉菜单'

  //fontColor
  @State fontColor: Color = Color.Grey
  @State fontColorList: Color[] = [
  Color.Grey,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  ]
  @State fontColorValueList: Array<ValueObject> = [
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //selectedOptionBgColor
  @State selectedOptionBgColor: Color = Color.White
  @State selectedOptionBgColorList: Color[] = [
  Color.White,
  Color.Grey,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  ]
  @State selectedOptionBgColorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //optionFontColor
  @State optionFontColor: Color = Color.Grey
  @State optionFontColorList: Color[] = [
  Color.Grey,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  ]
  @State optionFontColorValueList: Array<ValueObject> = [
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //selectedOptionFontColor
  @State selectedOptionFontColor: Color = Color.Grey
  @State selectedOptionFontColorList: Color[] = [
  Color.Grey,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  ]
  @State selectedOptionFontColorValueList: Array<ValueObject> = [
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //optionBgColor
  @State optionBgColor: Color = Color.White
  @State optionBgColorList: Color[] = [
  Color.White,
  Color.Grey,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  ]
  @State optionBgColorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]


  //width
  @State widthValue: number = 120

  //height
  @State heightValue: number = 40

  build() {
    Column() {
      Navigation() {
        Column() {
          Blank()
          Column() {
            Select(this.value)
              .onSelect((index: number,value:string)=>{
                this.selected = index
                this.selectedValue = value
              })
              .value(this.selectedValue)
              .selected(this.selected)
              .width(this.widthValue)
              .height(this.heightValue)
              .fontColor(this.fontColor)
              .selectedOptionBgColor(this.selectedOptionBgColor)
              .optionFontColor(this.optionFontColor)
              .selectedOptionFontColor(this.selectedOptionFontColor)
              .optionBgColor(this.optionBgColor)
          }

          Blank()

          Column() {

            //tab 1
            Column() {
              SelectCustom({
                name: 'fontColor',
                selectItem: $fontColor,
                itemsList: $fontColorList,
                valuesList: $fontColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'selectedOptionBgColor',
                selectItem: $selectedOptionBgColor,
                itemsList: $selectedOptionBgColorList,
                valuesList: $selectedOptionBgColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'optionFontColor',
                selectItem: $optionFontColor,
                itemsList: $optionFontColorList,
                valuesList: $optionFontColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'selectedOptionFontColor',
                selectItem: $selectedOptionFontColor,
                itemsList: $selectedOptionFontColorList,
                valuesList: $selectedOptionFontColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'optionBgColor',
                selectItem: $optionBgColor,
                itemsList: $optionBgColorList,
                valuesList: $optionBgColorValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ name: 'width', value: $widthValue, min: 50, max: 300 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'height', value: $heightValue, min: 20, max: 120 })
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