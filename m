Return-Path: <SRS0=KEPj=E5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hD2S0uOxb1G0Dvb6hyvXH6YWQFnT7Lg/fXfVBou/1cI=;
        b=EctXttfz0w+4YoxDf4yuZvlor5bX+nlSKj/vnsZsWuOsMKd87/Z40UswCL7DvlBQFy
         gwMbVHYjzbmQu/4vO4QW7OfZq180Ej9DH3kClQ3wOWDf8LogCJ5l/7FUbTMOkHZG26px
         dbf6CNOWYYiIPphqxzp6pQD8P6q3kyytWzkIpmHlusFj8nmDo9YJVrvv5ppGjfRUcedL
         4C05e+4O+0EY2D0IPsTkzj5gLgQvJYMXnLJvl3VCoyxV8l0iF2HVm6DB1W+mI/rwusGG
         K4IF4SnAB2FNOa5VkNDlLqRk/XFXeEwSDYOWrfr5PWGE1yS835lzuZal3yhyA/t1M/tP
         pp4g==
Subject: Re: [NOT PULL YET -perfbook] PoC of adding index to perfbook
References: <29dc3825-3aa7-2e69-ddde-5de61f7015dc@gmail.com>
 <20201123210621.GD1437@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c6662e7c-3f07-bfd3-3fd8-100a8282784b@gmail.com>
Date: Tue, 24 Nov 2020 07:29:58 +0900
MIME-Version: 1.0
In-Reply-To: <20201123210621.GD1437@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 23 Nov 2020 13:15:42 -0800, Paul E. McKenney wrote:
> On Mon, Nov 23, 2020 at 12:14:05AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> So this *not-pull* request is to show you my WIP branch to add indices
>> to perfbook.
>>
>> Patch 1/7 kicks of the changes by adding index annotations in Glossary.
>>
>> Patch 2/7 reorganizes back matter of perfbook. Glossary, Bibliography,
>> Credits, and the newly added Index belong there.
>> I employed "tocbibind" package to include Bibliography in TOC.
>>
>> Patch 3/7 adds API Index. Annotations for the Index is mostly done in
>> toolsoftrade.
>> You can see that raw \index or \sindex macros are avoided in .tex source
>> files.  Using custom macros for annotation can reduce diffs in adding
>> annotations.
>> glossary.tex is an exception, as every description item has
>> \index{} on it.  If we add other annotations there, we need to use
>> custom macros.
>>
>> Patch 4/7 adds annotations for people's names. They could be in another
>> independent index, but they are merged into the general index.
>> As a result, the ratio of people's names in the index is quite high at the
>> moment.
>> It will decrease as we add annotations for general terms/words.
>> Names are presented in the index in the form of "surname, forename" order.
>> To enable this, annotation is done by \ppl{forename}{surname}.
>> When you need only surname in the text, use \pplsur macro instead.
>> For names with abbreviated middle name, there is a \pplmdl command as
>> well.
>>
>> Patch 5/7 highlights indexed words/terms/names in the text.
>> This should help us in finding out what needs to be annotated.
>> If the color of DarkGreen is problematic for you, please let me know
>> which color is easy for you.
>> One of the purpose of avoiding raw \index{} macros for annotation is
>> to realize this coloring.
>>
>> Patch 6/7 adds a few more annotations of people's names in "formal".
>>
>> Patch 7/7 changes the layout of index from default 2 columns to 3 columns.
>> As mentioned in the change log, API Index shows a minor glitches of
>> extraneous line folding caused by the side effect of \co{} macro.
>> This issue has been fixed in the most recent LaTeX released on 2020-10-01.
>> I have not figured out if there is some workaround for older LaTeX.
> 
> Nice start!
> 
> This is in the "lt" flavor only, correct?  

Oh, why did I miss the most important to share?
I added a new target "ix" and its derivative "1cix" in patch 1/7.
These make targets enable coloring of indexed words/names/APIs added in
patch 5/7.  I'm not sure the color choice works with your eyes, though.

>                                           The default "make" generates
> the perfbook.ind file, but does not include it.  But "make lt" doesn't
> either.  Trying again setting the "toindex" boolean to "true", which does
> in fact generate a pair of three-column indexes at the end, very good!
> 
>> The appearance of index pages does not matter so much at the moment,
>> I suppose.  We need to add annotations first.
> 
> Agreed, the annotations will be a big job.  I have a small patch
> at the end for minor typos as well.

I thought I made quite a few typos.  Thanks for catching them.
I'll merge it to patch 1/7.

> 
>> To do that, we need to agree the organization of index pages.
>> Current indices are flat.
>> LaTeX indexing framework supports up to 3 levels of hierarchy.
>>
>> For example:
>>
>> Flat index
>>
>>     Critical section, <page>
>>     ...
>>     Read-side critical section, <page>
>>     ...
>>     Write-side critical section, <page>
>>
>> 2 level index
>>
>>     Critical section, <page>
>>         read-side, <page>
>>         write-size, <page>
>>     ...
>>     Read-side critical section, see Critical section, read-side
>>     ...
>>     Write-side critical section, see Critical section, write-side
>>
>> Which do you prefer?
> 
> I have a minor preference for the 2-level index.  However, it might or
> might not be worth it.  For example, should "Associativity" be on its own,
> or under "Cache"?  Or in both places?

We will need some experiments.
Let me play with terms in glossary.tex.

> 
>> Another point on people's names.
>> I'm *not* thinking of making index of authors of Bibliography.
>> Due to the amount of cited material, it will require a ton of cleanups
>> in .bib files if you want the author index to look consistent.
>>
>> Which means, you need to mention names of authors who you want to see
>> in the index.  Does this sound reasonable to you?
> 
> That makes a lot of sense!

OK.

> 
>> I know you are debugging/analyzing/testing RCU and lockdep interaction
>> right now.
> 
> But sometimes one must take a break.  And I am hoping to make more
> progress on updating the last few graphs this week.  It turns out that
> there are interesting interactions between userspace RCU's call_rcu()
> worker threads and jemalloc(), for example.  The surprise, especially to
> the jemalloc() folks is that jemalloc() doesn't help much, even if the
> call_rcu() worker threads to a throw-away allocation to help jemalloc()
> realize that it must create caches for those worker threads.
> 
> It is possible that this is a consequence of the fact that the bottleneck
> for large RCU-protected hash tables is in the L3 cache rather than in
> any particular CPU.  Which is an unexpected benefit, as this situation
> clearly calls attention to the possibility of this type of bottleneck.
> 
> Not so good for second-edition schedule, though!

;-) ;-)

> 
>> I'm not in a hurry and looking forward to your feedback.
> 
> I am going to list a few additional index entries: CPU, memory, I/O,
> multicore, synchronization, cache hit, Moore's Law free lunch, speed of
> light, 3D integration, accelerators, CAS, socket, core, thread (hardware
> and software), simultaneous multithreading, hyperthreading, interconnect,
> interrupt (expansion of IRQ?), inter-processor interrupt (expansion of
> IPI?), locality of reference (spatial and temporal), cache prefetching,
> cache alignment, cache ways, read-mostly replication, partitioning,
> out-of-order execution, super-scalar CPU, hardware transactional memory,
> software transactional memory, hazard pointers, reference counters,
> lockless, the various counter algorithms, object oriented, object oriented
> spaghetti code, stall (for example, pipeline stall due to a cache miss),
> double-ended queue, maze (or maze solving), branch prediction, atomic
> instructions, atomic read-modify-write instructions, memory barrier,
> distributed-system parallelism (as opposed to shared-memory parallelism),
> communications miss (of caches), herd (the LKMM tool), coherence order,
> reads-from, from-reads, Nidhugg, Promela (and spin?), Linux kernel,
> and much more, but that is enough for now.

If you want to do it on your own, why not merge the next pull request
which will address textwidth of 1c-layout index pages?

It should be safe as indexing is not enabled in existing make targets.

> 
> Should the index expand acronyms?  Hennessy and Patterson do for some
> acronyms but not others, so we can justify being inconsistent if we
> would like.

I guess index entries will keep somewhat inconsistent in any way.
Keeping them consistent will require huge effort.

> 
> You might argue that some of these need glossary entries, and you
> would be quite right.  ;-)

;-)

> 
> In other news, I am considering bringing back the quantum-computing
> section given that things seem to have stabilized a bit.  But it is
> still a bit off-topic.
> 
> Again, great start on the index!

Glad to know you liked it!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>> --
>> The following changes since commit 810da77e1c66ad543e34a10b197aa9e629c7dc8f:
>>
>>   CodeSamples/formal: Use '{}' for empty init blocks in litmus tests (2020-11-15 12:38:36 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/akiyks/perfbook.git tags/for-paul-not-pull-2020.11.23a
>>
>> for you to fetch changes up to 9cecce4c32c9ff97f3330591d0699c8aa7e2585b:
>>
>>   index: Trial of 3 column (2020-11-22 23:16:58 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (7):
>>       PoC of indexing
>>       Reorganize backmatters
>>       PoC of additional API Index
>>       index: Add annotations to people's names for PoC
>>       Color indexed text conditionally
>>       index: Add some more people index annotations in 'formal'
>>       index: Trial of 3 column
>>
>>  .gitignore                      |   3 +
>>  Makefile                        |  10 +-
>>  SMPdesign/SMPdesign.tex         |   2 +-
>>  SMPdesign/partexercises.tex     |   5 +-
>>  appendix/ack/ack.tex => ack.tex |   6 +-
>>  appendix/appendix.tex           |  20 --
>>  count/count.tex                 |   2 +-
>>  cpu/cpu.tex                     |   3 +-
>>  cpu/hwfreelunch.tex             |   6 +-
>>  cpu/overview.tex                |   4 +-
>>  datastruct/datastruct.tex       |   4 +-
>>  debugging/debugging.tex         |   5 +-
>>  defer/rcurelated.tex            |  92 +++++----
>>  defer/rcuusage.tex              |   3 +-
>>  formal/axiomatic.tex            |   4 +-
>>  formal/ppcmem.tex               |   7 +-
>>  formal/spinhint.tex             |   2 +-
>>  future/cpu.tex                  |  12 +-
>>  future/tm.tex                   |   2 +-
>>  glossary.tex                    | 112 +++++------
>>  howto/howto.tex                 |  37 ++--
>>  intro/intro.tex                 |   8 +-
>>  memorder/memorder.tex           |   6 +-
>>  perfbook-lt.tex                 |  75 ++++++-
>>  toolsoftrade/toolsoftrade.tex   | 420 ++++++++++++++++++++--------------------
>>  utilities/runlatex.sh           |   2 +
>>  26 files changed, 470 insertions(+), 382 deletions(-)
>>  rename appendix/ack/ack.tex => ack.tex (98%)
