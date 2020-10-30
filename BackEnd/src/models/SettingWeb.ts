import { ICommon } from './Common';
import { IUser } from './User';
export interface ISettingWeb extends ICommon{
  tag: any;
  title: string,
  url?: string,
  note?: string,
  selectNode: SelectNode
}


export type SelectNode = 'PARTIAL' | 'ALL' 