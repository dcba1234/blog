import { ICommon } from './Common';
import { IUser } from './User';
export interface IComment extends ICommon{
  account?: IUser;
  post_slug: number;
  content?: string;
  parent_id: number;
}
