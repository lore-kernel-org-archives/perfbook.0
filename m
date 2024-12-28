Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57719539F
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735410190; cv=none; b=hPTAHyTU3LsSX1r7JctAg33LYSQnQ53EABKZgSSoq4iNJ8kUKucIrVxgo/0rWprryg7+TxPIgQfOA4EaJoi9Ecl3AE2/gk1D0wteGVDEJ42VmuV23buoUQlyuY5p7R+Xfym9PVlMDjJCdUxzWa3GIQ4dKm3v9qeBRMPmpLKPwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735410190; c=relaxed/simple;
	bh=yJdPMB1oRJh36dT848wqHBTnz7PVbeWzjFwU/IndlEA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fihgDfwuFXB0NgIGjI7HxExy93YHFBYnSDb2WAa40MGyDO1u3zLm2ICy1zOe+tiYmr4w897K0zJj0XR8/ZEpF7IAGlERzu++6kjPCSuDcvEizfK7Y2K18nGbFjOPWkhyd0XnF3AnJ9TJ1MbE2pHfgTej5kvt6cKnHy8pYCkMd/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPYGzwiD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPYGzwiD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so7575792a91.3
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 10:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735410186; x=1736014986; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u+0vk2UPKN+hbClWyhI+CMn6l6RqphiV3EkPjwFVDK4=;
        b=PPYGzwiD3+laamz7C3BfRWkxtRp556Ru82pBM9DY2pDFbeW9iHIASifie6hKYwZuaR
         4xmwf1fWLKILFM+EwUIwhepFjMnr5TbNKg/cjcCy8riIPIU0wIyWtUnH772TNIYQoHV4
         cJVxvkKKLicVxOa2/pxZyISbL+NLKCxfyWqzrOS38sT5M3SuQeMzZp4KphZpti6Zvkn+
         8Zkjzv+O+H67ixpC5OR/hs30c2I9C0CVrQ2uZ4io/Hq7JKG/U84w9pC6+ua4aQn2U9pB
         OPslpBfg3gZiY61ltzJ+PZHXrQNWgA2NfI4BuRXtUZBV5zHnir72IzksP34ogX7ovJQ7
         T0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735410186; x=1736014986;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+0vk2UPKN+hbClWyhI+CMn6l6RqphiV3EkPjwFVDK4=;
        b=ZCZv/VYvy+4VRCnyOTi2xgETPZKuTsZbAsInzsWTKv053V6vewRmhqOXs3kYw0JwY3
         8NucJWK9D/bg6CcxcrM83HH0Uvffrtq/qhwp7TimVBTzAzJCH+RqB48cDNgVa8VNH76Z
         krJZabHPoKX42P0pH6AwIoBPTfdgHULBDefvkF3z7pZImA8SZJQSRhBBWBj4D/aVQUb0
         9N6WSxPhmgcPPShgSKjWmO5ReOOWVb06bsa037XrrsY8rEXPM8NAbOxGC1AsMyAICbQl
         rPOlw1G8HUD7/yIRI0yricmU6G2Q5dWxKz1BkzubQinz3NmrwGzN2BBfwkhGfuw1NBgx
         kydw==
X-Gm-Message-State: AOJu0YyRmVUKO31GHkgvdKPcMXIVxWoebHfzwbVzJETLjesurBXsN8zN
	roT3GE5J9/IJgiICZvjxZUFqZJI8iFArUzX8qjU74mS8BMZAk9dU
X-Gm-Gg: ASbGncuszQIhMqbtVrFZgvex0JQ0ycH2uijNJjSpC5UNcWt/vQIz5z+/A/vLjpcg7vG
	jzvwD9Qk/VFyIa8q+2j3xGuEp9W4Uw/Uy6yNWMvOXeVt8GZoZXDak31VgUuC3LadxrZVr5FLNgJ
	a0EoWTT6hqCf1f6km6mXLjXQsG95aaNnX3FHxFMHGQr8Xs38gNG+vrR2TYaBhO/ARnGR3U3wIFz
	91XFYKDwIfoeX40h2JzAyYbzWh+1F5vy0kkN5ZSZUILah7L5uhtoGaZpYzCXWpGW1BJJoLxpFgQ
	VZkwxRIAxjokswaEocFNZkPxAP4=
X-Google-Smtp-Source: AGHT+IFA4NKuImL6LPXhH3IqVQIy2dVdeTMZHUmgfmsgyrg+qi28ekGfouRVp+cW71EiWTjBE8aK7A==
X-Received: by 2002:a17:90b:2545:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-2f452e49630mr46252542a91.19.1735410186487;
        Sat, 28 Dec 2024 10:23:06 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9a661esm12977408a91.2.2024.12.28.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:23:06 -0800 (PST)
Message-ID: <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 15:23:01 -0300
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

Hi Akira,

That's a creative way of dealing with this issue, but if we want to add tha=
t
complexity, I would rather use $(pkg-config --libs liburcu).=20

Wouldn't this fix the issue as well?

Thanks!
