import { ICommon } from './Common';
import { ISettingPage } from './SettingPage';
import { IUser } from './User';
export interface ISettingElement extends ICommon{
  title?: string,
  selector?: string,
  postProperty?: number,
  settingPageId?: number,
  order?: number,
  settingPage?: ISettingPage
}


export type PostProperty = 'Title' | 'Summary' | 'Content' | 'Tag' | 'Category' | ''