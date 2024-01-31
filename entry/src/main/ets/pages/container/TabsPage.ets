import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct TabsPage {
  @State selectTab: number = 0

  //barPosition
  @State barPosition: BarPosition = BarPosition.Start
  @State barPositionList: BarPosition[] = [
  BarPosition.Start,
  BarPosition.End
  ]
  @State barPositionValueList: Array<ValueObject> = [
    { value: 'Start' },
    { value: 'End' }
  ]

  //vertical
  @State vertical: boolean = false

  //scrollable
  @State scrollable: boolean = true

  //barMode
  @State barMode: BarMode = BarMode.Scrollable
  @State barModeList: BarMode[] = [
  BarMode.Scrollable,
  BarMode.Fixed
  ]
  @State barModeValueList: Array<ValueObject> = [
    { value: 'Scrollable' },
    { value: 'Fixed' }
  ]

  //barWidth
  @State barWidth: number = 120

  //barHeight
  @State barHeight: number = 60

  //animationDuration
  @State animationDuration: number = 300

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Tabs 页签' })
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
            Tabs({ barPosition: this.barPosition }) {
              TabContent() {
                Column() {
                  Text('01').fontColor(Color.Gray).fontSize(24)
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(Color.Yellow)
                .width('100%')
                .height('100%')
              }.tabBar('01')

              TabContent() {
                Column() {
                  Text('02').fontColor(Color.Gray).fontSize(24)
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(Color.Pink)
                .width('100%')
                .height('100%')
              }.tabBar('02')

              TabContent() {
                Column() {
                  Text('03').fontColor(Color.Gray).fontSize(24)
                }
                .justifyContent(FlexAlign.Center)
                .backgroundColor(Color.Orange)
                .width('100%')
                .height('100%')
              }.tabBar('03')
            }
            .backgroundColor(Color.White)
            .width(this.widthValue)
            .height(this.heightValue)
            .vertical(this.vertical)
            .scrollable(this.scrollable)
            .barMode(this.barMode)
            .barWidth(this.barWidth)
            .barHeight(this.barHeight)
            .animationDuration(this.animationDuration)
          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SelectCustom({
                name: 'barPosition',
                selectItem: $barPosition,
                itemsList: $barPositionList,
                valuesList: $barPositionValueList
              })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 1
            Column() {
              SwitchCustom({name:'vertical',isOn:$vertical})
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({name:'scrollable',isOn:$scrollable})
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'barMode',
                selectItem: $barMode,
                itemsList: $barModeList,
                valuesList: $barModeValueList
              })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $barWidth, name: 'barWidth', min: 40, max: 200})
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $barHeight, name: 'barHeight', min: 40, max: 200})
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $animationDuration, name: 'animationDu', min: 100, max: 999})
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
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