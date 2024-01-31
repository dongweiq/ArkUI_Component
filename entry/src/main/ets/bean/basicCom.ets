import { NameAddressObj } from './NameAddressObj'

const basicCom: Array<NameAddressObj> = [
  {
    name: 'Button 按钮',
    address: 'pages/basic/ButtonPage'
  },

  {
    name: 'Text 文本',
    address: 'pages/basic/TextPage'
  },

  {
    name: 'Divider 分隔器',
    address: 'pages/basic/DividerPage'
  },
]

export class BasicComItem {
  name: string = ''
  address: string = ''
}

export default basicCom