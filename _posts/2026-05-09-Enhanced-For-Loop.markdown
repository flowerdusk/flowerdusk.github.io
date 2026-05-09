---
layout: post
title: Enhanced For Loop
date: 2026-05-09
---

# Enhanced For Loop

## 1.  基本语法
```java
// 语法格式
for (元素类型 变量名 : 数组或Iterable对象) {
    // 循环体
}
// 示例
int[] numbers = {1, 2, 3, 4, 5};
for (int num : numbers) {
    System.out.println(num);
}
```

## 2.  工作原理
* 遍历数组时：
```java
// 源代码
int[] arr = {1, 2, 3};
for (int num : arr) {
    System.out.println(num);
}
// 编译后等价于
int[] arr = {1, 2, 3};
for (int i = 0; i < arr.length; i++) {
    int num = arr[i];
    System.out.println(num);
}
```
* 遍历Iterable对象（如List、Set）时：
```java
// 源代码
List<String> list = Arrays.asList("A", "B", "C");
for (String s : list) {
    System.out.println(s);
}
// 编译后等价于
List<String> list = Arrays.asList("A", "B", "C");
for (Iterator<String> iterator = list.iterator(); iterator.hasNext();) {
    String s = iterator.next();
    System.out.println(s);
}
```

## 3. 使用示例
* 遍历数组
```java
// 一维数组
int[] arr = {1, 2, 3, 4, 5};
for (int num : arr) {
    System.out.print(num + " "); // 输出：1 2 3 4 5
}
// 二维数组
int[][] matrix = {{1, 2}, {3, 4}, {5, 6}};
for (int[] row : matrix) {
    for (int num : row) {
        System.out.print(num + " "); // 输出：1 2 3 4 5 6
    }
}
```

* 遍历Collection
```java
// List
List<String> names = new ArrayList<>();
names.add("Alice");
names.add("Bob");
names.add("Charlie");
for (String name : names) {
    System.out.println(name);
}
// Set
Set<Integer> scores = new HashSet<>();
scores.add(85);
scores.add(92);
scores.add(78);
for (int score : scores) {
    System.out.println(score);
}
// 自定义对象
List<Person> persons = getPersons();
for (Person p : persons) {
    System.out.println(p.getName() + ": " + p.getAge());
}
```

## 5. 限制和注意事项
**不能删除元素**
```java
List<String> list = new ArrayList<>(Arrays.asList("A", "B", "C"));
// ❌ 错误：会抛出ConcurrentModificationException
for (String s : list) {
    if (s.equals("B")) {
        list.remove(s); // 异常！
    }
}
// ✅ 正确：使用Iterator
Iterator<String> it = list.iterator();
while (it.hasNext()) {
    if (it.next().equals("B")) {
        it.remove(); // 安全删除
    }
}
// ✅ 正确：使用传统for循环（从后往前）
for (int i = list.size() - 1; i >= 0; i--) {
    if (list.get(i).equals("B")) {
        list.remove(i);
    }
}
```

## 6. 如何让自定义类支持增强for循环
1. 代码分析
```java
public class Sales implements Iterable<Order> {  // 实现Iterable接口
    private ArrayList<Order> orders;
    
    // 必须实现的方法：返回一个Iterator对象
    public Iterator<Order> iterator() {
        return orders.iterator();  // 直接返回ArrayList的Iterator
    }
}
```
关键点：
- Sales类实现了Iterable<Order>接口
- 实现了iterator()方法，返回Iterator<Order>对象
- 任何实现了Iterable接口的类，都可以使用增强for循环

2. 为什么能使用增强for循环？
```java
// 使用示例
Sales sales = new Sales();
sales.addOrder(new Order("001", 100.0));
sales.addOrder(new Order("002", 200.0));
sales.addOrder(new Order("003", 150.0));
// ✅ 可以使用增强for循环！
for (Order order : sales) {  // sales是Sales类型
    System.out.println(order);
}
```
编译过程（语法糖展开）：
```java
// 源代码
for (Order order : sales) {
    System.out.println(order);
}
// 编译后实际转换为
for (Iterator<Order> iterator = sales.iterator(); iterator.hasNext();) {
    Order order = iterator.next();
    System.out.println(order);
}
```

