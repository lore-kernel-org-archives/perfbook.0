Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:34486 "EHLO
 mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932430AbdBVNW7 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 22
 Feb 2017 08:22:59 -0500
Received: by mail-pg0-f50.google.com with SMTP id 1so1087383pgi.1 for
 <perfbook@vger.kernel.org>; Wed, 22 Feb 2017 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=qQiBIgA1TgUzlUnyuGr6PY8RfEm8ueTLApY8w2l6W0I=;
 b=MdwTnKu9WjLoPe2+3DgeazuwAVxK1SBgcam9knegFDGYdfeblkV3V6PTuboskK3UvL
 Lowt3ATI3ixLSVijMBWDXCL5xr+Jh5bG43Xm2glDkDFvEmxRyPvFwtjYCrEV+h7nCZOr
 tCaSY1jtos7+nIF9w26YLfYmwdyXMzJHeJg/VTcRzVI7XOmLATFEglkJFuEpaQNZ9Q0k
 zgtjsoWr+lYP/walfz+hvpJw6A7olshjw4lGvm5m+WRRcecjdZzDEqbtUF7E1YW+ukqa
 A/c8LV8i8p9HourYwaY6/ZVa41iWPqEuIqJUB120YVdJ8w2IKzgoKo/PBKdvDnfn7EOL
 skGw==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id l188sm3892806pfl.28.2017.02.22.05.22.55 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Wed, 22 Feb
 2017 05:22:57 -0800 (PST)
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [Question] Quick Quiz 5.17 and cache coherency
Message-ID: <18a02fa0-38f3-fa87-6d68-567b3e812e04@gmail.com>
Date: Wed, 22 Feb 2017 21:22:48 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,
I am reading chapter 5 and got confused by the answer to Quick Quiz
5.17. So this is an Array-Based Per-thread Eventually Consistent Counter
scheme:

1  DEFINE_PER_THREAD(unsigned long, counter);
2  unsigned long global_count;
3  int stopflag;
4
5  void inc_count(void)
6  {
7      ACCESS_ONCE(__get_thread_var(counter))++;
8  }
9
10 unsigned long read_count(void)
11 {
12     return ACCESS_ONCE(global_count);
13 }
14
15 void *eventual(void *arg)
16 {
17     int t;
18     int sum;
19     while (stopflag < 3) {
20         sum = 0;
21         for_each_thread(t)
22             sum += ACCESS_ONCE(per_thread(counter, t));
23         ACCESS_ONCE(global_count) = sum;
24         poll(NULL, 0, 1);
25         if (stopflag) {
26             smp_mb();
27             stopflag++;
28         }
29     }
30     return NULL;
31 }
32
33 void count_init(void)
34 {
35     thread_id_t tid;
36     if (pthread_create(&tid, NULL, eventual, NULL)) {
37         perror("count_init:pthread_create");
38         exit(-1);
39     }
40 }
41
42 void count_cleanup(void)
43 {
44     stopflag = 1;
45     while (stopflag < 3)
46         poll(NULL, 0, 1);
47     smp_mb();
48 }


I understand the code. In Quick Quiz 5.17, the question is:

    Why _doesn't_ the `inc_count()' in the code above need to use atomic
    instructions? After all, we now have multiple threads accessing the
    per-thread counters!

I think I know the answer to this question: now that you use per-thread
variable, you don't need atomic instructions. The scenarios where you
need atomic instructions are some places like this:

1 long counter = 0;
2 void inc_count(void)
3 {
4    counter++;  //need atomic instruction
5 }
6
7 long read_count(void)
8 {
9    return counter;
10}


But, the answer provided in the book is:

<------------------- Answer Begin ---------------------->
    Because one of the two threads only reads, and because
the variable is aligned and machine-sized, non-atomic instructions
suffice. That said, the ACCESS_ONCE() macro is used to prevent
compiler optimizations that might otherwise prevent the counter
updates from becoming visible to eventual() [Cor12].

    An older version of this algorithm did in fact use atomic
instructions, kudos to Ersoy Bayramoglu for pointing
out that they are in fact unnecessary. That said, atomic
                                      ~~~~~~~~~~~~~~~~~
instructions would be needed in cases where the per-thread
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
counter variables were smaller than the global global_count.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
However, note that on a 32-bit system, the per-thread counter
variables might need to be limited to 32 bits in order to sum
them accurately, but with a 64-bit global_count variable to avoid
overflow. In this case, it is necessary to zero the per-thread
counter variables periodically in order to avoid overflow. It is
extremely important to note that this zeroing cannot be delayed too long
or overflow of the smaller per-thread variables will result. This
approach therefore imposes real-time requirements on the underlying
system, and in turn must be used with extreme care.

    In contrast, if all variables are the same size, overflow
of any variable is harmless because the eventual sum will
be modulo the word size.
<------------------------ End -------------------------->

Although more complicated than I think, I totally fine with this answer,
except the sentence with ~~~ under it. Why is that? Why do we need
atomic instructions when counter variables were smaller than the global
`global_count' ? Also, the second sentence of the question seems to hint
about cache coherency, but I cannot see the point :(

regards,
Yubin Ruan
