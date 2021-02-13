---
title: 选择排序
date: 2021-02-12 22:33:00
tags: 
  - 算法
  - C++
categories:
  - [Algorithm]
  - [C++]
excerpt: 每次从剩余数组中找最小的数，然后与剩余数组第一个位置的数交换位置
---

## 排序过程

假如对如下数组排序

![image-20210212212637607](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212212637607_2021_02_12_21_26_37.png)

我们打算从小到大排序

### 第一轮

先找到数组中最小的，是1

![image-20210212212805249](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212212805249_2021_02_12_21_28_05.png)

然后将1和数组中第一个位置上的数交换，这样，1就是最终的位置了

![image-20210212212837283](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212212837283_2021_02_12_21_28_37.png)

### 第二轮

那么1排好了，我们从剩下的数里面找最小的数，是2

![image-20210212212905854](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212212905854_2021_02_12_21_29_06.png)

我们将2和第二个位置上的数交换位置

![image-20210212213045447](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213045447_2021_02_12_21_30_45.png)

此时，1和2都已经固定好了位置

![image-20210212213108930](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213108930_2021_02_12_21_31_09.png)

### 第三轮

再从第三个位置往后找最小的数，然后与第三个位置上的数交换位置

![image-20210212213214529](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213214529_2021_02_12_21_32_14.png)

![image-20210212213226904](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213226904_2021_02_12_21_32_27.png)

依此类推，找到数组末尾就排好序了

### 第四轮

![image-20210212213300337](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213300337_2021_02_12_21_33_00.png)

![image-20210212213317201](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213317201_2021_02_12_21_33_17.png)

### 第五轮

![image-20210212213342282](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213342282_2021_02_12_21_33_42.png)

![image-20210212213355567](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213355567_2021_02_12_21_33_55.png)

### 第六轮

![image-20210212213442090](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213442090_2021_02_12_21_34_42.png)

![image-20210212213453305](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213453305_2021_02_12_21_34_53.png)

### 第七轮

![image-20210212213512606](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213512606_2021_02_12_21_35_12.png)

### 第八轮

![image-20210212213535214](https://gitee.com/jinxin.70/oss/raw/master/uPic/image-20210212213535214_2021_02_12_21_35_35.png)

## C++实现

```c++
#include <iostream>

using namespace std;
/**
 * 选择排序
 * @param arr
 * @param n
 */
void selectionSort(int arr[], int n){
    for (int i = 0; i < n; ++i) {
        //寻找[1,n)区间里的最小值
        int minIndex = i;
        for (int j = i + 1; j < n; ++j) {
            if(arr[j] < arr[minIndex]){
                minIndex = j;
            }
        }
        swap(arr[i], arr[minIndex]);
    }
}

int main(){
    int a[10] = {10,9,8,7,6,5,4,3,2,1};
    selectionSort(a, 10);

    for (int i = 0; i < 10; ++i) {
        cout<<a[i]<<" ";
    }
    cout<<endl;
    return 0;
}
```



## 使用模板（范型）编写算法

上面的实现，只能对int数组排序，我们需要对不同的类型排序，所以需要用到模板，有的语言叫范型。

**Student.h**

```c++

#ifndef ALGORITHMCPLUSPLUS_STUDENT_H
#define ALGORITHMCPLUSPLUS_STUDENT_H

#include <iostream>
#include <string>

using namespace std;

struct Student{
    string name;
    int score;

    // 重载小于运算法,定义Student之间的比较方式
    // 如果分数相等，则按照名字的字母序排序
    // 如果分数不等，则分数高的靠前
    bool operator<(const Student& otherStudent){
        return score != otherStudent.score ?
               score > otherStudent.score : name < otherStudent.name;
    }

    // 重载<<符号, 定义Student实例的打印输出方式
    // * 很多同学看到这里的C++语法, 头就大了, 甚至还有同学表示要重新学习C++语言
    // * 对于这个课程, 大可不必。C++语言并不是这个课程的重点,
    // * 大家也完全可以使用自己的方式书写代码, 最终只要能够打印出结果就好了, 比如设置一个成员函数, 叫做show()...
    // * 推荐大家阅读我在问答区向大家分享的一个学习心得: 【学习心得分享】请大家抓大放小，不要纠结于C++语言的语法细节
    // * 链接: http://coding.imooc.com/learn/questiondetail/4100.html
    friend ostream& operator<<(ostream &os, const Student &student){

        os<<"Student: "<<student.name<<" "<<student.score<<endl;
        return os;
    }
};

#endif //ALGORITHMCPLUSPLUS_STUDENT_H
```

**main.cpp**

```c++
#include <iostream>

using namespace std;
#include "Student.h"
template<typename T>
/**
 * 选择排序
 * @param arr
 * @param n
 */
void selectionSort(T arr[], int n){
    for (int i = 0; i < n; ++i) {
        //寻找[1,n)区间里的最小值
        int minIndex = i;
        for (int j = i + 1; j < n; ++j) {
            if(arr[j] < arr[minIndex]){
                minIndex = j;
            }
        }
        swap(arr[i], arr[minIndex]);
    }
}

int main(){
    int a[10] = {10,9,8,7,6,5,4,3,2,1};
    selectionSort(a, 10);

    for (int i = 0; i < 10; ++i) {
        cout<<a[i]<<" ";
    }
    cout<<endl;

    float b[4] = {4.4,3.3,2.2,1.1};
    selectionSort(b, 4);
    for (int i = 0; i < 4; ++i) {
        cout<<b[i]<< " ";
    }
    cout<<endl;

    string c[4] = {"D","C","B","A"};
    selectionSort(c,4);
    for( int i = 0 ; i < 4 ; i ++ )
        cout<<c[i]<<" ";
    cout<<endl;

    Student d[4] = { {"D",90} , {"C",100} , {"B",95} , {"A",95} };
    selectionSort(d,4);
    for( int i = 0 ; i < 4 ; i ++ )
        cout<<d[i];
    cout<<endl;
    return 0;
}
```

## 随机生成算法测试用例（选学）

思考🤔：

我们上面代码的测试用例是硬编码的，我们希望生成自动生成。

**SortTestHelper.h**

```c++
#ifndef ALGORITHMCPLUSPLUS_SORTTESTHELPER_H
#define ALGORITHMCPLUSPLUS_SORTTESTHELPER_H
#include <iostream>
#include <ctime>
#include <cassert>

using namespace std;

namespace SortTestHelper {
// 生成有n个元素的随机数组,每个元素的随机范围为[rangeL, rangeR]
    int *generateRandomArray(int n, int rangeL, int rangeR) {

        assert(rangeL <= rangeR);

        int *arr = new int[n];

        srand(time(NULL));
        for (int i = 0; i < n; i++)
            arr[i] = rand() % (rangeR - rangeL + 1) + rangeL;
        return arr;
    }

    // 打印arr数组的所有内容
    template<typename T>
    void printArray(T arr[], int n) {

        for (int i = 0; i < n; i++)
            cout << arr[i] << " ";
        cout << endl;

        return;
    }
  // 判断arr数组是否有序
    template<typename T>
    bool isSorted(T arr[], int n) {

        for (int i = 0; i < n - 1; i++)
            if (arr[i] > arr[i + 1])
                return false;

        return true;
    }

    // 测试sort排序算法排序arr数组所得到结果的正确性和算法运行时间
    // * 使用VS编码的同学, 对于函数指针的写法和调用方法可能和课程中介绍的有所不同;
    // * 并且不同版本的VS, 其具体语法可能也有差异, 这是因为VS的编译器不完全是按照C++的标准实现的;
    // * 本课程按照C++11的标准进行书写。对于VS编译器带来的语法差异, 希望同学们可以自己在网上查找相关资料解决;
    // * 大家也可以在课程的官方QQ群中交流
    // * 另外, 使用函数指针本身并不是这个课程的重点, 大家也完全可以使用自己的方式书写代码, 最终只要能够测试出自己书写的算法的效率即可
    // * 推荐大家阅读我在问答区向大家分享的一个学习心得: 【学习心得分享】请大家抓大放小，不要纠结于C++语言的语法细节
    // * 链接: http://coding.imooc.com/learn/questiondetail/4100.html
    template<typename T>
    void testSort(const string &sortName, void (*sort)(T[], int), T arr[], int n) {

        clock_t startTime = clock();
        sort(arr, n);
        clock_t endTime = clock();

        assert(isSorted(arr, n));
        cout << sortName << " : " << double(endTime - startTime) / CLOCKS_PER_SEC << " s" << endl;
//CLOCKS_PER_SEC表示每秒运行的时间周期数
        return;
    }
};
#endif //ALGORITHMCPLUSPLUS_SORTTESTHELPER_H
```

testSort函数的入参void (*sort)(T[], int)是对一个函数的声明，其中

- void 是返回值，表示返回void

- *sort是函数指针

- (T[], int)表示参数，T数组和int类型变量表示长度

并且在函数声明上方要对T进行声明，template<typename T>

**main.cpp**

```c++
#include <iostream>
#include "SortTestHelper.h"

using namespace std;

template<typename T>
void selectionSort(T arr[], int n){

    for(int i = 0 ; i < n ; i ++){

        int minIndex = i;
        for( int j = i + 1 ; j < n ; j ++ )
            if( arr[j] < arr[minIndex] )
                minIndex = j;

        swap( arr[i] , arr[minIndex] );
    }
}

int main() {

    // 测试排序算法辅助函数
    int N = 20000;
    int *arr = SortTestHelper::generateRandomArray(N,0,100000);
    selectionSort(arr,N);
    SortTestHelper::printArray(arr,N);
    delete[] arr;

    return 0;
}
```
