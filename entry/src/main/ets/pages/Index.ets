import basicCom from '../bean/basicCom'
import infoCom from '../bean/infoCom'
import inputCom from '../bean/inputCom'
import funcCom from '../bean/funcCom'
import containCom from '../bean/containCom'
import dialogCom from '../bean/dialogCom'
import ListTitle from '../component/list/ListTitle'
import ListItemCustom from '../component/list/ListItemCustom'
import { NameAddressObj } from '../bean/NameAddressObj'

@Entry
@Component
struct Index {

  build() {

    Column() {
      Column() {
        Text('ArkUI 组件示例')
          .fontColor($r('app.color.font_main'))
          .fontSize(24)
          .fontWeight(700)
          .margin({ left: 2, bottom: 20, top: 20 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      List({ space: 16 }) {

        //基础组件
        ListItem() {
          ListTitle({ title: '基础组件' })
        }

        ForEach(basicCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

        //信息展示
        ListItem() {
          ListTitle({ title: '信息展示' })
        }

        ForEach(infoCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

        //信息输入
        ListItem() {
          ListTitle({ title: '信息输入' })
        }

        ForEach(inputCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

        //功能控件
        ListItem() {
          ListTitle({ title: '功能控件' })
        }

        ForEach(funcCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

        //容器
        ListItem() {
          ListTitle({ title: '容器' })
        }

        ForEach(containCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

        //弹窗
        ListItem() {
          ListTitle({ title: '弹窗' })
        }

        ForEach(dialogCom, (item: NameAddressObj) => {
          ListItem() {
            ListItemCustom({ name: item.name as string, address: item.address as string })
          }
        })

      }
      .width('100%')
      .height('94%')

    }
    .padding(20)
    .width('100%')
    .backgroundColor($r('app.color.start_window_background'))

  }
}
