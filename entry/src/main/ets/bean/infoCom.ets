import { NameAddressObj } from './NameAddressObj'

const infoCom: Array<NameAddressObj> = [
  {
    name: 'Image 图片',
    address: 'pages/basic/ImagePage'
  },

  {
    name: 'Span 行内文本',
    address: 'pages/basic/SpanPage'
  },

  {
    name: 'ImageAnimator 帧动画',
    address: 'pages/basic/ImageAnimatorPage'
  },

  {
    name: 'LoadingProgress 加载',
    address: 'pages/basic/LoadingProgressPage'
  },

  {
    name: 'Progress 进度条',
    address: 'pages/basic/ProgressPage'
  },

  {
    name: 'QRCode 二维码',
    address: 'pages/basic/QRCodePage'
  },

  {
    name: 'Marquee 跑马灯',
    address: 'pages/basic/MarqueePage'
  },

  {
    name: 'DataPanel 数据面板',
    address: 'pages/basic/DataPanelPage'
  },

  {
    name: 'Gauge 数据量规',
    address: 'pages/basic/GaugePage'
  },
]

export class InfoComItem {
  name: string = ''
  address: string = ''
}

export default infoCom