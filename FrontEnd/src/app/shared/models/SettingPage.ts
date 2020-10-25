import { ICommon } from './Common';
import { ISettingElement } from './SettingElement';
import { ISettingWeb } from './SettingWeb';
import { IUser } from './User';
export interface ISettingPage extends ICommon {
  title?: string,
  url?: string,
  webId: number,
  web?: ISettingWeb,
  settingElement: ISettingElement
}

