import { ICommon } from './Common';
import { IUser } from './User';
export interface INotification extends ICommon{
  title?: string;
  account: IUser;
  linkTo?: string;
  content: string;
}
