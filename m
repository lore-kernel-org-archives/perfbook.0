Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1C13C0C
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735348282; cv=none; b=cQ26/Uk36Vk2mu4tJEXjK9V2eg7ZDIb4v2pX4aT6Zyv+2KKi7D1mH8KdQRABWrUDLlup45AsnFBZGleQ3h7tgOxIWykmqLVn+ZgBB8hK0gk1r35XQPsIw4kHa00NtAAIlPjQC3TvD1SlQbQYKbEk3Ky0t+X30IkhH9VvUBjhn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735348282; c=relaxed/simple;
	bh=TGVattgObL/dEciW/Zaq8wowtySnirWlgFbqqa1g9Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPUKM4PtlPdYr7qHS5aENRe0Y4x5H+YRCdeD3o4s/HM/gYA55v6B4EIvciwLmTc+udVZz+P4LstB7q7URV3zvBpFXv721Wstylm+FL/9kyJNhA/zefpxuTmkSztanBUoqK4oSZJ3SalKZ5E/hfaRSRFAtlsaFr3sOCeX6UNQFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEOY4nAT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEOY4nAT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21631789fcdso73736925ad.1
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 17:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735348280; x=1735953080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SniTJQnSg/luHKZ4aD+FwILHCEAAsxecl8VZf6+L/po=;
        b=TEOY4nATpkfCcYfTKxrd+gcR2OJxXnojBC+rFbWyyEIIHUxolB7tSJemJQh61Dg3Te
         ipbyVD89L78YsgJCI1ZVl+m7XW0p7lMPyQriEM68lcbFfvczMxFBPK0eXQtZhdzNFmc9
         iwViW8aIWHCEa4SoqI7JN4vVxZDn/MvvUk86lmBFivR5Zb0P8V7SyA+RH7ZAzWGWPwdw
         cxjsiBnnuMEo15p4HcXuQ1ETrfDGOM9bZWUtOa3BjlurYgMw2XXXcXGDO/SHNJAtQmwr
         BVDAdBwOJebePd8637+umRmZufQPxyWtQ5nrp9pYlI8xZPW6KIAJAozvUDKZt2eo/zl9
         cAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735348280; x=1735953080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SniTJQnSg/luHKZ4aD+FwILHCEAAsxecl8VZf6+L/po=;
        b=QWPqnRvRyfFm4pp59s99Fjt6Kcb5934N0Lx7c4Uz0FNF19FZI8bsh2Hj234js0UwaO
         finX2RuDEMuW5FHlsKFr3RLXmBzS2bzrFDhpytnhosBAm9SJMbnfp9xJWNCxrHN/LLVM
         iTBkCJVVgsh+la5+gCPmyS7Zf6tBv33SFffp52wFzwJo/CpD8zlGzGFW1q/Vy5NCItpl
         GzmVrzYsny0tAof9y2Ucvcx8hgJrVnEJf3/6I7YydYv0ZKSdAk0pI7siWUtxlxdSLLrV
         WVdSwLHDKw3x5yGJGAA1LvKb/s90ntpNVAgwf9jKc5AKrBg00LBZwwZP7ZqUc6vdJNaX
         9v1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLAqXzHidhnfAUhkJcAB7vNBrvdAnUAG9qj+Bw5YabsmOFHTZ2odkIVfMtK0DgM0UYmYr01/zz+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqUVhnSh1N9z5948YjpjbYSA02LFZs5Q2/97JgVVQgBRk8mB51
	ugQ5MLtKECeTQtypPk+Jy5JFaav53S/a6cCmOHxlBemgbB8iOhQR
X-Gm-Gg: ASbGncs03IxPeo60sEBzcMQEdxSKTXEdD+a62R+y7RGBnEv0tnmaCa0PY07ymg59c7d
	I6N67dR9TNWj7c0QeWWrCONMOdAs9AbJB9qX1EMvbCa2HC0bmStS0T3GEZd+kCqPvE4MMwYDI9O
	/PJ4GsmLooImXZ/nT6v+ADZzxIrSkXGSOnHkzXd/c/LSLCQSd5nTXOlslh32CyLN4qDRHojYi2b
	8zolQl2sIPB0gvgm7b3+BlsF+RKBsHTNc+EXKL18xKVCjE+3szYigMezB8J06QLbeTtUJWyAs8K
	vHWvyfVal71gvXuH1Hq4Tnk=
X-Google-Smtp-Source: AGHT+IFejHOlxlXW0oI47BSKQJx91ybKAW5CEeASRvonREM3E69dUHeH+ZbRyq4CsNknWr0sYEzoOA==
X-Received: by 2002:a05:6a21:100c:b0:1d8:c74d:1ca0 with SMTP id adf61e73a8af0-1e5c6f15fc6mr47669277637.11.1735348279720;
        Fri, 27 Dec 2024 17:11:19 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e25951c2sm13868942a12.71.2024.12.27.17.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 17:11:19 -0800 (PST)
Message-ID: <ded394ec-a98e-4a89-a1f7-513b1e4fdb3e@gmail.com>
Date: Sat, 28 Dec 2024 10:11:16 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CodeSamples: Remove support for liburcu-signal
To: Leonardo Bras <lsoaresp@redhat.com>, perfbook@vger.kernel.org
Cc: paulmck@kernel.org, Leonardo Bras <leobras.c@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20241227225435.8119-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20241227225435.8119-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2024/12/28 7:52, Leonardo Bras wrote:
> Gitlab-CI is failing[1] on building CodeSamples due to ArchLinux
> deprecating support for liburcu-signal.
> 
> Currently liburcu-signal is not needed anymore, since upstream liburcu
> already include all needed symbols/functions to build CodeSamples.
> 
> Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it on
> linking stage.

So, this change is made in liburcu 0.15.0, right?

And it breaks builds with liburcu <0.15, no?

I'd like you to consider a more graceful approach considering non-ArchLinux
users.

        Thanks, Akira

> 
> [1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
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
