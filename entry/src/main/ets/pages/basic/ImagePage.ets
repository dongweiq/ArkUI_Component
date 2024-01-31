import TitleTab from '../../component/title/TitleTab'
import Title from '../../component/title/Title'
import SliderCustom from '../../component/controller/SliderCustom'
import SelectCustom from '../../component/controller/SelectCustom'
import { ValueObject } from './ButtonPage'

@Entry
@Component
struct ImagePage {
  @State selectTab: number = 1

  //objectFit
  @State selectObjectFit: ImageFit = ImageFit.Contain
  @State objectFitList: ImageFit[] = [
  ImageFit.Auto,
  ImageFit.Contain,
  ImageFit.Cover,
  ImageFit.Fill,
  ImageFit.ScaleDown,
  ImageFit.None
  ]
  @State objectFitValueList: Array<ValueObject> = [
    { value: 'Auto' },
    { value: 'Contain' },
    { value: 'Cover' },
    { value: 'Fill' },
    { value: 'ScaleDown' },
    { value: 'None' }
  ]

  //objectRepeat
  @State selectObjectRepeat: ImageRepeat = ImageRepeat.NoRepeat
  @State objectRepeatList: ImageRepeat[] = [
  ImageRepeat.NoRepeat,
  ImageRepeat.X,
  ImageRepeat.Y,
  ImageRepeat.XY
  ]
  @State objectRepeatValueList: Array<ValueObject> = [
    { value: 'NoRepeat' },
    { value: 'X' },
    { value: 'Y' },
    { value: 'XY' }
  ]

  //renderMode
  @State selectRenderMode: ImageRenderMode = ImageRenderMode.Original
  @State renderModeList: ImageRenderMode[] = [
  ImageRenderMode.Original,
  ImageRenderMode.Template
  ]
  @State renderModeValueList: Array<ValueObject> = [
    { value: 'Original' },
    { value: 'Template' }
  ]

  //width
  @State widthValue: number = 300

  //height
  @State heightValue: number = 300

  @Builder pageTitle() {
    Column() {
      Title({ pageTitle: 'Image 图片' })
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
            Image($r('app.media.cat'))
              .sourceSize({ width: 200, height: 266 })
              .width(this.widthValue)
              .height(this.heightValue)
              .objectFit(this.selectObjectFit)
              .objectRepeat(this.selectObjectRepeat)
              .renderMode(this.selectRenderMode)
          }


          Blank()
          Column() {

            // tab 1
            Column() {
              SelectCustom({
                name: 'objectFit',
                itemsList: $objectFitList,
                valuesList: $objectFitValueList,
                selectItem: $selectObjectFit
              })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'objectRepeat',
                itemsList: $objectRepeatList,
                valuesList: $objectRepeatValueList,
                selectItem: $selectObjectRepeat
              })
              Divider()
                .color($r('app.color.line_grey'))
              SelectCustom({
                name: 'renderMode',
                itemsList: $renderModeList,
                valuesList: $renderModeValueList,
                selectItem: $selectRenderMode
              })
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