import { ICommon } from './Common';
import { IUser } from './User';
export interface IPostInteraction extends ICommon{
  account?: IUser;
  postStatus: PostStatus;
  isReport?: boolean;
  reasonReport: {
    id: number,
    title: string
  };
  reasonReportOther: string;
}


export type PostStatus = 'like' | 'dislike' | 'none';