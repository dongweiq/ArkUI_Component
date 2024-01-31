import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct ListPage {
  @State selectTab: number = 0
  //element
  @State @Watch('onNumberChange') listNumber: number = 3
  @State listValue: string[] = ['1', '2', '3']

  onNumberChange() {
    this.listValue = []
    for (let index = 0; index < this.listNumber; index++) {
      this.listValue[index] = (index + 1).toString()
    }
  }

  //space
  @State space: number = 0
  //listDirection
  @State listDirection: Axis = Axis.Vertical
  @State listDirectionList: Axis[] = [
    Axis.Vertical,
    Axis.Horizontal
  ]
  @State listDirectionValueList: Array<ValueObject> = [
    { value: 'Vertical' },
    { value: 'Horizontal' }
  ]
  //width
  @State widthValue: number = 200
  //height
  @State heightValue: number = 200

  @Builder
  pageTitle() {
    Column() {
      Title({ pageTitle: 'List 列表' })
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
            Counter() {
              Text(this.listNumber.toString())
                .fontColor($r('app.color.font_normal'))
            }.onInc(() => {
              this.listNumber++
            })
            .onDec(() => {
              if (this.listNumber > 0) {
                this.listNumber--
              }
            })
            .margin({ bottom: 15 })

            List({ space: this.space }) {
              ForEach(this.listValue, (value: string) => {
                ListItem() {
                  Row() {
                    Text('listItem').fontColor($r('app.color.start_window_background'))
                    Blank()
                    Text(value).fontColor($r('app.color.start_window_background'))
                  }
                  .backgroundColor($r('app.color.brand'))
                  .padding(4)
                  .width('100%')
                }
              })
            }
            .listDirection(this.listDirection)
            .width(this.widthValue)
            .height(this.heightValue)
            .backgroundColor($r('app.color.start_window_background'))
          }

          Blank()
          Column() {
            // tab 0
            Column() {
              SliderCustom({ name: 'space', value: $space, min: 0, max: 30 })
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 1
            Column() {
              SelectCustom({
                name: 'listDirection',
                selectItem: $listDirection,
                itemsList: $listDirectionList,
                valuesList: $listDirectionValueList
              })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 50, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 50, max: 300 })
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