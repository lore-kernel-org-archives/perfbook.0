Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=aEw4jBBSfLQO0E43t3vyAHIlDQeGKEQ/WDDnkNe8RGc=;
 b=RTHQjl2cg0ilcEOK5k/EH1q0DUYfel69GYE1yNc2AGSuOK9z/YvVGSi3xD9vu9KRYx
 hTqTrgwt8T47TA1pZyzDmoxoQg16ukjpuVIm8SlFvCHAiJ6vjkUIWYYzdKQ6kM79TrNz
 DCbptGlA59fLf6i5UxFwkcjJ1HmU/z3RMg7S+6PeSMyei7rAFx+cqaf4nGXXQiEDOoZZ
 jPmngAGX6woNmu1ovX8pJI7LNFEO7GLLKetQvPy11V7RuBnZnEA9voPRRhmrCNGzcmHg
 Ny9yQztmlYToNRxMXyhFRmQfwn0sDng01kNz71bAhvIRAecd8k5usRnJRURCxLNNGUSE
 /GjQ==
MIME-Version: 1.0
In-Reply-To: <20170608033822.GV3721@linux.vnet.ibm.com>
References: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
 <20170608033822.GV3721@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Thu, 8 Jun 2017 12:30:40 +0800
Message-ID: 
 <CABoNC80csm417TWs9MMvLA1kmjm5438kJ02-zts8vtDLyoTktA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Patches to chapter Deferred Processing
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Thu, Jun 8, 2017 at 11:38 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, Jun 08, 2017 at 11:16:31AM +0800, Junchang Wang wrote:
>> Hi Paul and list,
>>
>> Attached are two patches for routetorture.h. Please take a look.
>
> Good catches, queued and pushed, thank you!
>
>> One of my remaining question is about the two smp_mb() in routetorture.h. Take
>> the smp_mb() in perftest() as example, my understanding is that it is used to
>> prevent the access to nthreads_running and access to goflag from being
>> reorganized. If that's the case, don't we need a paired memory barrier
>> instruction in perftest_reader()? Specifically, in between line 105
>> (atomic_inc(&nthreads_running);) and line 106 (gf = READ_ONCE(goflag);).
>
> This one is unusual.  The ordering controls not correctness, but
> time duration.  Plus the assignment of GOFLAG_RUN to goflag cannot
> happen until after the effect of the atomic_inc() propagates back.
> Interestingly enough, this code does fully not take control dependencies
> into account, which could reduce the number of memory barriers.
>
> In short, this situation is unusual and makes complex reliance on
> implicit ordering guarantees.

Thanks for the reply. You are right, this is a special case in which
the first shared data has been protected by primitive atomic_read(),
such that the smp_mb() is not necessary.

>
> But it might well have bugs.  If you have time, one
> approach would be to read https://lwn.net/Articles/718628/ and
> https://lwn.net/Articles/720550/, download the tool described, and try
> to create the corresponding litmus test.  Either way, please let me know
> your intentions.  This would be a really cool way for you to learn the
> latest and greatest stuff about the Linux kernel memory model!
>

I'm currently very interested in parallel programming, but I find, in
practice, there are too much ``insane'' hardware/compiler/library
details. I'm becoming more and more hesitate to say my code is correct
even if it can run correctly on a specific hardware for 100 times :-(
.  So I would be very happy to read the articles you pointed out and
try the tool.

>> Another puzzle is that we are using shared memory 'pap' to transfer statistic
>> results from working threads, e.g. perftest_reader, to main thread, e.g.
>> perftest. Do we need a smp_mb() at the tail (before instruction return) of
>> function perftest_reader to force the results being written before the thread
>> terminates? In other words, I'm not sure if the two events, writing to shared
>> memory pap and thread termination, could be reordered.  Hints are welcome!
>
> The pthread_create() system call guarantees that the child will see
> all of the parent's memory accesses that precede the pthread_create().
> Similarly, the pthread_join() system call guarantees that the parent's
> accesses following the pthread_join() will see all of the (now terminated)
> child's accesses.
>

Got it. Thanks a lot!

--Jason


>                                                         Thanx, Paul
>
>> Thanks,
>> --Jason
>>
>> Junchang Wang (2):
>>   Fix typos in help messages
>>   routetorture.h: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
>>
>>  CodeSamples/defer/routetorture.h | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> --
>> 2.7.4
>>
>

