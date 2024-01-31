import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'


@Entry
@Component
struct StepperPage {
  @State selectTab: number = 1

  //status
  @State status: ItemState = ItemState.Normal
  @State statusList: ItemState[] = [
  ItemState.Normal,
  ItemState.Disabled,
  ItemState.Waiting,
  ItemState.Skip,
  ]
  @State statusValueList: Array<ValueObject> = [
    { value: 'Normal' },
    { value: 'Disabled' },
    { value: 'Waiting' },
    { value: 'Skip' },
  ]


  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Stepper 步骤导航' })
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
            Stepper() {
              StepperItem() {
                Column() {
                  Text('Page One').fontSize(28).fontColor($r('app.color.font_light'))
                }
              }.status(this.status)

              StepperItem() {
                Column() {
                  Text('Page Two').fontSize(28).fontColor($r('app.color.font_light'))
                }
              }.status(this.status)

              StepperItem() {
                Column() {
                  Text('Page Three').fontSize(28).fontColor($r('app.color.font_light'))
                }
              }.status(this.status)
            }
            .backgroundColor($r('app.color.start_window_background'))
            .width(this.widthValue)
            .height(this.heightValue)

          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'status',
                selectItem: $status,
                itemsList: $statusList,
                valuesList: $statusValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 350 })
              Divider()
                .color($r('app.color.line_grey'))
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