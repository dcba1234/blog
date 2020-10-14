
import { ICommon } from './Common';
import { ICountry } from './Country';
import { IGender } from './Gender';

export interface IUser extends ICommon{
  account?: string;
  firstName?: string;
  lastName?: string;
  email?: string;
  password?: string;
  telephone?: string;
  dateOfBirth?: string;
  introduce?: string;
  avatar?: string;
  role?: string;
  country?: ICountry;
  gender?: IGender;
  lastLogin?: string;
}
