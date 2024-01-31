import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct StackPage {
  @State selectTab: number = 1
  //alignContent
  @State alignContent: Alignment = Alignment.Center
  @State alignContentList: Alignment[] = [
    Alignment.Center,
    Alignment.Start,
    Alignment.End,
    Alignment.TopStart,
    Alignment.Top,
    Alignment.TopEnd,
    Alignment.BottomStart,
    Alignment.Bottom,
    Alignment.BottomEnd
  ]
  @State alignContentValueList: Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' },
    { value: 'TopStart' },
    { value: 'Top' },
    { value: 'TopEnd' },
    { value: 'BottomStart' },
    { value: 'Bottom' },
    { value: 'BottomEnd' },
  ]
  //width
  @State widthValue: number = 200
  //height
  @State heightValue: number = 200

  @Builder
  pageTitle() {
    Column() {
      Title({ pageTitle: 'Stack 堆叠容器' })
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
            Stack({ alignContent: this.alignContent }) {
              Column() {
              }
              .width('90%')
              .height('100%')
              .backgroundColor($r('app.color.start_window_background'))

              Column() {
              }
              .width('50%')
              .height('50%')
              .backgroundColor($r('app.color.brand'))
            }
            .width(this.widthValue)
            .height(this.heightValue)
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'alignContent',
                selectItem: $alignContent,
                itemsList: $alignContentList,
                valuesList: $alignContentValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 10, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
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