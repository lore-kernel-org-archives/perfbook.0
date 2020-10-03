Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgJCQT0 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 3 Oct 2020 12:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601741965;
        bh=xoPmvAl/Hnw06S9DTSG4NWSohmm0gkApBlwUO1OJqNo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DwmY9mjx4x5Gz2j5257nawKabrUqDOw7cCZFZj51Usw1kMs4iUcNVVyVJIZKEbrYS
         FXh0ISYvZhVltYOa0+cvuP1hGTdy1EtJa9YtgaWrQzpJ8iTviAqS4epDdnodlkca04
         4Q1571jIKPjOYuurLTULiNfZF4L17r03mFTqJnBQ=
Date: Sat, 3 Oct 2020 09:19:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20201003161925.GL29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200929084006.GA31703@HongKong.localdomain>
 <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
 <20201003042847.GA32682@HongKong.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003042847.GA32682@HongKong.localdomain>
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchang2020@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 03, 2020 at 12:28:47PM +0800, Junchang Wang wrote:
> On Sat, Oct 03, 2020 at 11:24:52AM +0900, Akira Yokosawa wrote:
> >Hi Junchang,
> >
> >On Tue, 29 Sep 2020 16:40:06 +0800, Junchang Wang wrote:
> >> The typo in atomic_add_return() incurs tricky bugs. For example, the current
> >> atomic_dec_return() is indeed an atomic_add_return(). A similar typo appears
> >> in the function atomic_add_negative().
> >
> >Nice catches!

What Akira said!  I have pulled them in, thank you both!

(And please accept my apologies for being slow -- it has been an
eventful week.)

> Hi Akira,
> 
> >
> >You mean the current atomic_add_return(), atomic_sub_return(), and
> >atomic_dec_return() actually are atomic_inc_return(), don't you?
> >
> 
> Yes. I meant to say "actually". :-)
> 
> >I wondered if these typos have affected code under CodeSamples.
> >
> 
> No. Like you have mentioned in your mail, the affected functions are
> atomic_add_negative(), atomic_add_return(), atomic_dec_return(), and
> atomic_sub_return(). The code in CodeSamples does not use the first three
> functions, and the last function is only used by SMPdesign/lockrwdeq.c which
> does not appear in perfbook.
> 
> I encountered the bug when I was evaluating my parallel code, which utilizes
> atomic_dec_return() in api-gcc.h, on the hashtorture benchmarking framework.
> It would be great if we can fix the bugs because other programmers like me
> will probably write their code based on the sample codes in perfbook.
> 
> 
> Thanks,
> --Junchang
> 
> >Looks like atomic_add_negative(), atomic_add_return(), and
> >atomic_dec_return() are defined in api-gcc.h, but not used in anywhere
> >under CodeSamples.
> >
> >On the other hand, atomic_sub_return() is used in SMPdesign/lockrwdeq.c.
> >
> >./SMPdesign/lockrwdeq.c:100:	if (atomic_sub_return(2, &d->counter) < 1) {
> >./SMPdesign/lockrwdeq.c:116:	if (atomic_sub_return(2, &d->counter) < 1) {
> >./SMPdesign/lockrwdeq.c:131:	if (atomic_sub_return(1, &d->counter) < 1) {
> >./SMPdesign/lockrwdeq.c:143:	if (atomic_sub_return(1, &d->counter) < 1) {
> >
> >All of them are actually atomic_inc_return(&d->counter)s!
> >
> >Building lockrwdeq and running it at current master sometimes segfaults or deadlocks.
> >
> >Applying Junchang's patch makes it much stable.
> >I've never looked into lockrqdeq.c (because it is not cited from perfbook text)
> >and don't have any clue.
> >
> >Paul, what is your expectation of lockrwdeq's behavior?

I would expect it to be a double-ended queue, just like the other similar
programs.  I had completely forgotten about it, but my 2015 discussion
with Dominik Dingel leads me to believe that it passed tests back then.
And it looks like I introduced this bug with my 2016 commit cee469f9a7aa
("api: Switch x86 atomics to gcc C11-like atomics").  I added a Fixes
line as shown below.  Please let me know if I messed anything up.

But sadly, this change does not fix this bug:

$ ./hash_bkt_hazptr --schroedinger --nreaders 1 --duration 1000 --updatewait 0 --nbuckets 8192 --elems/writer 8192
Segmentation fault (core dumped)

Can't have everything.  ;-)

It appears that hashtorture manages to fail to call the per-thread
hazard-pointers initialization on some paths, so it is no surprise
that Junchang's fix doesn't fix this bug.

							Thanx, Paul

------------------------------------------------------------------------

commit 84d5f87216975a944220ab998818728608705171
Author: Junchang Wang <junchang2020@gmail.com>
Date:   Tue Sep 29 16:40:06 2020 +0800

    api-gcc.h: Fix typos in the functions atomic_add_*
    
    The typo in atomic_add_return() results in tricky bugs. For example,
    the current atomic_dec_return() is instead an atomic_add_return(). A
    similar typo appears in the function atomic_add_negative().
    
    Fixes: cee469f9a7aa ("api: Switch x86 atomics to gcc C11-like atomics")
    Signed-off-by: Junchang Wang <junchang2020@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
index fbbedf2..9ad8a68 100644
--- a/CodeSamples/api-pthreads/api-gcc.h
+++ b/CodeSamples/api-pthreads/api-gcc.h
@@ -140,7 +140,7 @@ static __inline__ int atomic_inc_and_test(atomic_t *v)
  */
 static __inline__ int atomic_add_negative(int i, atomic_t *v)
 {
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) < 0;
+	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST) < 0;
 }
 
 /**
@@ -152,7 +152,7 @@ static __inline__ int atomic_add_negative(int i, atomic_t *v)
  */
 static __inline__ int atomic_add_return(int i, atomic_t *v)
 {
-	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST);
+	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST);
 }
 
 static __inline__ int atomic_sub_return(int i, atomic_t *v)
