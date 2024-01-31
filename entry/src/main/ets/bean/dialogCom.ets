import { NameAddressObj } from './NameAddressObj'

const dialogCom: Array<NameAddressObj> = [
  { name: 'AlertDialog 警告弹窗',
    address: 'pages/dialog/AlertDialogPage' },

  { name: 'ActionSheet 列表选择弹窗',
    address: 'pages/dialog/ActionSheetPage' },

  { name: 'CustomDialog 自定义弹窗',
    address: 'pages/dialog/CustomDialogPage' },

  { name: 'DatePickerDialog 日期选择弹窗',
    address: 'pages/dialog/DatePickerDialogPage' },

  { name: 'TimePickerDialog 时间选择弹窗',
    address: 'pages/dialog/TimePickerDialogPage' },

  { name: 'TextPickerDialog 文本选择弹窗',
    address: 'pages/dialog/TextPickerDialogPage' },
]


export class DialogComItem {
  name: string = ''
  address: string = ''
}
export default dialogCom