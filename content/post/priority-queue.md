---
title: "Priority Queue và những cách cài đặt"
slug: "priority-queue"
date: 2021-07-14T18:03:38+07:00
draft: false
categories:
- programming
tags:
- "data structures"
keywords:
- "queue"
- "java"
- "priority queue"
thumbnailImage: /thumbnails/priority-queue.png
thumbnailImagePosition: left
---

Hôm nay chúng ta cùng điểm qua một cấu trúc dữ liệu thuộc dòng họ nhà Queue có một tính chất khá đặc biệt - đẩy vào và lấy ra theo độ ưu tiên - chính là *Priority Queue*. Nó có rất nhiều ứng dụng, điển hình là trong [Thuật toán nén Huffman Coding]({{< ref "/post/huffman-coding-p2" >}}) mà mình từng đề cập. Trong bài này chúng ta sẽ đi qua một số cách cài đặt của Priority Queue.

<!--more-->

<!--toc-->

# 1. Ý tưởng và API

Có thể liên tưởng các thao tác trên `PriorityQueue` cũng giống như một Queue bình thường. Quan trọng nhất là việc tổ chức lưu trữ các phần tử và cài đặt các hành vi thỏa yêu cầu: *Phần tử ưu tiên nhất sẽ được lấy ra trước tiên*.

Về định nghĩa *ưu tiên*, có thể định nghĩa *giá trị lớn hơn là ưu tiên hơn* hoặc *giá trị nhỏ hơn là ưu tiên hơn*. Ví dụ như một giao dịch sẽ bao gồm người thực hiện, giá tiền và ngày thực hiện. Có thể định nghĩa *ngày thực hiện gần hiện tại hơn là ưu tiên hơn* hoặc ngược lại.

API của `PriorityQueue` có thể được định nghĩa như sau:

```
    public class PriorityQueue<T extends Comparable<T>>
------------------------------------------------------------
                 PriorityQueue(int maxSize)
            void enqueue(T t)
               T peek()
               T dequeue()
         boolean isEmpty()
             int size()
```

Các phương thức cơ bản như sau:

- *enqueue(T t)*: Thêm mới phần tử thuộc kiểu T.
- *peek()*: Lấy ra phần tử ưu tiên nhất. Trường hợp này giá trị lớn hơn thì ưu tiên hơn.
- *dequeue()*: Lấy và xóa phần tử ưu tiên nhất.
- *isEmpty()*: Kiểm tra queue có rỗng hay không.
- *size()*: Lấy kích thước queue.

# 2. Cài đặt

Phần này sẽ bàn về một số phương pháp cài đặt `PriorityQueue`.

## 2.1. Cơ bản

Với cách này, chúng ta sẽ dùng mảng, hoặc danh sách liên kết, và cài đặt hành vi của các phương thức để thỏa mãn yêu cầu của PriorityQueue. Để cài đặt PriorityQueue theo cách này, chúng ta có thể suy nghĩ theo 2 hướng:

- *Không sắp xếp trước (lazy approach)*: Với thao tác `enqueue()`, chỉ việc đơn giản là thêm mới một phần tử vào danh sách mà không cần làm gì thêm. Do đó, độ phức tạp của thao tác này là $O(1)$. Nhưng đối với thao tác `dequeue()`, chúng ta cần phải duyệt qua danh sách để tìm phần tử có độ ưu tiên cao nhất sau đó remove phần tử này khỏi danh sách nên độ phức tạp là $O(N)$.

- *Sắp xếp trước (eager approach)*: Ở hướng này, chúng ta sẽ sắp xếp danh sách mỗi khi thêm vào để cho thao tác lấy là ít tốn kém nhất. Mỗi khi thêm vào, chúng ta cần duyệt danh sách để thêm vào đúng vị trí đảm bảo danh sách luôn được sắp xếp. Do đó, độ phức tạp là $O(N)$. Khi lấy ra, chỉ đơn giản lấy ra phần tử đầu tiên của danh sách vì mặc nhiên nó có độ ưu tiên cao nhất. Chẳng hạn, nếu ta định nghĩa *lớn hơn là ưu tiên hơn*, thì danh sách sẽ được sắp xếp giảm dần. Mặc nhiên phần tử đầu tiên sẽ là phần tử lớn nhất. Do vậy nên độ phức tạp của thao tác này là $O(1)$.

Code dưới đây là ví dụ cho trường hợp sắp xếp trước với danh sách liên kết:

{{< tabbed-codeblock BasicPriorityQueue>}}
<!-- tab java -->
public class BasicPriorityQueue<T extends Comparable<T>> {
    private LinkedList<T> list;
    public BasicPriorityQueue() { list = new LinkedList<>(); }
    public void enqueue(T t) {
        ListIterator<T> it = list.listIterator();
        while (it.hasNext()) {
            if (it.next().compareTo(t) < 0) {
                it.previous();
                break;
            }
        }
        it.add(t);
    }
    public T peek() { return list.getFirst(); }
    public T dequeue() {
        T result = peek();
        list.removeFirst();
        return result;
    }
    public boolean isEmpty() { return size() == 0; }
    public int size() { return list.size(); }
    public String toString() { return list.toString(); }

    public static void main(String[] args) {
        BasicPriorityQueue<Integer> q = new BasicPriorityQueue<>();
        q.enqueue(4);
        q.enqueue(5);
        q.enqueue(7);
        q.enqueue(3);
        q.enqueue(1);
        q.enqueue(2);
        System.out.println(q);
        q.dequeue();
        q.dequeue();
        System.out.println(q);
        q.enqueue(7);
        System.out.println(q);
    }
}
<!-- endtab -->
{{< /tabbed-codeblock >}}

Phương pháp cơ bản sẽ hiệu quả đối với số lượng nhỏ các phần tử. Cả 2 hướng trên đều có thao tác có độ phức tạp *linear*. Trong thực tế, để đảm bảo hiệu năng người ta sẽ dùng Heap có độ phức tạp *logarit* cho cả 2 thao tác trên sẽ đảm bảo hiệu năng hơn.

## 2.2. Sử dụng Heap

Trong phương pháp này, chúng ta dùng một mảng đảm bảo tính chất của *Heap* để lưu trữ các phần tử. Các bạn có thể tham khảo ở bài viết: [Heap và một số ghi chú]({{< ref "/post/heap-note" >}}).

<b>*Thao tác thêm mới*</b> sẽ thêm một phần tử vào cuối mảng. Hãy tưởng tượng mảng Heap đang được biểu diễn dưới dạng cây nhị phân. Khi thêm mới vào cuối có nghĩa là sẽ thêm vào nút lá. Và nút lá này có thể vi phạm tính chất của Heap. Vậy nên chúng ta sẽ *hiệu chỉnh Heap* theo chiến lược *Bottom-Up*, nghĩa là điều chỉnh từ dưới lên.

{{< image classes="fancybox center" thumbnail-width="70%" src="/images/post/priority-queue/1.svg" title="Ví dụ về việc thêm phần tử 12 vào Heap, sau đó hiệu chỉnh theo chiến lược Bottom-up">}}

Với <b>*thao tác loại bỏ*</b>, phần tử được loại bỏ chắc chắn sẽ là phần tử đầu tiên. Để loại bỏ phần tử này, ta sẽ tráo nó với phần tử ở cuối mảng rồi loại bỏ phần tử cuối này. Lúc này nút gốc sẽ vi phạm tính chất của Heap. Do đó, chúng ta sẽ *hiệu chỉnh Heap* theo chiến lược *Top-down*, nghĩa là điều chỉnh từ trên xuống.

{{< image classes="fancybox center" thumbnail-width="70%" src="/images/post/priority-queue/2.svg" title="Ví dụ về việc xóa phần tử 15, tráo với phần tử cuối sau đó hiệu chỉnh theo chiến lược Top-down">}}


Code minh họa cho `PriorityQueue` sử dụng Heap.

{{< tabbed-codeblock PriorityQueue>}}
<!-- tab java -->
public class PriorityQueue<T extends Comparable<T>> {
    private T[] arr;
    private int size = 0;
    public PriorityQueue(int maxSize) { arr = (T[]) new Comparable[maxSize]; }
    public void enqueue(T t) {
        arr[size++] = t;
        swim(size - 1);
    }
    public T peek() { return arr[0]; }
    public T dequeue() {
        T result = arr[0];
        swap(0, size-1);
        size--;
        arr[size+1] = null;
        sink(size, 0);
        return result;
    }
    public boolean isEmpty() { return size == 0; }
    public int size() { return size; }

    public void swim(int i);
    public void swap(int i, int j);
    private void sink(int n, int i);
}
<!-- endtab -->
{{< /tabbed-codeblock >}}

Riêng hàm `swim()`, `swap()`, và `sink()` các bạn có thể xem lại bài viết [Heap và một số ghi chú]({{< ref "/post/heap-note" >}}) nhé.

# References

- [Algorithms, 4th Edition by Robert Sedgewick and Kevin Wayne](https://algs4.cs.princeton.edu/home/)


