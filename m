Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076152111
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735409091; cv=none; b=EDZOYcB1sSywn4yp+5JCDxkh33bnQdocSeAHSMhxa+4trZjhgyfxsKHLWyxosdzHTzFmc3p0cSO0OFlG1nzRrnQ0yM0uAEt7WLZZ9mFULeBdo//Z+1Qje4HHCaogFYmZkfrLuwro4UXB2q9p8UXMxcfCs0WjXHaKzemHI7HietE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735409091; c=relaxed/simple;
	bh=MpXxJO/qbHJ7nqqTrTNWqnHsalAQPZ6w1kQeaI6imEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak1+Za8kC6zcQL59TSg1B6T2A6Y9ljtD7bxYaJitfUuBm0vzt1WuNR2+w9J4TFecqEEwXOvndudIKuu/wudDz9rpP9lDUMZnNqvALZ3z6ftgEK1OiQ9Fd7TtnVktG503HQMwQUU/kGnJnqW3UTWHst9i8guKd3H/IHcXaGG92Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cm+H0dM2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cm+H0dM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E4AC4CECD;
	Sat, 28 Dec 2024 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735409090;
	bh=MpXxJO/qbHJ7nqqTrTNWqnHsalAQPZ6w1kQeaI6imEA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cm+H0dM2C6boVSXPihA5i533wRxM4u2+5EMzJuU6j+Avqhwn54cFY3GssaXtGIj2h
	 MJynJ55MJ1JYBI8UzcAjtDb67OBlr70b0DBkAYXVpf8xtYrUY39L4Jnqi07XjRoeh4
	 Vr7GQw2Or9N6rsePRql4EZxFaMawZCIvInJiisNKm+/EA9blEENejZV1USrRq58/BR
	 QRuIglGAsgY4Tb8JvrACgDW+a49gzfeak3pHTDi5VUGlxaSpJNsyW0DJJJtFehX3Al
	 hzM6bSVXjlz7sGTeu9eBKnWzzYbgGxzufVF2Ku8KJdzXth5VmYCt+e9KTh+eEcKy1y
	 L7KUh/jerxCYA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2B9C8CE0D8A; Sat, 28 Dec 2024 10:04:50 -0800 (PST)
Date: Sat, 28 Dec 2024 10:04:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
Message-ID: <bc05ad7f-c2ea-4051-85d2-49d7d38c5970@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>

On Sat, Dec 28, 2024 at 04:12:40PM +0900, Akira Yokosawa wrote:
> From: Leonardo Bras <leobras.c@gmail.com>
> 
> liburcu 0.15.0 deprecated urcu-signal as a library.
> This causes build errors in gitlab-CI [1]:
> 
>     /usr/sbin/ld: cannot find -lurcu-signal: No such file or directory
>     collect2: error: ld returned 1 exit status
> 
> Work around them by adding command lines w/o "-lurcu-signal" as
> fallbacks in relevant Makefile recipes.
> 
> Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
> [akiyks: rewrite changelog, restore compatibility with liburcu <0.15.0]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
> 
> Admittedly, this is one of the least elegant workaround for ArchLinux
> and soon-to-be upgraded other rolling distros, but still looks straight
> forward to me.
> 
> Can you live with this?

Thank you both for digging into this!!!

I believe that we can, and I am inclined to take this.  But first,
a couple of questions:

1.	Can this be some sort of macro or script so that we don't have
	to keep the arguments of the commands in each pair in sync?

2.	Is it possible to try the new version first, so that only old
	systems pay the double-compilation price?

It is quite possible that the answer to the questions is "yes", but that
the result is excessively complex, so please do not put too much time
into this.  As I said above, I am inclined to take this.

> This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
> Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
> and ArchLinux (liburcu 0.15.0).

Thank you very much for testing all these possibilities!

							Thanx, Paul

>         Thanks, Akira
> --
>  CodeSamples/datastruct/Issaquah/Makefile  |  6 +++--
>  CodeSamples/datastruct/existence/Makefile | 30 +++++++++++++++--------
>  CodeSamples/datastruct/hash/Makefile      |  9 ++++---
>  CodeSamples/datastruct/skiplist/Makefile  |  6 +++--
>  CodeSamples/defer/Makefile                |  9 ++++---
>  5 files changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
> index c3b724d7..75fd840b 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -45,10 +45,12 @@ GCC_ARGS += -fcommon
>  #	 Verify by using the nm command and searching output for malloc.
>  
>  existence_test: existence.c existence_test.c
> -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu
>  
>  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datastruct/existence/Makefile
> index 19891c0f..568e7c2d 100644
> --- a/CodeSamples/datastruct/existence/Makefile
> +++ b/CodeSamples/datastruct/existence/Makefile
> @@ -44,39 +44,49 @@ all: $(PROGS)
>  #	So it is quite a bit easier to just use the default locations.  ;-)
>  
>  existence_test: existence.h existence_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
>  
>  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu
>  
>  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3hash_uperf.c procon.h
>  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
>  
>  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existence_3skiplist_test.c procon.h
> -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
>  
>  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_3skiplist_uperf.c procon.h
>  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
>  
>  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu
>  
>  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidoscope_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu
>  
>  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_3skiplist_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
>  
>  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_skiphash_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
>  
>  procon_test: procon.h procon_test.c
> -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal || \
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
>  
>  clean:
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
> index a56255a2..a558dfee 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -44,7 +44,8 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
>  
>  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
> @@ -53,10 +54,12 @@ hash_global: hash_global.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
>  
>  hash_resize: hash_resize.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -lpthread
> diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
> index 3a555691..8cf9d47a 100644
> --- a/CodeSamples/datastruct/skiplist/Makefile
> +++ b/CodeSamples/datastruct/skiplist/Makefile
> @@ -33,10 +33,12 @@ endif
>  include $(top)/recipes.mk
>  
>  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu
>  
>  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 3cf3e5a5..b4af17db 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -80,7 +80,8 @@ hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
>  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
>  
>  ptxroute: ptxroute.c ../api.h
> -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
>  
>  rcu: rcu.c rcu.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> @@ -131,7 +132,8 @@ route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/r
>  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
>  
>  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
>  
>  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -lpthread  -lurcu-qsbr
> @@ -149,7 +151,8 @@ seqlocktorture: seqlocktorture.c seqlock.h ../api.h
>  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
>  
>  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> 
> base-commit: 4c0afec5a7081227adc768fb8d3fb35aa1981d55
> -- 
> 2.34.1
> 
