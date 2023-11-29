import TitleTab from '../component/TitleTab'
import Title from '../component/Title'
import SelectCustom from '../component/SelectCustom'
import SwitchCustom from '../component/SwitchCustom'
import SliderCustom from '../component/SliderCustom'

@Entry
@Component
struct ButtonPage {
  @State selectTab: number = 1

  //type
  @State type: ButtonType = ButtonType.Capsule
  @State typeArr: ButtonType[] = [ButtonType.Capsule, ButtonType.Circle, ButtonType.Normal]
  @State typeValueArr: { value: string }[] = [
    { value: 'Capsule' },
    { value: 'Circle' },
    { value: 'Normal' }
  ]

  //stateEffect
  @State stateEffect: boolean = true

  //width
  @State widthValue: number = 80

  //height
  @State heightValue: number = 50

  //fontSize
  @State sizeValue: number = 14

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Button 按钮' })
      TitleTab({ selectTab: $selectTab, interface: false, property: true, common: true })
    }
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }

  build() {
    Column() {
      Navigation() {
        Column() {
          Column()
            .height(200)
          Column() {
            Button('Button')
              .type(this.type)
              .stateEffect(this.stateEffect)
              .backgroundColor($r('app.color.brand'))
              .width(this.widthValue)
              .height(this.heightValue)
              .fontSize(this.sizeValue)
          }

          Blank()

          Column() {

            if (this.selectTab === 1) {
              SelectCustom({ name: 'type', valuesList: $typeValueArr, itemsList: $typeArr, selectItem: $type })
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({ name: 'stateEffect', isOn: $stateEffect })
            }
            if (this.selectTab === 2) {
              SliderCustom({ name: 'width', value: $widthValue, min: 50, max: 180 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'height', value: $heightValue, min: 20, max: 120 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'fontSize', value: $sizeValue, min: 10, max: 40 })
            }

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

