import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct RatingPage {
  @State selectTab: number = 0

  //rating
  @State rating: number = 4.5

  //indicator
  @State indicator: boolean = false

  //stepSize
  @State stepSize: number = 1

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 100

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Rating 评分' })
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
            Rating({ rating: this.rating, indicator: this.indicator })
              .width(this.widthValue)
              .height(this.heightValue)
              .stepSize(this.stepSize)
              .onChange((value: number) => {
                this.rating = value
              })
            Text(`评分${this.rating}`)
              .margin({ top: 20 })
              .fontColor($r('app.color.font_normal'))
          }

          Blank()
          Column() {

            //tab 0
            Column() {
              SwitchCustom({ name: 'indicator', isOn: $indicator })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            //tab 1
            Column() {
              SliderCustom({ name: 'stepSize', value: $stepSize, min: 0.1, max: 2 })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            //tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 10, max: 300 })
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