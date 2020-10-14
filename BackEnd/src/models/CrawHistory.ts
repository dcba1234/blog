import { ICommon } from './Common';
import { IUser } from './User';
export interface ICrawHistory {
  date?: string;
  account: IUser;
  settingPageId?: number;
  webData: string;
}
