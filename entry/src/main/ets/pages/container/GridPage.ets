import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'

@Entry
@Component
struct GridPage {
  @State selectTab: number = 1

  //element
  @State @Watch('onNumberChange') listNumber: number = 5
  @State listValue: string[] = ['1', '2', '3', '4', '5']

  onNumberChange() {
    this.listValue = []
    for (let index = 0; index < this.listNumber; index++) {
      this.listValue[index] = (index + 1).toString()
    }
  }

  //columnsGap
  @State columnsGap: number = 0

  //rowsGap
  @State rowsGap: number = 0


  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Grid 网格容器' })
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

            Grid() {
              ForEach(this.listValue, (value: string) => {
                GridItem() {
                  Text(value).fontColor($r('app.color.start_window_background'))
                }.backgroundColor($r('app.color.brand'))
              })
            }
            .columnsTemplate('1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr 1fr')
            .columnsGap(this.columnsGap)
            .rowsGap(this.rowsGap)
            .width(this.widthValue)
            .height(this.heightValue)
            .backgroundColor($r('app.color.start_window_background'))
          }

          Blank()
          Column() {

            // tab 1
            Column() {
              SliderCustom({ name: 'columnsGap', value: $columnsGap, min: 0, max: 30 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'rowsGap', value: $rowsGap, min: 0, max: 30 })
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