Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5535974
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735410631; cv=none; b=FisMQW83/RXWuE6w7RRfSELq0bX211kRcnCDShCYN7p/9Kuk+jqKyw+G5JdO3p+g4mUW2HDlx/b07HQ84nWY5/rsZ2J92V9daB8HYZacS2yl7z4O8InCDT06AUBs82TsH5xIdy4LdSLLRVwFJKhZYhBqeMyCtk9gUTyzi3ztwrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735410631; c=relaxed/simple;
	bh=0fVl2r3aT6T02YWQVpAUWZPPc6qvb/qbgqObY/aAQM4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f8Hdu2s3uDZgKhwQbnPF+kkisFx4E3Murx6DqIrKzSG8/E+xKLdRAgekUUmyhf0ND1ZtsaxJvZapsuR09S0Fk5jpNbrT0+4oDm6sjgG+h+3g0TSknF3T7ZmxMI24wcEUth0zkHTdpGIKIefq9S6OHX7tkVwxkGn4FR1/kuBzIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjAF/797; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjAF/797"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166360285dso102419475ad.1
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735410628; x=1736015428; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JXvB1LrbuBEoeO5wLRtnD7WbGubygJMfrpb05J6OBGg=;
        b=JjAF/797mIQEwNjyh3m37T/33AIpjx41v3bkPf2sJ3vbMAnpLUooyJNc43dE6QkTiy
         KzNkzExjwPtUVFXYzUR0qjHxKhKZKiSRM3UKuOInaACoQmnTiIeLYKG1JWDOAoQ6aY9k
         enjBi2xX4+2kBBbh4vSTUiSzLYS4TfvBVjbLXd/YDKSNkXr7fh1z1FfeEg7yX1aS3308
         mNZ22aGOTDcJpYH4q2YsuAo6ITZnO8Gdfc0m7gpiCxpbN5DCpqv36TQAEAP8RNKfU6M2
         DDQkp4v4udPAeqfAKG0rHxRJLwxcUeL3OdU68OKOqBE0bMkXHWZleINPslT1aBZ4PA4D
         BHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735410628; x=1736015428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXvB1LrbuBEoeO5wLRtnD7WbGubygJMfrpb05J6OBGg=;
        b=Zjwf/9d+NHzeOhoR0Ieg07LrIuoyR6W+6pjHicoEZ8HsW4goEBx7/5aLgL4Hy/7cwg
         Vl58lEH6YNtEiUKD770Kp9M6KC8dhkPz9ffJm78mNyiYndz6mzhoYVGYtlIJvPShmYCg
         WiU0kw+P2qZ3vPXqgNxD4Tu+h+j68xPOpBO9QbCf4wHNyIKbvSNqYNzoLRgbZYtNbaH/
         DYFng66mMde2giNEfwXuJAiY7zVe2nfnbwnHXI6BSMjaFzUPQzZmJGg921KhxbWVGLt2
         b4Q+Bps24Abk12l/bh2LZiPn9xF43ycWjnTSqQWtYMi4nGkhjfqG1fQCA/BjfVH64LAt
         ftpA==
X-Gm-Message-State: AOJu0YxPTqMZ8t7ahdmbhgXSC9rkdI6IuV7p3vtkNEozl7ewmz1ROUkC
	74dhutmP8C2QxxRDjK3aPKiXrrHC9N5m4bMCsRSImyRvnkw3fgJ2
X-Gm-Gg: ASbGncsb5wLj4dQ8cEGD9hQBNuoYCyDXF/EvonUHftD7xsc2XsDZ6pDQXQZjmfUn1RP
	gJh6cukOlREjEpMNrkrB89OYXIImQL1skV1DsVkP3a+ltTwjGrqn0pWpubUVMk7kOggE1dlAZP6
	+ZiIoMWJF7+n3ZdgXCDnWre6aBdGLcuNDd8mGBQOMXabkYwr9s1kJ9mmaG1nwJWLMa2l6dngPhJ
	yfzWn5jEqgq9xWVzAArngAsfsz8xYZmQjyW6snXjrrsytc4L1Q1ef5ez1xctDx9H8Y4Px0Zqu93
	cbFPmyQPHhCkHhF/5gwsgWmm+p0=
X-Google-Smtp-Source: AGHT+IGtqj5iKvGKAMkjFWCBBMEUz9dqkxnEVtWBji7k3ug/s6Rc/eV+br7sl9sT6+nBPlfy9tBtbA==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:adfe:c43 with SMTP id adf61e73a8af0-1e5e045874amr49568020637.9.1735410628095;
        Sat, 28 Dec 2024 10:30:28 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-8c3a45926e5sm5838884a12.61.2024.12.28.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:30:27 -0800 (PST)
Message-ID: <220ea10aa02438d2878120325ec0a6e01e157eed.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 15:30:23 -0300
In-Reply-To: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 16:12 +0900, Akira Yokosawa wrote:
> From: Leonardo Bras <leobras.c@gmail.com>
>=20
> liburcu 0.15.0 deprecated urcu-signal as a library.
> This causes build errors in gitlab-CI [1]:
>=20
>     /usr/sbin/ld: cannot find -lurcu-signal: No such file or directory
>     collect2: error: ld returned 1 exit status
>=20
> Work around them by adding command lines w/o "-lurcu-signal" as
> fallbacks in relevant Makefile recipes.
>=20
> Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
> [akiyks: rewrite changelog, restore compatibility with liburcu <0.15.0]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
>=20
> Admittedly, this is one of the least elegant workaround for ArchLinux
> and soon-to-be upgraded other rolling distros, but still looks straight
> forward to me.
>=20
> Can you live with this?
>=20
> This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
> Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
> and ArchLinux (liburcu 0.15.0).

Also, all above systems already include sys_membarrier(), as they include k=
ernel
versions above v4.2. =20

>=20
>         Thanks, Akira
> --
>  CodeSamples/datastruct/Issaquah/Makefile  |  6 +++--
>  CodeSamples/datastruct/existence/Makefile | 30 +++++++++++++++--------
>  CodeSamples/datastruct/hash/Makefile      |  9 ++++---
>  CodeSamples/datastruct/skiplist/Makefile  |  6 +++--
>  CodeSamples/defer/Makefile                |  9 ++++---
>  5 files changed, 40 insertions(+), 20 deletions(-)
>=20
> diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datas=
truct/Issaquah/Makefile
> index c3b724d7..75fd840b 100644
> --- a/CodeSamples/datastruct/Issaquah/Makefile
> +++ b/CodeSamples/datastruct/Issaquah/Makefile
> @@ -45,10 +45,12 @@ GCC_ARGS +=3D -fcommon
>  #	 Verify by using the nm command and searching output for malloc.
> =20
>  existence_test: existence.c existence_test.c
> -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread=
 -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread=
 -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthread=
 -lurcu
> =20
>  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../api=
.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/=
random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/=
random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB)/=
random.c -lpthread -lurcu
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/data=
struct/existence/Makefile
> index 19891c0f..568e7c2d 100644
> --- a/CodeSamples/datastruct/existence/Makefile
> +++ b/CodeSamples/datastruct/existence/Makefile
> @@ -44,39 +44,49 @@ all: $(PROGS)
>  #	So it is quite a bit easier to just use the default locations.  ;-)
> =20
>  existence_test: existence.h existence_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lur=
cu-signal
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -lur=
cu-signal || \
> +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
> =20
>  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3ha=
sh_test.c procon.h
> -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread=
 -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread=
 -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthread=
 -lurcu
> =20
>  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_3h=
ash_uperf.c procon.h
>  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3ha=
sh_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmal=
loc -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmal=
loc -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcmal=
loc -lpthread -lurcu
> =20
>  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h exist=
ence_3skiplist_test.c procon.h
> -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)=
/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)=
/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LIB)=
/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test.c=
 $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> =20
>  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existenc=
e_3skiplist_uperf.c procon.h
>  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existence=
_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signa=
l
> -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c=
 -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c=
 -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf.c=
 -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> =20
>  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurc=
u -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurc=
u -lurcu-signal || \
> +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lurc=
u
> =20
>  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kaleido=
scope_3hash_test.c procon.h
> -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lp=
thread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lp=
thread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -lp=
thread -lurcu
> =20
>  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue.h=
 kaleidoscope_3skiplist_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.c =
$(LIB)/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_=
test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> =20
>  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.h =
kaleidoscope_skiphash_test.c procon.h
> -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c $(=
LIB)/random.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_te=
st.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> =20
>  procon_test: procon.h procon_test.c
> -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal |=
| \
> +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
>  	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu-s=
ignal
> =20
>  clean:
> diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruc=
t/hash/Makefile
> index a56255a2..a558dfee 100644
> --- a/CodeSamples/datastruct/hash/Makefile
> +++ b/CodeSamples/datastruct/hash/Makefile
> @@ -44,7 +44,8 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_bk=
t_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> =20
>  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/random=
.c -lpthread -lurcu
> =20
>  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/hazp=
tr.h ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../../d=
efer/hazptr.c $(LIB)/random.c -lpthread
> @@ -53,10 +54,12 @@ hash_global: hash_global.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random.c=
 -lpthread
> =20
>  hash_resize: hash_resize.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c=
 -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c=
 -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random.c=
 -lpthread -lurcu
> =20
>  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/rand=
om.c -lpthread -lurcu
> =20
>  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
>  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random.c=
 -lpthread
> diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/datas=
truct/skiplist/Makefile
> index 3a555691..8cf9d47a 100644
> --- a/CodeSamples/datastruct/skiplist/Makefile
> +++ b/CodeSamples/datastruct/skiplist/Makefile
> @@ -33,10 +33,12 @@ endif
>  include $(top)/recipes.mk
> =20
>  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(LI=
B)/random.c -lpthread -lurcu
> =20
>  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplist.=
h
> -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_=
glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_=
glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplist_=
glock.c $(LIB)/random.c -lpthread -lurcu
> =20
>  clean:
>  	rm -f $(PROGS)
> diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> index 3cf3e5a5..b4af17db 100644
> --- a/CodeSamples/defer/Makefile
> +++ b/CodeSamples/defer/Makefile
> @@ -80,7 +80,8 @@ hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
>  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> =20
>  ptxroute: ptxroute.c ../api.h
> -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal ||=
 \
> +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
> =20
>  rcu: rcu.c rcu.h ../api.h rcutorture.h
>  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> @@ -131,7 +132,8 @@ route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api=
.h ../lib/random.h ../lib/r
>  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.c =
-lpthread
> =20
>  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routetor=
ture.h
> -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lur=
cu -lurcu-signal
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lur=
cu -lurcu-signal || \
> +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -lur=
cu
> =20
>  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c rou=
tetorture.h
>  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.c =
-lpthread  -lurcu-qsbr
> @@ -149,7 +151,8 @@ seqlocktorture: seqlocktorture.c seqlock.h ../api.h
>  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> =20
>  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthr=
ead  -lurcu -lurcu-signal
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthr=
ead  -lurcu -lurcu-signal || \
> +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpthr=
ead  -lurcu
> =20
>  clean:
>  	rm -f $(PROGS)
>=20
> base-commit: 4c0afec5a7081227adc768fb8d3fb35aa1981d55

