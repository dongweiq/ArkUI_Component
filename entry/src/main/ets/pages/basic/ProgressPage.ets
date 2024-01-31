import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct ProgressPage {
  @State selectTab: number = 0

  // --> interface
  //value
  @State currentValue: number = 50

  //total
  @State total: number = 100

  //type
  @State selectType: ProgressType = ProgressType.Linear
  @State typeList: ProgressType[] = [
  ProgressType.Linear,
  ProgressType.Ring,
  ProgressType.Eclipse,
  ProgressType.ScaleRing,
  ProgressType.Capsule
  ]
  @State typeValueList: Array<ValueObject> = [
    { value: 'Linear' },
    { value: 'Ring' },
    { value: 'Eclipse' },
    { value: 'Black' },
    { value: 'ScaleRing' }
  ]

  // --> prop
  //color
  @State selectColor: Color = Color.Blue
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

  //backgroundColor
  @State selectBackgroundColor: Color = Color.Gray
  @State backgroundColorList: Color[] = [
  Color.Gray,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange
  ]
  @State backgroundColorValueList: Array<ValueObject> = [
    { value: 'Gray' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' }
  ]

  //style
  //strokeWidth
  @State strokeWidth: number = 4
  @State scaleCount: number = 120
  @State scaleWidth: number = 2


  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Progress 进度条' })
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
            Progress({ value: this.currentValue, total: this.total, type: this.selectType })
              .width(this.widthValue)
              .height(this.heightValue)
              .color(this.selectColor)
              .backgroundColor(this.selectBackgroundColor)
              .style({
                strokeWidth:this.strokeWidth,
                scaleCount:this.scaleCount,
                scaleWidth:this.scaleWidth
              })
          }

          Blank()

          Column() {

            //tab 0
            Column() {
              SliderCustom({name:'value',value:$currentValue,min:100,max:200})
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'total',value:$total,min:200,max:400})
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name:'type',
                selectItem:$selectType,
                itemsList:$typeList,
                valuesList:$typeValueList
              })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            //tab 1
            Column() {

              SelectCustom({
                name: 'color',
                valuesList: $colorValueList,
                itemsList: $colorList,
                selectItem: $selectColor
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name:'backgroundColor',
                valuesList:$backgroundColorValueList,
                itemsList:$backgroundColorList,
                selectItem:$selectBackgroundColor
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'strokeWidth',value:$strokeWidth,min:1,max:20})
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'scaleCount',value:$scaleCount,min:60,max:240})
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'scaleWidth',value:$scaleWidth,min:1,max:5})

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)


            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider().color($r('app.color.line_grey'))
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