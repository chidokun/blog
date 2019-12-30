---
title: "Những điều thú vị của số nhị phân"
slug: useful-things-of-binary-numbers
date: 2020-01-4T18:00:00+07:00
categories:
- programming
keywords:
- programming
- nhị phân
- binary
- phép toán trên bit
tags:
- programming
comments: true
draft: false
thumbnailImage: /thumbnails/binary-number.png
thumbnailImagePosition: left
---

Xin giới thiệu đến các bạn một số điều hữu ích về số nhị phân mà mình đã từng đọc trong cuốn *Write Great Code - Volume 1. Understanding the Machine* của tác giả *Randall Hyde*. Đây cũng là một quyển sách khá hay mà các bạn có thể đọc để trau dồi thêm kiến thức.

<!--more-->

<!--toc-->

# 1. Hệ nhị phân

Trước hết, cùng điểm qua một số quy tắc của số nhị phân nhé!

Một số trong có thể được biểu diễn trong hệ nhị phân bằng 2 chữ số 0 và 1 (thay vì 10 chữ số từ 0 đến 9 đối với hệ thập phân).

Bit

Chuỗi bit



# 2. Những đặc trưng thú vị

1. Nếu bit 0 của số nhị phân (số nguyên) là 1 thì số đó là số lẻ, ngược lại, nếu là 0 thì là số chẵn.

2. If the LO n bits of a binary number all contain zero, then the number is
evenly divisible by 2^n .
Nếu n bit LO toàn chứa 0, thì số đó có thể chia hết cho 2^n

3. If a binary value contains a one in bit position n, and zeros everywhere else, then that number is equal to 2 .
Nếu số nhị phân có bit thứ n là 1, còn lại là 0 thì số đó = 2^n.

4. If a binary value contains all ones from bit position zero up to (but not including) bit position n, and all other bits are zero, then that value is equal to 2n−1.
nếu số nhị phân chỉ chứa toàn số 1 từ vị trí 0 đến vị trí n -1, và các bit còn lại là 0, thì số đó = 2^n -1.

5. Shifting all the bits in a number to the left by one position multiplies the
binary value by two.
Dịch trái 1 bit toàn bộ các bit trong số nhị phân sẽ tương đương với phép nhân với 2.

6. Shifting all the bits of an unsigned binary number to the right by one position effectively divides that number by two (this does not apply to signed integer values). Odd numbers are rounded down.
Dịch phải 1 bit của số nhị phân không dấu tương đương với phép chia cho 2 (phần lẻ sẽ được làm tròn xuống). Không áp dụng với số nguyên có dấu.

7. Multiplying two n-bit binary values together may require as many as 2*n bits to hold the result.
Nhân 2 giá trị nhị phân n-bit có thể cần 2*n bit để lưu kết quả.

8. Adding or subtracting two n-bit binary values never requires more than n+1 bits to hold the result.
cộng hoặc trừ 2 số nhị phân n bit sẽ không cần quá n+1 bit để lưu

9. Inverting all the bits in a binary number (that is, changing all the zeros to ones and all the ones to zeros) is the same thing as negating (chang- ing the sign) of the value and then subtracting one from the result.


10. Incrementing (adding one to) the largest unsigned binary value for a given number of bits always produces a value of zero.


11. Decrementing (subtracting one from) zero always produces the largest unsigned binary value for a given number of bits.


12. An n-bit value provides 2n unique combinations of those bits.


13. The value 2n−1 contains n bits, each containing the value one.

# 3. Các phép toán thú vị

1. Kiểm tra 1 bit bên trong dãy bit dùng phép toán AND

2. Kiểm tra 1 tập bit có phải là 0 dùng phép toán AND

3. So sánh một tập bit bên trong chuỗi số nhị phân

4. Tạo bộ đếm phép chia dư dùng phép toán AND

