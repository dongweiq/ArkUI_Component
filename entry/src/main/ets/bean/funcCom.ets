import { NameAddressObj } from './NameAddressObj'

const funcCom: Array<NameAddressObj> = [
  {
    name: 'Menu 菜单',
    address: 'pages/basic/MenuPage'
  },

  {
    name: 'Search 搜索框',
    address: 'pages/basic/SearchPage'
  },

  {
    name: 'TextClock 文本时钟',
    address: 'pages/basic/TextClockPage'
  },

  {
    name: 'TextTimer 计时器',
    address: 'pages/basic/TextTimerPage'
  },

  {
    name: 'Stepper 步骤导航器',
    address: 'pages/basic/StepperPage'
  },

  {
    name: 'PatternLock 密码锁',
    address: 'pages/basic/PatternLockPage'
  },
]


export class FuncComItem {
  name: string = ''
  address: string = ''
}

export default funcCom