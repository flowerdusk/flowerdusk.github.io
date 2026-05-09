---
layout: post
title: Strategy Pattern
date: 2026-05-06
---

# Strategy Pattern

策略模式的原理是：定义一系列算法接口，将每个算法封装到独立类中，并让它们可以相互替换，从而使算法变化独立于使用算法的客户端。

---
1.  策略接口
```Java
interface PayStrategy {
    void pay(int amount);
}
```
2.  具体策略类
```Java
class Alipay implements PayStrategy {
    public void pay(int amount) {
        System.out.println("使用支付宝支付：" + amount + "元");
    }
}
class WechatPay implements PayStrategy {
    public void pay(int amount) {
        System.out.println("使用微信支付：" + amount + "元");
    }
}
```
3.  上下文（订单）
```Java
class Order {
    private PayStrategy strategy;

    public void setStrategy(PayStrategy strategy) {
        this.strategy = strategy;
    }

    public void checkout(int amount) {
        strategy.pay(amount);
    }
}
```
4.  使用
```Java
public class Main {
    public static void main(String[] args) {
        Order order = new Order();

        order.setStrategy(new Alipay());
        order.checkout(100);   // 使用支付宝支付：100元

        order.setStrategy(new WechatPay());
        order.checkout(50);    // 使用微信支付：50元
    }
}
```
---
详细介绍上下文类：

* 具体来说，PayStrategy 是一个接口，而 WechatPay 和 Alipay 都实现了这个接口。因此是一个”关系：WechatPay 对象可以被视为 PayStrategy 类型的一种。在面向对象编程中，子类对象可以赋值给父类类型（或接口类型）的变量。

* 简单类比：
PayStrategy 就像一个“支付许可证”，WechatPay 和 Alipay 是持有该许可证的具体设备。当你把一张微信支付设备贴到“支付接口”上时，系统只管通过标准接口读取，实际扣款的是微信设备。

**所以这行代码能成立的根本原因是：**
```Java
PayStrategy strategy = new WechatPay(); // 多态：接口引用指向实现类对象
```