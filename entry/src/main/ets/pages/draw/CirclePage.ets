import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from '../basic/ButtonPage'

@Entry
@Component
struct CirclePage {
  @State selectTab: number = 0

  @State widthValue : number = 200
  @State heightValue : number = 200

  //fill
  @State fill: Color = Color.White
  @State fillList: Color[] = [
  Color.White,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State fillValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //fillOpacity
  @State fillOpacity : number = 1


  //stroke
  @State stroke: Color = Color.White
  @State strokeList: Color[] = [
  Color.White,
  Color.Black,
  Color.Blue,
  Color.Brown,
  Color.Green,
  Color.Orange,
  Color.Grey
  ]
  @State strokeValueList: Array<ValueObject> = [
    { value: 'White' },
    { value: 'Black' },
    { value: 'Blue' },
    { value: 'Brown' },
    { value: 'Green' },
    { value: 'Orange' },
    { value: 'Grey' }
  ]

  //strokeOpacity
  @State strokeOpacity : number = 1

  //strokeWidth
  @State strokeWidth : number = 2



  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Circle 圆形' })
      TitleTab({ selectTab: $selectTab, interface: true, property: true, common: false })
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
            Circle({width:this.widthValue,height:this.heightValue})
              .fill(this.fill)
              .stroke(this.stroke)
              .fillOpacity(this.fillOpacity)
              .strokeOpacity(this.strokeOpacity)
              .strokeWidth(this.strokeWidth)
          }


          Blank()
          Column() {

            // tab 0
            Column() {
              SliderCustom({name:'width',value:$widthValue,min:100,max:200})
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'height',value:$heightValue,min:100,max:200})
            }
            .visibility(this.selectTab === 0 ? Visibility.Visible : Visibility.None)

            // tab 1
            Column() {
              SelectCustom({
                name:'fill',
                selectItem:$fill,
                itemsList:$fillList,
                valuesList:$fillValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'fillOpacity',value:$fillOpacity,min:0,max:1,step:0.1})
              Divider().color($r('app.color.line_grey'))
              SelectCustom({
                name:'stroke',
                selectItem:$stroke,
                itemsList:$strokeList,
                valuesList:$strokeValueList
              })
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'strokeOpacity',value:$strokeOpacity,min:0,max:1,step:0.1})
              Divider().color($r('app.color.line_grey'))
              SliderCustom({name:'strokeWidth',value:$strokeWidth,min:1,max:10})

            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {

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