import { ICommon } from './Common';
import { IUser } from './User';
export interface IPost extends ICommon{
  tag: any;
  title?: string;
  slug: string;
  summary?: string;
  publishDate: string;
  isDraft: boolean;
  category: {
    id: number,
    title: string
  };
  content: string;
  readTime: number;
}
