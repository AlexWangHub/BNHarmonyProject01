/**
 * 抽象类BasicDataSource，使用泛型T，实现接口IDataSource
 */

export abstract class BNBasicDataSource<T> implements IDataSource{
  // 监听器数组
  private listeners : Array<DataChangeListener> = new Array<DataChangeListener>();
  // 数据源，支持泛型的数组
  private dataSource : Array<T> = new Array<T>();

  // 构造函数，接收一个泛型数组作为参数，用于初始化数据源
  constructor(dataSource : Array<T>) {
    this.dataSource = dataSource;
  }

  // 返回数据源的个数
  totalCount(): number {
    return this.dataSource == null ? 0 : this.dataSource.length;
  }

  // 判断索引是否合法，如果非法就返回null
  getData(index: number) {
    return index >= 0 && index < this.totalCount() ? this.dataSource[index] : null;
  }

  // 添加数据
  addData(index: number, data: T) :void {
    // TODO : 要先判断元素是否已经在数据源中
    this.dataSource.splice(index,0,data);
    this.notifyDataAdd(index);
  }

  // 通知数据添加
  notifyDataAdd(index : number) : void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listeners.push(listener);
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let index = this.listeners.indexOf(listener);
    if (index !== -1) {
      this.listeners.splice(index, 1);
    }
  }

}