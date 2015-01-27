Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:61128 "EHLO
 mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751824AbbA0NhX (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 27
 Jan 2015 08:37:23 -0500
Received: by mail-oi0-f47.google.com with SMTP id a141so12361577oig.6 for
 <perfbook@vger.kernel.org>; Tue, 27 Jan 2015 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=eEcJ22WqCzTIyLktX0POd5OE75kj/SRNfeI2DZseN1Q=;
 b=TG/iZZ0N3/5wBJuLSJS46P0W87oTRBpze7jEm6RFY07AZl0iZvQfhvfo7BGCoXlaAl
 i1YfGp9nZ5rm+uvABTE0QudcgD3iJrat12jG0P1vyzxhxLZLSAuu17Jv5CW1QQDrPO9z
 KwuT96LGQJLGN3cIr/dpAi3pG3SVjgB1W+YSDrU/XMPjZwIdLkcuURC/l8+EsSxOZPYI
 0nHsTvC5R4aDmCTNisc9v73p4Ejy0/fMv2mIl+f+rnaciybYh4GaFWjL7nS9dspjvCH+
 zTZriNcdWZxQUYVmz9fxyAFHi98gPOvSEcvm9ivpr6fnERs49Ei+Q/X4fq2OLn9DLTfT
 5W1w==
MIME-Version: 1.0
Date: Tue, 27 Jan 2015 22:37:22 +0900
Message-ID: 
 <CAGfuzXQO4MLgXk=g3cSM+JoKxMSPXm+BpibATYCdXO2Ouo_S_Q@mail.gmail.com>
Subject: another typos in perfbook
From: Motohiro Kanda <kanda.motohiro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi, this might sounds too picky, but here are another typos in perfbook.

In Quick Quiz 4.24 on page 46, it says,
Linux-kernel equivalents to fork() and join()?
You mean
fork() and wait()?
Table 4.1 already has pthread join.


In Quick Quiz 5.60 on page 83 it says,
update-side signals over read-side atomic operations

And in Section 5.6 Parallel Counting Discussion, on page 82, paragraph
starting with
"Figure 5.2 shows", it says
penalty can be reduced by substituting read-side signals for
update-side atomic operations.

These looks odd, because signal and atomic operations are both on update-side.

add_count in Figure 5.18 has atomic_cmpxchg.
add_count in Figure 5.25 calls flush_local_count, which sends a
signal, wait until ready, and do the thieving.

So, they should read
update-side signals over atomic operations
and
update-side signals for atomic operations.


In section 5.4.1 Atomic Limit Counter Implementation, on page 69 says,
Otherwise, line 11 combines an updated counter
it should read
line 12


in Quick Quiz 5.43 on page 71, it says,
What prevents concurrent execution of the fastpath of either atomic_add() or
atomic_sub()

It should read add_count and sub_count.


In section 11.7.4 Microbenchmarking, on page 287, it says,
The first and third sources of interference provide conflicting advice
it should read
The first and 4-th sources

because 4th item suggests reducing the number of iterations.


In section 15.3 Shaving the Mandelbrot Set, on page 390, in the second
paragraph says,
The to-be-shaven solution is to unconditionally acquire the locks in list order
it should read
in any order
because third approach in the previous paragraph has already mentioned
"list order" and
the trick here is there are N threads and N+1 objects so no threads
will be starved, right?


Finally, in section 11.7.1 Benchmarking on page 285, it says
benchmarks serve three major purposes:
and you mention four.

You might say that the fourth one, "as a marketing tool" should not be
in "major purposes".
Or, you might be playing the "Spanish Inquisition" sketch :-)

By the way, Japanese translation of Chapter 2 and 5, including their
quick quiz answers
has been completed.Chapter 9 is 70% done.
I am not good at TeX publishing, so they are in plain text now.

Regards,
--
Kanda Motohiro at
https://sites.google.com/site/kandamotohiro/perfbook
