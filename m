Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA700635
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 03:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357590; cv=none; b=NFlp50zADFPeikG23xnWMQSMNoOcsIL8t1ak0v5S43HwGS0vvWT+LK47O1797lL74EU11i2YjWOxQPSxcxcuGODXWdITIOD00+lnwqeJ2Du0At5L706mBIrFSSPqqQ0n6lZrvVy8VQ/U6PAq5voGy7E6acZ9tNNNjf7twq3DpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357590; c=relaxed/simple;
	bh=FEdskn/vhuD4gYfisv+2igbO06ApKNbRP7f2fe6/KKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II/lAAptQMei8vYFHRE9CtzxBOysDTRDgm70VsChIHTzFMnynaYYhH3fL7NFSFdZa3XqxCMfanzfd4pBXx49rsS8iOK0mWGOtMKebV5s+lknjEppeYDMrc9JQRShODOPHcQiwpwzydlsyWnbklMudiPyM5oDS7pWe0l4UnXQWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlV/kofZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlV/kofZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1852C4CECD;
	Sat, 28 Dec 2024 03:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735357589;
	bh=FEdskn/vhuD4gYfisv+2igbO06ApKNbRP7f2fe6/KKM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nlV/kofZgb5G/5+HbLa+fwApOor1onYlFAouF17iench4b2IL9SWdn7KbycpKUADY
	 AJkLXm32mNxCuFQWyrSsCiU6lAozy7CxKy0v9xPRj1GJ/J9BG2Y7UVh4eXLjo1mMfG
	 M+0Wqz+BZkaNmbdD5FRF0IQjsMSoX4pxocmZ6V3qmRc/6FkhvL9wjfOWBxKEmfGupI
	 +F0QwHG0s2QS2s9P4ZgXPk07fdXEx9jvGVgZuTpdUG9/3vA9SlPla/Z5yxWi3zCOFT
	 oYxk0NqQUN6+hE5tcDkigXNi7QzRXdAQwlcXdOhIdMCNPThNCLbmD1c3RJQKFz2hcj
	 jqiIZMS4mVxuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 60E1CCE38CB; Fri, 27 Dec 2024 19:46:29 -0800 (PST)
Date: Fri, 27 Dec 2024 19:46:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [PATCH v2] CodeSamples: Remove support for liburcu-signal
Message-ID: <239dcc06-d357-4533-96d9-e6ed3c7942e4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241228012954.13874-1-leobras.c@gmail.com>
 <5a25758a-4f5a-43e8-9aae-b6709d601c78@gmail.com>
 <c21a45c46ce861b7f247590662c71dd37b66b8ba.camel@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c21a45c46ce861b7f247590662c71dd37b66b8ba.camel@gmail.com>

On Fri, Dec 27, 2024 at 11:05:07PM -0300, Leonardo Brás wrote:
> On Sat, 2024-12-28 at 10:54 +0900, Akira Yokosawa wrote:
> > Hi,
> > 
> > Looks like I didn't make my point clear enough...
> > 
> > On 2024/12/28 10:29, Leonardo Bras wrote:
> > > Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> > > deprecating[2] support for liburcu-signal:
> > > 
> > > %%%
> > >    * Deprecation of liburcu-signal
> > > 
> > > Users can migrate to liburcu-memb with a kernel implementing the
> > > membarrier(2) system call to have similar read-side performance without
> > > requiring use of a reserved signal, and with improved grace period
> > > performance.
> > > %%%
> > > 
> > > Also, from liburcu.org:
> > > 
> > > %%%
> > > Usage of liburcu
> > > 1. #include <urcu.h>
> > > 2. Link the application with -lurcu
> > > 
> > > This is the preferred version of the library, in terms of grace-period
> > > detection speed, read-side speed and flexibility. Dynamically detects
> > > kernel support for sys_membarrier(). Falls back on urcu-mb scheme if
> > > support is not present, which has slower read-side.
> > > %%%
> > > 
> > > Which tl;dr means for any system running a current version of liburcu,
> > > liburcu-signal should not be needed to build/run the CodeSamples.
> > > 
> > > Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it on
> > > linking stage.
> > 
> > No, this change will break builds with liburcu <0.15.
> > 
> > What I wanted say was to keep building with liburcu <0.15 possible.
> > Not to expand the changelog...
> > 
> > I don't think it is reasonable to expect people install latest liburcu.
> > right away.
> > 
> > Please reconsider.
> 
> Oh, I see the point.
> 
> I understand the issue, and I think we could check for an older liburcu version
> to add the -lurcu-signal only for versions < 0.15.
> 
> On the other hand, sys_membarrier() was introduced in 2015 (5b25b13ab08f6), and
> no supported kernel (>v4.2) should still miss this syscall. Is it worth the
> added complexity? Is so, let's do it.

If the -lurcu-signal is left off for old versions of the userspace RCU
library, doesn't it simply fall back to using explicit memory barriers?
Or am I yet again misremembering?

							Thanx, Paul

> Thanks!
> Leo
> 
> > 
> >         Thanks, Akira
> > 
> > > 
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > 
> > > [1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
> > > [2] https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html
> > > 
> > > ---
> > >  CodeSamples/datastruct/Issaquah/Makefile  |  4 +--
> > >  CodeSamples/datastruct/existence/Makefile | 32 +++++++++++------------
> > >  CodeSamples/datastruct/hash/Makefile      |  6 ++---
> > >  CodeSamples/datastruct/skiplist/Makefile  |  4 +--
> > >  CodeSamples/defer/Makefile                |  6 ++---
> > >  5 files changed, 26 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
> > > index c3b724d7..187d10a7 100644
> > > --- a/CodeSamples/datastruct/Issaquah/Makefile
> > > +++ b/CodeSamples/datastruct/Issaquah/Makefile
> > > @@ -38,17 +38,17 @@ GCC_ARGS += -fcommon
> > >  #	 use something like jemalloc() instead of glibc malloc().
> > >  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
> > >  #	 need the following additional arguments to cc:
> > >  #		-I/home/paulmck/jemalloc/include
> > >  #		-L/home/paulmck/jemalloc/lib
> > >  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
> > >  #		-DUSE_JEMALLOC
> > >  #	 Verify by using the nm command and searching output for malloc.
> > >  
> > >  existence_test: existence.c existence_test.c
> > > -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu
> > >  
> > >  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> > > -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datastruct/existence/Makefile
> > > index 19891c0f..027d54fb 100644
> > > --- a/CodeSamples/datastruct/existence/Makefile
> > > +++ b/CodeSamples/datastruct/existence/Makefile
> > > @@ -37,47 +37,47 @@ all: $(PROGS)
> > >  #	 need the following additional arguments to cc:
> > >  #		-I/home/paulmck/jemalloc/include
> > >  #		-L/home/paulmck/jemalloc/lib
> > >  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
> > >  #		-DUSE_JEMALLOC
> > >  #	 Verify by using the nm command and searching output for malloc.
> > >  #
> > >  #	So it is quite a bit easier to just use the default locations.  ;-)
> > >  
> > >  existence_test: existence.h existence_test.c procon.h
> > > -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
> > >  
> > >  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash_test.c procon.h
> > > -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu
> > >  
> > >  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3hash_uperf.c procon.h
> > > -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> > > -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> > > +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
> > > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
> > >  
> > >  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existence_3skiplist_test.c procon.h
> > > -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > -	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> > > +	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_3skiplist_uperf.c procon.h
> > > -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> > > -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu
> > >  
> > >  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidoscope_3hash_test.c procon.h
> > > -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu
> > >  
> > >  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_3skiplist_test.c procon.h
> > > -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > -	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> > > +	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_skiphash_test.c procon.h
> > > -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > -	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
> > > +	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  procon_test: procon.h procon_test.c
> > > -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> > > -	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> > > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
> > > +	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu
> > >  
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
> > > index a56255a2..7d47485a 100644
> > > --- a/CodeSamples/datastruct/hash/Makefile
> > > +++ b/CodeSamples/datastruct/hash/Makefile
> > > @@ -37,29 +37,29 @@ GCC_ARGS += -fcommon
> > >  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthread
> > >  
> > >  hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/random.c -lpthread
> > >  
> > >  hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> > >  
> > >  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
> > >  
> > >  hash_global: hash_global.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
> > >  
> > >  hash_resize: hash_resize.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -lpthread
> > >  
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
> > > index 3a555691..931c8c1c 100644
> > > --- a/CodeSamples/datastruct/skiplist/Makefile
> > > +++ b/CodeSamples/datastruct/skiplist/Makefile
> > > @@ -26,17 +26,17 @@ include $(top)/depends.mk
> > >  ifeq ($(strip $(target)),)
> > >  all:
> > >  	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'."
> > >  else
> > >  all: $(PROGS)
> > >  endif
> > >  
> > >  include $(top)/recipes.mk
> > >  
> > >  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> > > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
> > > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu
> > >  
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> > > index 3cf3e5a5..8454a9ed 100644
> > > --- a/CodeSamples/defer/Makefile
> > > +++ b/CodeSamples/defer/Makefile
> > > @@ -73,21 +73,21 @@ bug_rcu_dp: bug_rcu_dp.c ../api.h
> > >  gettimestamp: gettimestamp.c ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
> > >  
> > >  gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
> > >  
> > >  hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
> > >  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> > >  
> > >  ptxroute: ptxroute.c ../api.h
> > > -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
> > >  
> > >  rcu: rcu.c rcu.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> > >  
> > >  rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
> > >  
> > >  rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
> > >  
> > > @@ -124,32 +124,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcutorture.h
> > >  rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
> > >  
> > >  rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
> > >  
> > >  route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/random.c routetorture.h
> > >  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
> > >  
> > >  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> > > -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
> > >  
> > >  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> > >  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -lpthread  -lurcu-qsbr
> > >  
> > >  route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> > >  	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthread
> > >  
> > >  route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> > >  	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
> > >  
> > >  route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../lib/random.c routetorture.h
> > >  	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpthread
> > >  
> > >  seqlocktorture: seqlocktorture.c seqlock.h ../api.h
> > >  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> > >  
> > >  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> > > -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu
> > >  
> > >  clean:
> > >  	rm -f $(PROGS)
> 
