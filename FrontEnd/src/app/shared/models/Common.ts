export interface ICommon {
  id?: number,
  isActive?: boolean,
  created?: any,
  createdBy?: IPeople | string,
  modified?: any,
  modifiedBy?: IPeople | string
}

export interface IPeople {
  id: number,
  account: string
}
