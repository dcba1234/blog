import { ICommon } from './Common';
import { IUser } from './User';
export interface ITag extends ICommon{
  tag: string;
  postCount: number;
}

export interface IPostTag extends ICommon{
  postSlug: string;
  tag: ITag;
}