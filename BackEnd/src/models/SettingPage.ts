import { ISettingElement } from './../../../FrontEnd/src/app/shared/models/SettingElement';
import { ICommon } from './Common';
import { ISettingWeb } from './SettingWeb';
import { IUser } from './User';
export interface ISettingPage extends ICommon{
  title?: string,
  url?: string,
  webId: number,
  web?: ISettingWeb,
  settingElement?: ISettingElement
  
}

