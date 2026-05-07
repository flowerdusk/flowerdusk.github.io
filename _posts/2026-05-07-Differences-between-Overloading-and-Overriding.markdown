# Differences between Overloading and Overriding
## 1.  重载（Overloading）
* 定义：同一个类中，多个方法方法名相同，但参数列表不同（参数个数、类型、顺序不同）。
* 特点：
  - 发生在同一个类中
  - 与返回类型、访问修饰符无关
  - 属于编译时多态（静态绑定）
```Java
public class Calculator {
    // 参数个数不同
    public int add(int a, int b) {
        return a + b;
    }
    
    public int add(int a, int b, int c) {
        return a + b + c;
    }
    
    // 参数类型不同
    public double add(double a, double b) {
        return a + b;
    }
    
    // 参数顺序不同
    public void print(int id, String name) {
        System.out.println(id + ": " + name);
    }
    
    public void print(String name, int id) {
        System.out.println(name + ": " + id);
    }
}
```

## 2.  重写（Overriding）
* 定义：子类对父类的非私有、非静态方法重新实现，方法签名（方法名、参数列表、返回类型）必须完全相同。
* 特点：
  - 发生在继承关系中
  - 方法名、参数列表、返回类型必须相同
  - 访问权限不能更低（可以更高）
  - 不能抛出更宽泛的异常
  - 属于运行时多态（动态绑定）
```Java
public class Animal {
    public void sound() {
        System.out.println("动物发出声音");
    }
    
    protected void eat() {
        System.out.println("动物吃东西");
    }
}

public class Dog extends Animal {
    @Override  // 推荐使用注解
    public void sound() {
        System.out.println("汪汪汪");
    }
    
    @Override
    public void eat() {  // 访问权限从protected提高到public
        System.out.println("狗啃骨头");
    }
}
```
---
## 常见误区
- 只有返回类型不同不是重载（编译错误）
- 静态方法不能被重写（但可以重新声明）
- private方法不能被重写
-  final方法不能被重写