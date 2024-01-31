import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import SwitchCustom from '../../component/controller/SwitchCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct ImageAnimatorPage {
  @State selectTab: number = 1

  //images
  private images: ImageFrameInfo[] = [
    { src: $r('app.media.stack01') },
    { src: $r('app.media.stack02') },
    { src: $r('app.media.stack03') },
    { src: $r('app.media.stack04') },
    { src: $r('app.media.stack05') },
    { src: $r('app.media.stack06') },
    { src: $r('app.media.stack07') },
    { src: $r('app.media.stack08') },
    { src: $r('app.media.stack09') },
    { src: $r('app.media.stack10') },
    { src: $r('app.media.stack11') },
    { src: $r('app.media.stack12') }
  ]

  //state
  @State selectState: AnimationStatus = AnimationStatus.Initial
  @State stateList: AnimationStatus[] = [
  AnimationStatus.Initial,
  AnimationStatus.Running,
  AnimationStatus.Paused,
  AnimationStatus.Stopped
  ]
  @State stateValueList: Array<ValueObject> = [
    { value: 'Initial' },
    { value: 'Running' },
    { value: 'Paused' },
    { value: 'Stopped' }
  ]

  //duration
  @State duration: number = 1000

  //reverse
  @State reverse: boolean = false

  //fillMode
  @State selectFillMode: FillMode = FillMode.None
  @State fillModeList: FillMode[] = [
  FillMode.None,
  FillMode.Forwards,
  FillMode.Backwards,
  FillMode.Both,
  ]
  @State fillModeValueList: Array<ValueObject> = [
    { value: 'None' },
    { value: 'Forwards' },
    { value: 'Backwards' },
    { value: 'Both' }
  ]

  //iterations
  @State iterations: number = 1

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'ImageAnimator 帧动画' })
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
            ImageAnimator()
              .images(this.images)
              .width(this.widthValue)
              .height(this.heightValue)
              .state(this.selectState)
              .duration(this.duration)
              .reverse(this.reverse)
              .fillMode(this.selectFillMode)
              .iterations(this.iterations)
          }


          Blank()
          Column() {

            // tab 1
            Column(){
              SelectCustom({
                name: 'state',
                selectItem: $selectState,
                itemsList: $stateList,
                valuesList: $stateValueList
              })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ name: 'duration', min: 100, max: 4000, value: $duration })
              Divider()
                .color($r('app.color.line_grey'))
              SwitchCustom({ name: 'reverse', isOn: $reverse })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'fillMode',
                selectItem: $selectFillMode,
                itemsList: $fillModeList,
                valuesList: $fillModeValueList
              })
              SliderCustom({ name: 'iterations', value: $iterations, min: -1, max: 3 })
            }
            .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)


            // tab 2
            Column() {
              SliderCustom({ value: $widthValue, name: 'width', min: 100, max: 300 })
              Divider()
                .color($r('app.color.line_grey'))
              SliderCustom({ value: $heightValue, name: 'height', min: 100, max: 300 })
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