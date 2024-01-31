import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from './ButtonPage'


@Entry
@Component
struct DataPanelPage {
  @State selectTab: number = 0

  //values
  @State panelData: number[] = [10, 10, 10, 10, 10, 10, 10, 10, 10]

  //max
  @State max: number = 100

  //type
  @State type: DataPanelType = DataPanelType.Circle
  @State typeList: DataPanelType[] = [DataPanelType.Circle, DataPanelType.Line]
  @State typeValueList: Array<ValueObject> = [{ value: 'Circle' }, { value: 'Line' }]

  //closeEffect
  @State closeEffect: boolean = false

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'DataPanel 数据面板' })
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
            Stack() {
              DataPanel({ values: this.panelData, type: this.type, max: this.max })
                .width(this.widthValue)
                .height(this.heightValue)
                .closeEffect(this.closeEffect)
              Button('刷新数据')
                .type(ButtonType.Circle)
                .fontColor($r('app.color.font_light'))
                .width(100)
                .backgroundColor($r('app.color.start_window_background'))
                .onClick(() => this.refreshData())
            }
          }

          Blank()
          Column() {
            //tab 0
            Column() {
              SliderCustom({ value: $max, name: 'max', min: 50, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({ name: 'type', itemsList: $typeList, valuesList: $typeValueList, selectItem: $type })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            //tab 1
            Column() {
              SwitchCustom({ name: 'closeEffect', isOn: $closeEffect })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 200, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 350 })
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

  refreshData() {
    for (let index = 0; index < this.panelData.length; index++) {
      this.panelData[index] = Math.floor(Math.random() * 18)
    }
  }
}