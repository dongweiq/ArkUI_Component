import { NameAddressObj } from './NameAddressObj'

const containCom: Array<NameAddressObj> = [
  {
    name: 'Column 垂直容器',
    address: 'pages/container/ColumnPage'
  },

  {
    name: 'Row 水平容器',
    address: 'pages/container/RowPage'
  },

  {
    name: 'Stack 堆叠容器',
    address: 'pages/container/StackPage'
  },

  {
    name: 'Flex 弹性布局',
    address: 'pages/container/FlexPage'
  },

  {
    name: 'List 列表容器',
    address: 'pages/container/ListPage'
  },

  {
    name: 'Grid 网格容器',
    address: 'pages/container/GridPage'
  },

  {
    name: 'Swiper 滑块视图',
    address: 'pages/container/SwiperPage'
  },

  {
    name: 'Tabs 页签',
    address: 'pages/container/TabsPage'
  },

  {
    name: 'Badge 信息标记',
    address: 'pages/container/BadgePage'
  },

  {
    name: 'Counter 计数器',
    address: 'pages/container/CounterPage'
  },

  {
    name: 'Panel 滑动面板',
    address: 'pages/container/PanelPage'
  },

  {
    name: 'Scroll 滚动容器',
    address: 'pages/container/ScrollPage'
  },

  {
    name: 'SideBarContainer 侧边栏',
    address: 'pages/container/SideBarContainerPage'
  },
]

export class ContainComItem {
  name: string = ''
  address: string = ''
}

export default containCom