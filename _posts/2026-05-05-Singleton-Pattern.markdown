# 单例模式

通俗的解释就是：公司全部的人共用一个打印机。

代码示例:
* 最简单的单例模式（饿汉式）
```Java
// 打印机设计图纸
public class Printer {
    // 唯一的那台打印机（放在3楼打印室）
    private static Printer theOnlyPrinter = new Printer();
    
    // 打印室地址（私有，不能自己乱建打印室）
    private Printer() {}
    
    // 去打印室取打印机（全局访问点）
    public static Printer getInstance() {
        return theOnlyPrinter;
    }
    
    public void print(String doc) {
        System.out.println("打印：" + doc);
    }
}
```
* 使用方式:
```Java
// 员工使用
public class Employee {
    public void doWork() {
        // 张三去打印室取打印机
        Printer p1 = Printer.getInstance();
        p1.print("报告.pdf");
        
        // 李四也是去同一个打印室取同一台打印机
        Printer p2 = Printer.getInstance();
        // p1 和 p2 是同一台打印机
    }
}
```
---
## 类比对应关系

| 公司场景 | Java代码 | 
|:----:|:---:|
|  打印机的设计图纸 | 	Singleton 类 | 
| 唯一的那台打印机 | instance 实例 | 
| 3楼打印室（固定地点）| getInstance() 方法 |
| 所有员工 | 所有调用方 |
| 员工去打印室取打印机 | Singleton.getInstance() |