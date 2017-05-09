Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35268 "EHLO
 mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752676AbdEIP2j (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 9
 May 2017 11:28:39 -0400
Received: by mail-oi0-f41.google.com with SMTP id l18so3808121oig.2 for
 <perfbook@vger.kernel.org>; Tue, 09 May 2017 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=VhMkC7B43C5XLNfvbeWjjdUDgviZd+UiFKmJnXqg9/4=;
 b=Ay37RWNb9kZ/EvdQKzBrHhErCfwM67u8+JL6JW4WDrMH5TZfxB2qIY8WZ6qZcyqEmz
 8GTbtYdCBN2cQzD8xTLbvZOI3Eq+KLdSryUZRe5bpvei8yDKXiFrjnv4/SfkQsaK9jEV
 CibfUpIO7hJr1yu1O5rKIQNvJKxSVaTbv6GXMOA8XRYA1UpXiTA0iFg2xrF5TBPT89sE
 5gXHEWVGiaz57Py7IslacKfm6u72f+oIBlNp4dZYXCOFXJeysbm/VRA1nfNsCgtuzpxJ
 rj9KFp5WIEdWwEaO9r7ku5SV1KGfVzm2C3HJOv9dd5j6Alt80jiVdCZUvhOF9BJ9Rsmu
 cGqA==
MIME-Version: 1.0
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 9 May 2017 23:28:37 +0800
Message-ID: 
 <CABoNC82ctHF6rJPRUg_R_g4kw3poik+tnX4V8K=0_UtBjKfszA@mail.gmail.com>
Subject: Question on Answer to Quick Quiz 5.16 (Absolute error of summing up
 per-thread counters)
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi list,

I'm reading the Answer to Quick Quiz 5.16, which is different to what
I expected. I embedded my puzzles and my solutions. Please help
verify.

>        In the worst case, the read operation completes immediately,
>        but is then delayed for $\Delta$ time units before returning,
>        in which case the worst-case error is simply $r \Delta$.
>
>        This worst-case behavior is rather unlikely, so let us instead
>        consider the case where the reads from each of the $N$
>        counters is spaced equally over the time period $\Delta$.
>        There will be $N+1$ intervals of duration $\frac{\Delta}{N+1}$
>        between the $N$ reads.

I don't understand why the number of intervals is $N+1$. My answer is
$N$. I used the following figure to try to understand:

In the figure, time clock increases from left to right.
Symbol "|" indicates the moment the reader starts reading a per-thread
counter, and subsequent spaces "_" indicate time slots the reader has
to wait to get the value of this counter, due to for example cache
miss. The last symbol "$" means the reader gets the value of the last
counter and will return accumulated sum immediately. So when we talk
about absolute error, we are talking about the miscounts happened in
between the first read ("|") and getting the value of last counter
("$"). In an extreme case (not real) where the reads run super fast
and the first read "|" and last "$" move together, then there is no
miscount anymore.

For each read operation, an interval follows. So the number of
intervals would be equal to the number of counters ($N$), which is
different to the answer in the book, $N+1$.

  |_______|________|________|________$
  (Assume the system has 4 counters, and
  each counter takes the reader 8 time slots (space) to get the value)



>        It is important to remember that error continues accumulating
>        as the caller executes code making use of the count returned
>        by the read operation.
>        For example, if the caller spends time $t$ executing some
>        computation based on the result of the returned count, the
>        worst-case error will have increased to $r \left(\Delta + t\right)$.
>
>        The expected error will have similarly increased to:
>
>        \begin{equation}
>                r \left( \frac{\Delta}{2} + t \right)
>        \end{equation}

It's hard for me to understand this part. Use my example figure again:

  |_______|________|________|________$ _ _ _ t _ _ _
  (Assume the system has 4 counters, and
  each counter takes the reader 8 time slots (space) to get the value)

The only difference compared to previous figure is the time slots of
$t$ appeared at the tail.
"The caller spends time $t$ executing some computation based on the
result of the returned count"
In other words, the reader returned at time slot "$", the same as the
previous figure, so does the absolute error. So the error would be
constant, no matter how long $t$ is.


>        All that aside, in most uses of statistical counters, the
>        error in the value returned by \co{read_count()} is
>        irrelevant.
>        This irrelevance is due to the fact that the time required
>        for \co{read_count()} to execute is normally extremely
>        small compared to the time interval between successive
>        calls to \co{read_count()}.

Can we use word "negligible" to replace "irrelevant"? :-) I think the
accuracy is not the stuff we don't want; it is something we have to
tradeoff against.
BTW, I'm still concerning about the absolute error may become too
large to be acceptable. For example, for some networks, packets arrive
for each 100 nanoseconds. In this scenario, counting error will happen
all the time.
The arguments in the book are convincing and I understand we can
ignore the counting error because it is in small ratio. I just curious
about are there any solutions or efforts to tackle this problem?
Thanks.


Regards,
--Jason
