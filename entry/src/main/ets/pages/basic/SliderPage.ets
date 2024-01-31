import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct SliderPage {
  @State selectTab: number = 0

  //value
  @State value: number = 50

  //step
  @State step: number = 1

  //style
  @State style: SliderStyle = SliderStyle.OutSet
  @State styleList: SliderStyle[] = [
  SliderStyle.OutSet,
  SliderStyle.InSet
  ]
  @State styleValueList: Array<ValueObject> = [
    { value: 'OutSet' },
    { value: 'InSet' }
  ]

  //direction
  @State direct: Axis = Axis.Horizontal
  @State directList: Axis[] = [
  Axis.Horizontal,
  Axis.Vertical
  ]
  @State directValueList: Array<ValueObject> = [
    { value: 'Horizontal' },
    { value: 'Vertical' }
  ]

  //reverse
  @State reverse: boolean = false

  //blockColor
  @State blockColor: Color = Color.White
  @State blockColorList: Color[] = [
  Color.White,
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State blockColorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]
  //trackColor
  @State trackColor: Color = Color.White
  @State trackColorList: Color[] = [
  Color.White,
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State trackColorValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //selectedColor
  @State selectedColor: Color = Color.Blue
  @State selectedColorList: Color[] = [
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State selectedColorValueList: Array<ValueObject> = [
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //showSteps
  @State showSteps: boolean = false

  //showTips
  @State showTips: boolean = false

  //trackThickness
  @State trackThickness: number = 4

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Slider 滑动条' })
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
            Slider({
              value: this.value,
              step: this.step,
              style: this.style,
              direction: this.direct,
              reverse: this.reverse
            })
              .width(this.widthValue)
              .height(this.heightValue)
              .blockColor(this.blockColor)
              .trackColor(this.trackColor)
              .selectedColor(this.selectedColor)
              .showSteps(this.showSteps)
              .showTips(this.showTips)
              .trackThickness(this.trackThickness)
              .onChange((value: number, _) => {
                this.value = value
              })
            Text(`value : ${Math.floor(this.value)}`)
              .fontColor($r('app.color.font_normal'))
          }


          Blank()
          Column() {

            //tab 0
            Column() {
              SliderCustom({ name: 'step', value: $step, min: 1, max: 10 })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'style',
                selectItem: $style,
                itemsList: $styleList,
                valuesList: $styleValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'direction',
                selectItem: $direct,
                itemsList: $directList,
                valuesList: $directValueList
              })
              Divider().color($r('app.color.line_grey'))
              SwitchCustom({ name: 'reverse', isOn: $reverse })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            //tab 1
            Column() {
              SelectCustom({
                name: 'blockColor',
                selectItem: $blockColor,
                itemsList: $blockColorList,
                valuesList: $blockColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'trackColor',
                selectItem: $trackColor,
                itemsList: $trackColorList,
                valuesList: $trackColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'selectedColor',
                selectItem: $selectedColor,
                itemsList: $selectedColorList,
                valuesList: $selectedColorValueList
              })
              Divider().color($r('app.color.line_grey'))
              SwitchCustom({ name: 'showSteps', isOn: $showSteps })
              Divider().color($r('app.color.line_grey'))
              SwitchCustom({ name: 'showTips', isOn: $showTips })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ name: 'trackThickness', value: $trackThickness, min: 1, max: 20 })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)


            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 100, max: 300 })
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