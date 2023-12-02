import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'

@Entry
@Component
struct SwiperPage {
  @State selectTab: number = 1

  private swiperController: SwiperController = new SwiperController()

  private listValue: string[] = ['1', '2', '3', '4', '5']

  //autoPlay
  @State autoPlay : boolean = false

  //interval
  @State interval : number = 3000

  //indicator
  @State indicator : boolean = true

  //loop
  @State loop : boolean = true

  //vertical
  @State vertical : boolean = false

  //itemSpace
  @State itemSpace : number = 0

  //disableSwipe
  @State disableSwipe : boolean = false

  //width
  @State widthValue: number = 200

  //height
  @State heightValue: number = 140

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Swiper 滑块视图' })
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
            Swiper(this.swiperController){
              ForEach(this.listValue, (value: string) => {
                  Row() {
                    Text('item').fontColor($r('app.color.start_window_background'))
                    Text(value).fontColor($r('app.color.start_window_background'))
                  }
                  .justifyContent(FlexAlign.Center)
                  .backgroundColor($r('app.color.brand'))
                  .padding(4)
              })
            }
            .autoPlay(this.autoPlay)
            .interval(this.interval)
            .indicator(this.indicator)
            .loop(this.loop)
            .vertical(this.vertical)
            .itemSpace(this.itemSpace)
            .disableSwipe(this.disableSwipe)
            .width(this.widthValue)
            .height(this.heightValue)

            Row({space:20}){
              Button('Previous').backgroundColor($r('app.color.brand'))
                .onClick(() => {
                  this.swiperController.showPrevious()
                })
              Button('Next').backgroundColor($r('app.color.brand'))
                .onClick(() => {
                  this.swiperController.showNext()
                })
            }
            .margin({top:20})

          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SwitchCustom({name:'autoPlay',isOn:$autoPlay})
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({name:'interval',value:$interval,min:1000,max:4000})
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({name:'indicator',isOn:$indicator})
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({name:'loop',isOn:$loop})
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({name:'vertical',isOn:$vertical})
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({name:'disableSwipe',isOn:$disableSwipe})
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 50, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 50, max: 200 })
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