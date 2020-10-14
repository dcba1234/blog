import { ICommon } from './Common';
export interface ICountry extends ICommon{
  title?: string;
  gmt?: number;
  code?: string;
}
