Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36463 "EHLO
 mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751493AbdHGQsK (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 7
 Aug 2017 12:48:10 -0400
Received: by mail-wm0-f53.google.com with SMTP id t201so11778814wmt.1 for
 <perfbook@vger.kernel.org>; Mon, 07 Aug 2017 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=KLJui1mDIV2EELIMrKePo/hqyMFIzAKqKOZClfNMLNc=;
 b=Iv5c9038lp+MU4JyRZO8rrr4p9j8qXkH8KcpWm9sMCq0dX4nI7W+eFkbHXgJp20BD6
 sq23/MsETsaN3ziiBvGgHYs/8mZOvGY8B5mN8qXtV8YtdbUSewYgdsLblT0HlIHVwBE1
 ZAFWCcjHAT4EIXv7ThLrdpFGPJ8pqLQ38WD+iE8sqUDPN/tAZkNtyq0Zrw4MC67W2jRL
 FXOeVyYrra/4iBhDCN0XxEd502TvXGdum9mryAB6yaG0xzX76OTmg6BIzogbqrHBut+a
 gZojc1qC8FU1WHK18j8juDAmTRlapLrbDv2ARVICqFP6HHnpaTUsm8DzsQeUX+3gpc3Z
 r/QQ==
MIME-Version: 1.0
In-Reply-To: 
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
 <20170804195049.GF3730@linux.vnet.ibm.com>
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Tue, 8 Aug 2017 00:48:08 +0800
Message-ID: 
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
Subject: Re: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org

2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
>>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>>> > Hi,
>>> > I am sure the subject explain my intention. I got two processes trying
>>> > to modifying the same place. I want them to do it one after one, or,
>>> > if their operations interleave, I would like to let them know that the
>>> > content have been changed and polluted by the other so that the
>>> > content should be given up. That is, I would rather give up the data,
>>> > if polluted, than having a false one.
>>> >
>>> > I try to set a atomic ref counter, but it seems impossible to do that
>>> > without a lock to synchronize.
>>> >
>>> > Note that I don't want a strict synchronization: the situation is a
>>> > lot better. The data can be given up if that place has been polluted.
>>>
>>> Let's explain some of my reasoning: if process A use some flag to
>>> indicate that it has entered the critical region, then if it crash
>>> before it can reset the flag, all following processes cannot enter
>>> that region. But if process A cannot use flag for indication, how to
>>> other people know (how to synchronization)?
>>
>> The simplest approach is to guard the data with a lock.
>
> Indeed. But if a process get killed then it will have no chance to release
> the lock...
>
> By the way, do you know whether there are any chances that a thread get
> killed by another thread when doing some "small" things? I mean something
> like this:
>
>     lock();
>     some_mem_copying();
>     unlock();
>
> Are there any chance that a thread get killed by another thread before it
> can "unlock()", without the entire process going down?

pthread_mutexattr_setrobust(..) will help in this situation, although it is
quite painful that nobody is maintaining the NPTL docs currently and you have
to dive into the source code if you want to make sure the semantic is exactly
what you want.

Yubin

>> But if you don't want to do that, another approach is to restrict the
>> data to one machine word minus one bit, with zero saying that the location
>> is (as you say) unpolluted.  Then you can use a compare-and-swap loop
>> to update the location only if it is unpolluted.
>>
>> But maybe you need more data.  If so, you can have the data separately
>> (perhaps dynamically allocated, perhaps not, your choice), and then use
>> the compare-and-swap method above where NULL says unpolluted.
>
> Good suggestion... although I think it would be pretty painful.
>
> Thanks,
> Yubin
