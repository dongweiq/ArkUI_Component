import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct ColumnPage {
  @State selectTab: number = 0

  //space
  @State space: number = 10

  //alignItems
  @State alignItems: HorizontalAlign = HorizontalAlign.Center
  @State alignItemsList: HorizontalAlign[] = [
  HorizontalAlign.Center,
  HorizontalAlign.Start,
  HorizontalAlign.End
  ]
  @State alignItemsValueList: Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' },
  ]

  //justifyContent
  @State justifyContent: FlexAlign = FlexAlign.Center
  @State justifyContentList: FlexAlign[] = [
  FlexAlign.Center,
  FlexAlign.Start,
  FlexAlign.End,
  FlexAlign.SpaceBetween,
  FlexAlign.SpaceAround,
  FlexAlign.SpaceEvenly
  ]
  @State justifyContentValueList: Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' },
    { value: 'SpaceBetween' },
    { value: 'SpaceAround' },
    { value: 'SpaceEvenly' },
  ]

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Column 垂直布局' })
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
            Column({ space: this.space }) {
              Text('元素1')
                .fontColor($r('app.color.font_normal'))
              Text('元素2')
                .fontColor($r('app.color.font_normal'))
              Text('元素3')
                .fontColor($r('app.color.font_normal'))
            }
            .alignItems(this.alignItems)
            .justifyContent(this.justifyContent)
            .backgroundColor($r('app.color.start_window_background'))
            .width(this.widthValue)
            .height(this.heightValue)
          }

          Blank()
          Column() {

            // tab 0
            Column() {
              SliderCustom({ name: 'space', value: $space, min: 0, max: 50 })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 1
            Column() {
              SelectCustom({
                name: 'alignItems',
                selectItem: $alignItems,
                itemsList: $alignItemsList,
                valuesList: $alignItemsValueList
              })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'justifyContent',
                selectItem: $justifyContent,
                itemsList: $justifyContentList,
                valuesList: $justifyContentValueList
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