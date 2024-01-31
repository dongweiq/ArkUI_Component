import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct SearchPage {
  @State selectTab: number = 1
  //color
  @State selectColor: Color = Color.Grey
  @State colorList: Color[] = [Color.Grey, Color.Black, Color.Blue, Color.Brown, Color.Green, Color.Orange]
  @State colorValueList: Array<ValueObject> = [
    { value: 'Grey' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //copyOption
  @State copyOption: CopyOptions = CopyOptions.None
  @State copyOptionList: CopyOptions[] = [
  CopyOptions.None,
  CopyOptions.InApp,
  CopyOptions.LocalDevice
  ]
  @State copyOptionValueList: Array<ValueObject> = [
    { value: 'None' },
    { value: 'InApp' },
    { value: 'LocalDevice' }
  ]
  @State changeValue: string = ''
  @State submitValue: string = ''
  controller: SearchController = new SearchController()

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 40

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Search 搜索框' })
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
            Text('onSubmit:' + this.submitValue).fontSize(16).margin(6).fontColor($r('app.color.font_normal'))
            Text('onChange:' + this.changeValue).fontSize(16).margin(12).fontColor($r('app.color.font_normal'))
            Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
              .searchButton('SEARCH')
              .copyOption(this.copyOption)
              .width(this.widthValue)
              .height(this.heightValue)
              .backgroundColor('#F5F5F5')
              .placeholderColor(this.selectColor)
              .placeholderFont({ size: 14, weight: 400 })
              .textFont({ size: 14, weight: 400 })
              .onSubmit((value: string) => {
                this.submitValue = value
              })
              .onChange((value: string) => {
                this.changeValue = value
              })
              .margin(20)
            Button('Set caretPosition 1')
              .onClick(() => {
                // 设置光标位置到输入的第一个字符后
                this.controller.caretPosition(1)
              })
          }

          Blank()

          Column() {

            //tab 1
            Column() {
              SelectCustom({
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor,
                name: 'placeholderColor'
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'copyOption',
                selectItem: $copyOption,
                itemsList: $copyOptionList,
                valuesList: $copyOptionValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ name: 'width', value: $widthValue, min: 100, max: 300 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 60 })
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