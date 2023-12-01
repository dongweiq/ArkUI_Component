import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SliderCustom from '../component/SliderCustom'
import SelectCustom from '../component/SelectCustom'
import SwitchCustom from '../component/SwitchCustom'

@Entry
@Component
struct TogglePage {
  @State selectTab: number = 0

  @State isOn : boolean = true

  //type
  @State type: ToggleType = ToggleType.Switch
  @State typeList: ToggleType[] = [
  ToggleType.Switch,
  ToggleType.Checkbox,
  ToggleType.Button
  ]
  @State typeValueList: { value: string }[] = [
    { value: 'Switch' },
    { value: 'Checkbox' },
    { value: 'Button' },
  ]

  //selectedColor
  @State selectedColor: Color = Color.Grey
  @State selectedColorList: Color[] = [
  Color.Grey,
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State selectedColorValueList: { value: string }[] = [
    { value: 'Grey' },
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //switchPointColor
  @State switchPointColor: Color = Color.White
  @State switchPointColorList: Color[] = [
  Color.White,
  Color.Grey,
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State switchPointColorValueList: { value: string }[] = [
    { value: 'White' },
    { value: 'Grey' },
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]


  //width
  @State widthValue: number = 72

  //height
  @State heightValue: number = 30

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'aaa bbb' })
      TitleTab({ selectTab: $selectTab, interface: true, property: true, common: true })
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
            Toggle({type:this.type,isOn:this.isOn})
              .selectedColor(this.selectedColor)
              .switchPointColor(this.switchPointColor)
              .width(this.widthValue)
              .height(this.heightValue)
              .onChange((isOn:boolean)=>{
                this.isOn = isOn
              })
          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SelectCustom({
                name:'type',
                selectItem:$type,
                itemsList:$typeList,
                valuesList:$typeValueList
              })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 1
            Column() {
              SelectCustom({
                name:'selectedColor',
                selectItem:$selectedColor,
                itemsList:$selectedColorList,
                valuesList:$selectedColorValueList
              })
              SelectCustom({
                name:'switchPointColor',
                selectItem:$switchPointColor,
                itemsList:$switchPointColorList,
                valuesList:$switchPointColorValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 20, max: 100 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 20, max: 100 })
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