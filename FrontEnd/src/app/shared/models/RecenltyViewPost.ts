import { ICommon } from './Common';
import { IUser } from './User';
export interface IReasonReport extends ICommon{
  account: IUser,
  readTime: number,
  lastestPosition: number,
}
