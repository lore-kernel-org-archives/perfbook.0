Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09720B644
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 01:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735350903; cv=none; b=E16Rnj/+0OSyLuZLtVlhjAmm33wLHBMgJ6U3DNZCU6xqRFpm/QabZbIma4cpBi9G66SPU5RFr3MWBN2kVt3gjuQaD6gc5hAQgphqy3ANJydX6fcSZPXdbN0XonveMmZ0rF+q6VOEVC3o3UqyZT97Njjj+3KxnzKQ+YopMo8D/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735350903; c=relaxed/simple;
	bh=+iyBzovfTTZsw6JSAi98ADwPGGyCdnyD2AIfQhyjG44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hAMXa5wR8V1IkCuAsjS7deDnGFUjTrh13WVfxqQmGkWPQjR+x2rG0WX7Ohte0FteoBchPj4RBwEOZRANxdDjoXFGVpRkTFl2D22rcjSP4HWQvuhJif5kzjLivsfYp9dYyx6uin4HpzmLeVJsCqNJoWW73mtiMuDdKEWpg8bhNps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuzxHSNm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuzxHSNm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so9402920a91.3
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 17:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735350901; x=1735955701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/jYVppfVmKLcM/ILL3FPcsNxOx71nVsKbvJPILww3w=;
        b=GuzxHSNmQWZV5Cr+oORih40HA9Kx9RV1lVt8sUS0jX1JpZFFvFQ/tocDSKNxoWO6BD
         2qitxia0yXjiHfEDcgc+xM+7XGTPR6R0/Cp+LorBRK5/JpSJzUoEBus8OfH5YMXvLOFH
         FdbkR/tuAYFN2BtpJwUC001RdqCGHa8d0WguIImrMOO3c0Fj6hjiKGRdBYzuBA1gz77F
         JWSj3R6BctpgASjcFT79k5dhli8IkvqiYGkm9RmRDSLaIER85CB6xuJRNGLCWo9UWmJM
         ORonD5ZHpxZsDtKiaAK/IybmXZvMbpSTaX9jm1lbaAJLxbT8XTI1/3FKZA95FlvsdjWP
         EUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735350901; x=1735955701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/jYVppfVmKLcM/ILL3FPcsNxOx71nVsKbvJPILww3w=;
        b=GRdOHiAcPAqat3oTM0D0T3uR7raPXp9//imKMIl70rJJOmjt2xPCVhoTvnV3E8lRov
         hnfYrtuL6J3nn0+UXGB6SjbolwAJ2yEJHGvftREchiDNMPohsiBWX1O5M2oKd7yVzk4p
         X+zuBbsSvOa07quyUvjsEh58BHZ94U0HD5HsEDkF0y2ssHZa1A7jgudIoM81KGGaba/X
         SSLprv1ZnpkKPXmMKxfH7K/QuZgws9PUdAQilEDa6k7336L+3DO6A/CQgckCHdMtGw74
         UDX2wAQTEut33tES2S2K9L5o5FyN5Z25IC88Xw4jf6ipW7EBBi2V4MbzCamQxzXXshXJ
         LVlw==
X-Forwarded-Encrypted: i=1; AJvYcCXGEsNmPr9sRQZ+/Z0HGjUJGTDrLxt5U6sw5JLLGYgf8pclE1b67SE4fjuMiOIzB6Peh/jbjv/djQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkj1Gg7KwyEwieF0ptO1fgCsuWFQgAK/V6lAeAXjqgGYhcQhB8
	KdypxY2xI8G1/+HGPQY+xdPkBm3XroW9IxdiNvRhf5ddWdavclsUbszkjw==
X-Gm-Gg: ASbGncupMQD2Cx/IJTcfKCc9glApEUL0OcObZ1TlQtyyMaFwWnRqzPG2V/FIapIFj/Y
	hNcP8iMXil5FkC74TlM4cUlKrwrmbEe5zllcJPRoY3UFAqk2xuvst6MPXLNozYwJWCUDEBGQIhd
	MRdorj1UP/4Kx7S80RnhfiIP5lY6fJHfw9ntSaTnVFsu+p5xXkxqsTxyMekzHrFGMOtGnu8qPO1
	rOsjnrpvcZAU9+5bw+OmYXrbgLynNmYA62DHkAkLWToWon8tzn9PNCHlavmx5StRPLrG4iSpKnC
	U/Hejh6zJXWlK3lgBBFcJW8=
X-Google-Smtp-Source: AGHT+IEYtI77cX1NdDJLoBZnDlOC1wQUWY02LQuvU4n45v8kBNgFxvVjaCkhPK1Z9eUQnt7B/82NkQ==
X-Received: by 2002:a05:6a00:14cd:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72abddb20fdmr40668009b3a.13.1735350901185;
        Fri, 27 Dec 2024 17:55:01 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815842sm15276382b3a.7.2024.12.27.17.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 17:55:00 -0800 (PST)
Message-ID: <5a25758a-4f5a-43e8-9aae-b6709d601c78@gmail.com>
Date: Sat, 28 Dec 2024 10:54:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CodeSamples: Remove support for liburcu-signal
To: Leonardo Bras <lsoaresp@redhat.com>, perfbook@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, paulmck@kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20241228012954.13874-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20241228012954.13874-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Looks like I didn't make my point clear enough...

On 2024/12/28 10:29, Leonardo Bras wrote:
> Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> deprecating[2] support for liburcu-signal:
> 
> %%%
>    * Deprecation of liburcu-signal
> 
> Users can migrate to liburcu-memb with a kernel implementing the
> membarrier(2) system call to have similar read-side performance without
> requiring use of a reserved signal, and with improved grace period
> performance.
> %%%
> 
> Also, from liburcu.org:
> 
> %%%
> Usage of liburcu
> 1. #include <urcu.h>
> 2. Link the application with -lurcu
> 
> This is the preferred version of the library, in terms of grace-period
> detection speed, read-side speed and flexibility. Dynamically detects
> kernel support for sys_membarrier(). Falls back on urcu-mb scheme if
> support is not present, which has slower read-side.
> %%%
> 
> Which tl;dr means for any system running a current version of liburcu,
> liburcu-signal should not be needed to build/run the CodeSamples.
> 
> Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it on
> linking stage.

No, this change will break builds with liburcu <0.15.

What I wanted say was to keep building with liburcu <0.15 possible.
Not to expand the changelog...

I don't think it is reasonable to expect people install latest liburcu.
right away.

Please reconsider.

        Thanks, Akira

> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> [1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
> [2] https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html
> 
> ---
>  CodeSamples/datastruct/Issaquah/Makefile  |  4 +--
>  CodeSamples/datastruct/existence/Makefile | 32 +++++++++++------------
>  CodeSamples/datastruct/hash/Makefile      |  6 ++---
>  CodeSamples/datastruct/skiplist/Makefile  |  4 +--
>  CodeSamples/defer/Makefile                |  6 ++---
>  5 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
> index c3b724d7..187d10a7 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -38,17 +38,17 @@ GCC_ARGS += -fcommon
>  #	 use something like jemalloc() instead of glibc malloc().
>  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
>  #	 need the following additional arguments to cc:
>  #		-I/home/paulmck/jemalloc/include
>  #		-L/home/paulmck/jemalloc/lib
>  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
>  #		-DUSE_JEMALLOC
>  #	 Verify by using the nm command and searching output for malloc.
>  
>  existence_test: existence.c existence_test.c
> -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread -lurcu
>  
>  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/random.c -lpthread -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/datastruct/existence/Makefile
> index 19891c0f..027d54fb 100644
> --- a/CodeSamples/datastruct/existence/Makefile
> +++ b/CodeSamples/datastruct/existence/Makefile
> @@ -37,47 +37,47 @@ all: $(PROGS)
>  #	 need the following additional arguments to cc:
>  #		-I/home/paulmck/jemalloc/include
>  #		-L/home/paulmck/jemalloc/lib
>  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
>  #		-DUSE_JEMALLOC
>  #	 Verify by using the nm command and searching output for malloc.
>  #
>  #	So it is quite a bit easier to just use the default locations.  ;-)
>  
>  existence_test: existence.h existence_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
>  
>  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread -lurcu
>  
>  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3hash_uperf.c procon.h
> -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmalloc -lpthread -lurcu
>  
>  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h existence_3skiplist_test.c procon.h
> -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> +	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
>  
>  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existence_3skiplist_uperf.c procon.h
> -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
>  
>  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurcu
>  
>  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleidoscope_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lpthread -lurcu
>  
>  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_3skiplist_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
> +	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c $(LIB)/random.c -lpthread -lurcu
>  
>  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h kaleidoscope_skiphash_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
> +	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(LIB)/random.c -lpthread -lurcu
>  
>  procon_test: procon.h procon_test.c
> -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
> +	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
> index a56255a2..7d47485a 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -37,29 +37,29 @@ GCC_ARGS += -fcommon
>  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpthread
>  
>  hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/random.c -lpthread
>  
>  hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
>  
>  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazptr.h ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../defer/hazptr.c $(LIB)/random.c -lpthread
>  
>  hash_global: hash_global.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c -lpthread
>  
>  hash_resize: hash_resize.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/random.c -lpthread -lurcu
>  
>  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c -lpthread
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datastruct/skiplist/Makefile
> index 3a555691..931c8c1c 100644
> --- a/CodeSamples/datastruct/skiplist/Makefile
> +++ b/CodeSamples/datastruct/skiplist/Makefile
> @@ -26,17 +26,17 @@ include $(top)/depends.mk
>  ifeq ($(strip $(target)),)
>  all:
>  	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'."
>  else
>  all: $(PROGS)
>  endif
>  
>  include $(top)/recipes.mk
>  
>  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LIB)/random.c -lpthread -lurcu
>  
>  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_glock.c $(LIB)/random.c -lpthread -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 3cf3e5a5..8454a9ed 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -73,21 +73,21 @@ bug_rcu_dp: bug_rcu_dp.c ../api.h
>  gettimestamp: gettimestamp.c ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
>  
>  gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
>  
>  hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
>  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
>  
>  ptxroute: ptxroute.c ../api.h
> -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
>  
>  rcu: rcu.c rcu.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
>  
>  rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
>  
>  rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
>  
> @@ -124,32 +124,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcutorture.h
>  rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
>  
>  rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
>  
>  route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c -lpthread
>  
>  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
> -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lurcu
>  
>  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c -lpthread  -lurcu-qsbr
>  
>  route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthread
>  
>  route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
>  
>  route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpthread
>  
>  seqlocktorture: seqlocktorture.c seqlock.h ../api.h
>  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
>  
>  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthread  -lurcu
>  
>  clean:
>  	rm -f $(PROGS)
