Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9E10F1
	for <perfbook@vger.kernel.org>; Sun, 29 Dec 2024 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735440449; cv=none; b=s58wMSZKI8DE6E54+Zfa3Lh6RdhSletTjCXR7ncZu3p7OkuyGuaQG9fyLF45kGxz5t7epWFkveSfnSxn/0TulLJWZuOshlYHdOW0ripxdMjSAkjgpGWjsiKdmROkKMlMswPCev28KNSqtFW0eXeROXSun4zviln1I7QediP5HhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735440449; c=relaxed/simple;
	bh=P1bbxOsi0VJccR7wPKFbjNupx17E4jiLSHL+PKfDdlI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uDATeVTQUJZTCGUtfcLIE+C06UWj5LHubZCpH6g8WYzEuQmObFQuj/Aj+wXNwXBrMCHKr6ktQ5rF7SJbpW9la0mO+Pcb5CnfACzoB0zo+bbf114t51S4klKlJNrzmEEYP+Fr7PnacxW035Sj499l43s9R85M6g7zjVh/FBbbbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NalrRgp4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NalrRgp4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166f1e589cso126231115ad.3
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735440446; x=1736045246; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luTqNjlLi8N3kglLsLiQ384ZcMp4e2SF1jIjRg81z9g=;
        b=NalrRgp44hBG9kSaqhnwYljZU/3e1AJPyfT6o/H9nwi6wiuGDfNGuWTRzq1kzx9frv
         D9aF15zEojRWnn4FEHvp1Hzv+huEALub2neOGavSYt4Lb1o4YniWaoHc38Mu3FOFtO+O
         vjA/5Vwt/HGsw20xl1q+sibB/FErSCCgdT+wlXruNUpZej/bvdvsy8xEfWIFmRkIim6N
         LLMMOV4py9HL3LjEu6vujxZZtQnC8N/LPXzBPhc0CNZIv8tpeSJEYBtwdaC7oZKbwTay
         JB2BV5BEu4m9EEQbTTB127/lM6b/5ueUBajF45TTsU2mZ25w9UO+7e6+y/Pl4rLsbRPA
         zL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735440446; x=1736045246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luTqNjlLi8N3kglLsLiQ384ZcMp4e2SF1jIjRg81z9g=;
        b=GOwuiTH4uE/hMopzguVLYY9H4i/8sg6KwtKqSYIAx4lY6dJm8yJO67+OE96h2nirlZ
         HIx4sxkqK7FWUxAZxR2zrFL94I3xRdtWoofioS5eqjOhQp2tesLjJxjlpWgg7PcsPAUL
         KIgD7xJi8bA+HrjTJSbvd0Ty40+sIQNVvfKMzwHF69HWXBhjGJj5po3E6sGG7y7vOmHE
         t8K7SsvGlAJgjXsk1QTPquqNJ77ijtQ5EbYd1NBXRiRBaCKWL0JB2nkUaw7HNR2RBHWA
         OCK7TqUwglZahwwOVLuJsFfhHvIDUpfPtpQtzgFmWgnaREFrHXcRgW02NgMbM3rdrCNJ
         rXXQ==
X-Gm-Message-State: AOJu0YyZ1WJF/t7wXifBfb2xSit7zDSMp3u7psUng1uetT+gCXJfP3XF
	uigkvHjNCZTmkzcIzQY7yNgPGUsiCbybPqmbyc8pr6DtkZ+M9GnK0cIKxA==
X-Gm-Gg: ASbGncvp3HqWlbwOie4r7/Jl5Xdf0PyRRYr+SObD3X9QJ+cJ6KULyQtWpdc8t+WfHkX
	Q9xuQLZtZH3OmIKNQ3/gJIEB0wh24F+MbKDawnxqBQwzen2etP8yzFPcbVMu+73LC2f3kXhX2jm
	/iDaurf9uGV7p9fOxpeQxn2IzihWnDQly/P4akOqTraxyJbh1fPaj94vo+QNsGv546rXSBPqUoO
	3J4yO8nwwEH42IEQRHiSuT3YrYztQIkoSa8eUUIqdTm84AAKs36VPU3CTIpYztopCyj++6N5IPq
	j+9gs5Q6SBPnjGAkWJj+Ow+bueU=
X-Google-Smtp-Source: AGHT+IHX6E72YXHeZHxmFVJXPCFOTalH7cAsJB46p58r2iSUuYH5Hq19PaYCIZamMo+lBf0ms8IjpA==
X-Received: by 2002:a05:6a20:841d:b0:1e1:af74:a236 with SMTP id adf61e73a8af0-1e5e0481b09mr47982762637.21.1735440446255;
        Sat, 28 Dec 2024 18:47:26 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816529sm16936029b3a.5.2024.12.28.18.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 18:47:25 -0800 (PST)
Message-ID: <b35b44d06e25eee8c4badb5828d540469a8edbe0.camel@gmail.com>
Subject: Re: [PATCH v4] CodeSamples: Fix liburcu-signal support deprecation
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: perfbook@vger.kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, paulmck@kernel.org
Date: Sat, 28 Dec 2024 23:47:21 -0300
In-Reply-To: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
References: <50dd7b4054a31ea2fe7f8cf61cb285162bea8107.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 23:29 -0300, Leonardo Br=C3=A1s wrote:
> Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> deprecating[2] support for liburcu-signal:
>=20
> %%%
>    * Deprecation of liburcu-signal
>=20
> Users can migrate to liburcu-memb with a kernel implementing the
> membarrier(2) system call to have similar read-side performance without
> requiring use of a reserved signal, and with improved grace period
> performance.
> %%%
>=20
> So, in order to avoid breaking builds with liburcu >=3D0.15 while keeping
> support for older systems without sys_membarrier(), check for the existan=
ce
> of liburcu-signal before adding it to the build command.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  CodeSamples/datastruct/Issaquah/Makefile  |  5 ++--
>  CodeSamples/datastruct/existence/Makefile | 34 ++++++++++++-----------
>  CodeSamples/datastruct/hash/Makefile      |  7 +++--
>  CodeSamples/datastruct/skiplist/Makefile  |  5 ++--
>  CodeSamples/defer/Makefile                |  7 +++--
>  5 files changed, 32 insertions(+), 26 deletions(-)
>=20
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datas=
truct/Issaquah/Makefile
> index c3b724d7..6a51ff90 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -26,29 +26,30 @@ include $(top)/depends.mk
>  ifeq ($(strip $(target)),)
>  all:
>  	@echo "### None in datastruct/Issaquah/ can be built on arch: '$(arch)'=
."
>  else
>  all: $(PROGS)
>  endif
> =20
>  include $(top)/recipes.mk
> =20
>  GCC_ARGS +=3D -fcommon
> +LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
> =20
>  # NOTE:  For decent scalability on update-side tests as of early 2015,
>  #	 use something like jemalloc() instead of glibc malloc().
>  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
>  #	 need the following additional arguments to cc:
>  #		-I/home/paulmck/jemalloc/include
>  #		-L/home/paulmck/jemalloc/lib
>  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
>  #		-DUSE_JEMALLOC
>  #	 Verify by using the nm command and searching output for malloc.
> =20
>  existence_test: existence.c existence_test.c
> -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread=
 -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread=
 -lurcu $(LURCU_SIG)
> =20
>  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api=
.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/=
random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/=
random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/data=
struct/existence/Makefile
> index 19891c0f..ac1fb198 100644
> --- a/CodeSamples/datastruct/existence/Makefile
> +++ b/CodeSamples/datastruct/existence/Makefile
> @@ -22,62 +22,64 @@ PROGS =3D existence_test \
>  	existence_3hash_uperf \
>  	existence_3skiplist_test \
>  	existence_3skiplist_uperf \
>  	kaleidoscope_test \
>  	kaleidoscope_3hash_test \
>  	kaleidoscope_3skiplist_test \
>  	kaleidoscope_skiphash_test \
>  	procon_test
>  LIB =3D ../../lib
> =20
> +LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
> +
>  all: $(PROGS)
> =20
>  # NOTE:  For decent scalability on update-side tests as of early 2015,
>  #	 use something like jemalloc() instead of glibc malloc().
>  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
>  #	 need the following additional arguments to cc:
>  #		-I/home/paulmck/jemalloc/include
>  #		-L/home/paulmck/jemalloc/lib
>  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
>  #		-DUSE_JEMALLOC
>  #	 Verify by using the nm command and searching output for malloc.
>  #
>  #	So it is quite a bit easier to just use the default locations.  ;-)
> =20
>  existence_test: existence.h existence_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lur=
cu-signal
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu $(LU=
RCU_SIG)
> =20
>  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3ha=
sh_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread=
 -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread=
 -lurcu $(LURCU_SIG)
> =20
>  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3h=
ash_uperf.c procon.h
> -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3ha=
sh_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmal=
loc -lpthread -lurcu -lurcu-signal
> +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3ha=
sh_uperf.c -ltcmalloc -lpthread -lurcu $(LURCU_SIG)
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmal=
loc -lpthread -lurcu $(LURCU_SIG)
> =20
>  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h exist=
ence_3skiplist_test.c procon.h
> -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)=
/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c=
 $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)=
/random.c -lpthread -lurcu $(LURCU_SIG)
> +	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c=
 $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existenc=
e_3skiplist_uperf.c procon.h
> -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence=
_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signa=
l
> -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c=
 -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence=
_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c=
 -ltcmalloc $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurc=
u -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurc=
u $(LURCU_SIG)
> =20
>  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleido=
scope_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lp=
thread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lp=
thread -lurcu $(LURCU_SIG)
> =20
>  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h=
 kaleidoscope_3skiplist_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_=
test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c =
$(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> +	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_=
test.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h =
kaleidoscope_skiphash_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_te=
st.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(=
LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> +	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_te=
st.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  procon_test: procon.h procon_test.c
> -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> -	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-s=
ignal
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu $(LURCU_SIG)
> +	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu $(LURCU_=
SIG)
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruc=
t/hash/Makefile
> index a56255a2..7f244e09 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -26,40 +26,41 @@ include $(top)/depends.mk
>  ifeq ($(strip $(target)),)
>  all:
>  	@echo "### None in datastruct/hash/ can be built on arch: '$(arch)'."
>  else
>  all: $(PROGS)
>  endif
> =20
>  include $(top)/recipes.mk
> =20
>  GCC_ARGS +=3D -fcommon
> +LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
> =20
>  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lpth=
read
> =20
>  hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/random=
.c -lpthread
> =20
>  hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bk=
t_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> =20
>  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random=
.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazp=
tr.h ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../d=
efer/hazptr.c $(LIB)/random.c -lpthread
> =20
>  hash_global: hash_global.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c=
 -lpthread
> =20
>  hash_resize: hash_resize.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c=
 -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c=
 -lpthread -lurcu $(LURCU_SIG)
> =20
>  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/rand=
om.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c=
 -lpthread
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datas=
truct/skiplist/Makefile
> index 3a555691..eda1af11 100644
> --- a/CodeSamples/datastruct/skiplist/Makefile
> +++ b/CodeSamples/datastruct/skiplist/Makefile
> @@ -24,19 +24,20 @@ top :=3D ../..
>  include $(top)/depends.mk
> =20
>  ifeq ($(strip $(target)),)
>  all:
>  	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch)'=
."
>  else
>  all: $(PROGS)
>  endif
> =20
>  include $(top)/recipes.mk
> +LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal  2>/dev/null)
> =20
>  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LI=
B)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.=
h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_=
glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_=
glock.c $(LIB)/random.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 3cf3e5a5..abfbe202 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -55,39 +55,40 @@ include $(top)/depends.mk
>  ifeq ($(strip $(target)),)
>  all: $(ARCH_INDEPENDENT)
>  	@echo "### $(ARCH_DEPENDENT) in defer/ can't be built on arch: '$(arch)=
'."
>  else
>  all: $(PROGS)
>  endif
> =20
>  include $(top)/recipes.mk
> =20
>  GCC_ARGS +=3D -fcommon
> +LURCU_SIG :=3D $(shell pkg-config --libs liburcu-signal 2>/dev/null)
> =20
>  # Note that bug_srcu_a is disabled until completed.
>  bug_srcu_a: bug_srcu_a.c srcu.c ../api.h
>  	cc $(GCC_ARGS) -o bug_srcu_a -DTEST bug_srcu_a.c -lurcu -lpthread
> =20
>  bug_rcu_dp: bug_rcu_dp.c ../api.h
>  	cc $(GCC_ARGS) -o bug_rcu_dp -DTEST bug_rcu_dp.c -lurcu -lpthread
> =20
>  gettimestamp: gettimestamp.c ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
> =20
>  gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
> =20
>  hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
>  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> =20
>  ptxroute: ptxroute.c ../api.h
> -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu $(LURCU_SIG)
> =20
>  rcu: rcu.c rcu.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> =20
>  rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
> =20
>  rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
> =20
> @@ -124,32 +125,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcutort=
ure.h
>  rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
> =20
>  rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
> =20
>  route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.h =
../lib/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c =
-lpthread
> =20
>  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetor=
ture.h
> -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lur=
cu -lurcu-signal
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lur=
cu $(LURCU_SIG)
> =20
>  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c rou=
tetorture.h
>  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c =
-lpthread  -lurcu-qsbr
> =20
>  route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c ro=
utetorture.h
>  	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthread
> =20
>  route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routetor=
ture.h
>  	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
> =20
>  route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../lib=
/random.c routetorture.h
>  	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpthre=
ad
> =20
>  seqlocktorture: seqlocktorture.c seqlock.h ../api.h
>  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> =20
>  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthr=
ead  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthr=
ead  -lurcu $(LURCU_SIG)
> =20
>  clean:
>  	rm -f $(PROGS)
>=20

This was approved for v0.15 by this pipeline:
https://gitlab.com/linux-kernel/perfbook/-/pipelines/1605171467

Akira, please test for older versions.

Thanks!
Leo


