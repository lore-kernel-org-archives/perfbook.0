Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:46560 "EHLO
 mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1754831AbaJINr7 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 9
 Oct 2014 09:47:59 -0400
Received: by mail-oi0-f53.google.com with SMTP id v63so2841272oia.40 for
 <perfbook@vger.kernel.org>; Thu, 09 Oct 2014 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=BN4abJJVkiQdF2qcxoy4gzjHT+U6jov/fwvpuJ9ZcfQ=;
 b=GHDAQVgKDXaXIGahQd3KBFK+etAevbxUn14dGKqN5zWEiZpLEk/ATpr0bh7Lzb/HiC
 GOKYsMUJLP78eDN19Ovpu0KTyJs/s0YOqfu02a5o7sFIdaqo5QfXl3hgA4YMAfmIpPQt
 bzOGCmevB3EsTbP0BMubZoHXt7pdaQLM0dkyeP2K3xYk69IOrVXFpzG0OyGbk7ADr0C2
 wbjd/SfqjcfyyNxSktkH3xUrSL1SNVSjkEzdOSpzbMwuCobl9YxfqSFLFCDHrHqmQ3Hk
 LD7CIuhYbT/hmeBpLTpwWBIkmzgY0yuyfw7aep5xBBz8JTvRh5c6H3uMkPjKOW6g0rZS
 DcfA==
MIME-Version: 1.0
Date: Thu, 9 Oct 2014 22:47:56 +0900
Message-ID: 
 <CAGfuzXRMegrY3xdfmr7nDE=DQ1O64GdNZvrxoq6JyEFfz6Eynw@mail.gmail.com>
Subject: Typos in perfbook section 5.6 and table 9.7
From: Motohiro Kanda <kanda.motohiro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

I enjoy the book so much and am making a Japanese translation here.
https://sites.google.com/site/kandamotohiro/perfbook

I think I have found 2 typos in perfbook. Latest git repo also has these bugs.

5.6 Parallel Counting Discussion
on page 82, in file count.tex says,

"The per-thread
variable implementation (count_stat.c) is significantly faster on updates than
the array-based implementation (count_end.c), but is slower at reads"

But it should read

per-thread variable implementation(count_end.c)
and
array-based implementation (count_stat.c)

And according to table 5.1,
array-based implementation has 408 ns vs.
per-thread variable implementation has 389 ns.

so, per-thread variable implementation is a little faster, not slower
at 1 core read.



Table 9.7  Which Deferred Technique to Choose?
on page 228 in file whichtochoose.tex says,

Sequence Locks has "Y" on Updates and Readers Progress Concurrently

But it should be N because on page 229, it says

sequence locking does not permit updates and readers to make forward
progress concurrently

--
Kanda Motohiro
