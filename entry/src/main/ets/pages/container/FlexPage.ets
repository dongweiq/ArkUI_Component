import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct FlexPage {
  @State selectTab: number = 0

  //direction
  @State direct: FlexDirection = FlexDirection.Row
  @State directList: FlexDirection[] = [
  FlexDirection.Row,
  FlexDirection.RowReverse,
  FlexDirection.Column,
  FlexDirection.ColumnReverse,
  ]
  @State directValueList: Array<ValueObject> = [
    { value: 'Row' },
    { value: 'RowReverse' },
    { value: 'Column' },
    { value: 'ColumnReverse' }
  ]

  //wrap
  @State wrap: FlexWrap = FlexWrap.NoWrap
  @State wrapList: FlexWrap[] = [
  FlexWrap.NoWrap,
  FlexWrap.Wrap,
  FlexWrap.WrapReverse
  ]
  @State wrapValueList: Array<ValueObject> = [
    { value: 'NoWrap' },
    { value: 'Wrap' },
    { value: 'WrapReverse' }
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

  //alignItems
  @State alignItems: ItemAlign = ItemAlign.Center
  @State alignItemsList: ItemAlign[] = [
  ItemAlign.Center,
  ItemAlign.Start,
  ItemAlign.End,
  ItemAlign.Auto,
  ItemAlign.Stretch,
  ItemAlign.Baseline
  ]
  @State alignItemsValueList: Array<ValueObject> = [
    { value: 'Center' },
    { value: 'Start' },
    { value: 'End' },
    { value: 'Auto' },
    { value: 'Stretch' },
    { value: 'Baseline' }
  ]

  //alignContent
  @State alignContent: FlexAlign = FlexAlign.Center
  @State alignContentList: FlexAlign[] = [
  FlexAlign.Center,
  FlexAlign.Start,
  FlexAlign.End,
  FlexAlign.SpaceBetween,
  FlexAlign.SpaceAround,
  FlexAlign.SpaceEvenly
  ]
  @State alignContentValueList: Array<ValueObject> = [
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
      Title({ pageTitle: 'Flex 弹性布局' })
      TitleTab({ selectTab: $selectTab, interface: true, property: false, common: true })
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
            Flex({
              direction: this.direct,
              wrap: this.wrap,
              justifyContent: this.justifyContent,
              alignItems: this.alignItems,
              alignContent: this.alignContent
            }) {
              Text('元素1')
                .fontColor($r('app.color.font_normal'))
              Text('元素2')
                .fontColor($r('app.color.font_normal'))
              Text('元素3')
                .fontColor($r('app.color.font_normal'))
            }
            .backgroundColor($r('app.color.start_window_background'))
            .width(this.widthValue)
            .height(this.heightValue)
          }

          Blank()
          Column() {

            // tab 0
            Column() {
              SelectCustom({
                name: 'direction',
                selectItem: $direct,
                itemsList: $directList,
                valuesList: $directValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'wrap',
                selectItem: $wrap,
                itemsList: $wrapList,
                valuesList: $wrapValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'justifyContent',
                selectItem: $justifyContent,
                itemsList: $justifyContentList,
                valuesList: $justifyContentValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'alignItems',
                selectItem: $alignItems,
                itemsList: $alignItemsList,
                valuesList: $alignItemsValueList
              })
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name: 'alignContent',
                selectItem: $alignContent,
                itemsList: $alignContentList,
                valuesList: $alignContentValueList
              })

            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 10, max: 300 })
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