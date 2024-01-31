import { NameAddressObj } from './NameAddressObj'

const inputCom: Array<NameAddressObj> = [
  {
    name: 'TextInput 单行文本输入',
    address: 'pages/basic/TextInputPage'
  },

  {
    name: 'TextArea 多行文本输入',
    address: 'pages/basic/TextAreaPage'
  },

  {
    name: 'Toggle 开关',
    address: 'pages/basic/TogglePage'
  },

  {
    name: 'Slider 滑动条',
    address: 'pages/basic/SliderPage'
  },

  {
    name: 'Rating 评分',
    address: 'pages/basic/RatingPage'
  },

  {
    name: 'Select 下拉选择',
    address: 'pages/basic/SelectPage'
  },

  {
    name: 'TextPicker 选择文本',
    address: 'pages/basic/TextPickerPage'
  },

  {
    name: 'Radio 单选框',
    address: 'pages/basic/RadioPage'
  },

  {
    name: 'Checkbox 多选框',
    address: 'pages/basic/CheckboxPage'
  },

  {
    name: 'CheckboxGroup 多选框组',
    address: 'pages/basic/CheckboxGroupPage'
  },

  {
    name: 'DatePicker 日期选择',
    address: 'pages/basic/DatePickerPage'
  },

  {
    name: 'TimePicker 时间选择',
    address: 'pages/basic/TimePickerPage'
  },
]

export class InputComItem {
  name: string = ''
  address: string = ''
}

export default inputCom