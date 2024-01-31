import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct ScrollPage {
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

  //scrollBarColor
  @State scrollBarColor: Color = Color.Blue
  @State scrollBarColorList: Color[] = [
  Color.Blue,
  Color.Black,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State scrollBarColorValueList: Array<ValueObject> = [
    { value: 'Blue' },
    { value: 'Black' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //scrollBarWidth
  @State scrollBarWidth : number = 4

  //edgeEffect
  @State edgeEffect : EdgeEffect = EdgeEffect.None
  @State edgeEffectList : EdgeEffect[] = [
    EdgeEffect.None,
    EdgeEffect.Spring,
    EdgeEffect.Fade
  ]
  @State edgeEffectValueList : Array<ValueObject> = [
    {value:'None'},
    {value:'Spring'},
    {value:'Fade'},
  ]

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 200

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Scroll 滚动容器' })
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

            Scroll(){
              List({space:5}) {
                ForEach(this.listValue, (value: string) => {
                  ListItem() {
                    Row() {
                      Text('listItem').fontColor($r('app.color.start_window_background'))
                      Blank()
                      Text(value).fontColor($r('app.color.start_window_background'))
                    }
                    .backgroundColor($r('app.color.brand'))
                    .padding(4)
                    .height(40)
                    .width('100%')
                  }
                })
              }
            }
            .width(this.widthValue)
            .height(this.heightValue)
            .backgroundColor($r('app.color.start_window_background'))
            .scrollBarColor(this.scrollBarColor)
            .scrollBarWidth(this.scrollBarWidth)
            .edgeEffect(this.edgeEffect)

          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name:'scrollBarColor',
                selectItem:$scrollBarColor,
                itemsList:$scrollBarColorList,
                valuesList:$scrollBarColorValueList
              })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({name:'scrollBarWidth',value:$scrollBarWidth,min:1,max:20})
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name:'edgeEffect',
                selectItem:$edgeEffect,
                itemsList:$edgeEffectList,
                valuesList:$edgeEffectValueList
              })

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
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
}