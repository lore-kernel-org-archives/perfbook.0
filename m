Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KHvgD032KSJrSf+0dWNLoMG6aooo0vAoYUx2lpZNIo4=;
        b=awiUkvN9E3ScFfKR37R6P5TYI74QGzKegMXwXAKpfweFSAxKFqSobtfj+43NHH2mFA
         KyZ55dq42IlpZRiazXUqG/X/d85+af8WQe/T37MaEz3CpTNC3V/czaB3We73PReT85Rq
         m1VzApUh7ef5tZnMNuK2uc1039F7ePg90oZu43VlzGYYxdORioe+OFYDqsRyv9C43AOD
         SYiRKd3+NpVoc21UuR3HtA6zeKs0wLXKayAoWZXI7e64obfu0yb3cvblppfXO5xCB64O
         G6zRaOGBVh517vq0NGagAfZ1PnYQ1/gXz0gb5Kx/Rr2I62dmbAB+L2GHdeJERCadQiR4
         Hxsw==
Subject: Re: lockless_dereference() in perfbook
References: <04a39364-9f34-16e6-fb01-4ac85a50fb6f@gmail.com>
 <20181201183019.GV4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1bb21303-4d09-a222-e50e-653e4ac22f09@gmail.com>
Date: Sun, 2 Dec 2018 07:25:21 +0900
MIME-Version: 1.0
In-Reply-To: <20181201183019.GV4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/01 10:30:19 -0800, Paul E. McKenney wrote:
> On Sat, Dec 01, 2018 at 04:48:03PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> As LKMM dropped lockless_dereference() when it was merged in v4.17,
>> CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus fails to
>> be evaluated by "make run-herd7" under CodeSamples/formal/herd.
>>
>> lockless_dereference() is still covered by CodeSamples/formal/litmus/api.h
>> and klitmus7, so the test can be evaluated by litmus7 and "klitmus7 at the
>> moment.
>>
>> In commit 48ec12dac0c3 ("memorder: Update based on v4.15 Linux kernel
>> de-Alpha-ication"), you added a footnote in Section 15.2.3 saying:
>>
>>     Note that lockless_dereference() is not needed on v4.15 and later,
>>     and therefore is not available in these later Linux kernels.
>>
>> There remain several lockless_dereference()s in perfbook without any
>> updates.
>>
>> In the Answer to Quick Quiz 15.15, lockless_dereference() is mentioned
>> several times.
>>
>> Quick Quiz 15.17 says:
>>
>>     Why doesn't line 18 of Listing 15.12 need a lockless_dereference()?
>>
>> Leading paragraph of Section 15.3.2.1 says:
>>
>>     The load that heads your dependency chain must use proper ordering,
>>     for example, lockless_dereference(), rcu_dereference(), or a READ_ONCE()
>>     followed by smp_read_barrier_depends().
>>
>> In the middle of Section 15.5, there is a sentence:
>>
>>     Note also that a dependency leading to a load must be headed by a
>>     lockless_dereference() or an rcu_dereference(): READ_ONCE() is not
>>     sufficient.
>>
>> Could you look into them?
>>
>> One problem in regard to litmus tests might be that there is no means
>> to indicate plain accesses with no memory barrier in current LKMM.
>> At the moment, C-MP+o-wmb-o+o-addr-o.litmus behaves identically as
>> C-MP+o-wmb-o+ld-addr-o.litmus would do.
> 
> Good catches!  How about the following?
> 
> 1.	I remove CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus.
> 
> 2.	I add a comment to the lockless_dereference() call in
> 	lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test
> 	stating that this API member is obsolete.
> 
> 3.	I remove the (\path{C-MP+o-wmb-o+ld-addr-o.litmus}) from the
> 	discussion.  I also add a LaTeX comment stating which commit
> 	removed this file for future reference.
> 
> 4.	I remove lockless_dereference() from CodeSamples/formal/litmus/api.h.
> 
> Does that sound reasonable?

Yes, it does!

Maybe discussion of
lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering)
needs further tweaks, including the update of its caption, i.e.,
it is now _ordered_. Quick Quiz 15.13 looks odd as of now.

And the caption to
lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test
also needs update to indicate it is not necessary any more.

Looking forward to seeing the update.

        Thanks, Akira

> 
> 							Thanx, Paul
> 

