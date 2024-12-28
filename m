Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEEDA94D
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735351513; cv=none; b=J+rUPkeY2F5tvpH6AP4fyUaj4AHVYkS7dbWpNti25PQQ/kMU5zGdsqJhWzc3LAgkpFftHNmObp3HS1ELmXeRtF9Y83Xok3l/OjPPGO2bN2jEaDPVgh4k8ic2rkR/vDO2oX/eaKlrQtMM7g2vFWS5gcOoml6uZLm9/eKvXQN0HUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735351513; c=relaxed/simple;
	bh=+0wMU1VLAIzqXVEaDjb+ZreRFht7PQsPBLB+MvGvMK4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CvXH2cirIDbLBxHTsYWTGPXtKJtcNZwbhb9AUY6Lomk/QDO5lCDXWmO0QzKcPPdg92pfiZKek/QU9ExXyQjbzG7cUEH3ghC4VEIJaErHa4c74zSUnOuYekmhInqUAH0VWgYTStd1W4WAucUW4gwhMeenW8wXC1c4Ono2nSGZPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/wziOdz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/wziOdz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21644aca3a0so30271535ad.3
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 18:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735351511; x=1735956311; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YsAsbTLRVKobHi4+3qEaU5FOH2mgFQ7hlgTTMyJA8AA=;
        b=m/wziOdzu4xj+gTYq+jsO+a8bioS2SrM69rSCG2QlnHXrM+asAiEoU1bTK6y329pTt
         BI7CUtanfgXIprShH2G7rfZ671ZaDMhU3vpYW/+/m+FVG2ndDKOc2zS3wzvMeH/RBGVr
         MUCSCQqOzvaU1dQAsJ1FWiS8ssEsBp0bsILA4++erikRRUC0uWFNiwvItWqKyacNOmIE
         58iUOo1tqbuX13NAVaKNT1UtaXSB2wmBVwRNcGd7clSePTomb8XOtctJmej8Lm1XpDsm
         +moBQDK5tIZHDAtXxsgMg7i6v4tgE1m6WvDoZV7kXQNnQpMqcXALNrvJa6GpL5Bc7ICo
         onaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735351511; x=1735956311;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsAsbTLRVKobHi4+3qEaU5FOH2mgFQ7hlgTTMyJA8AA=;
        b=WAs4eNUyXrHBZt30nWnzWIwtnx1paN5bNmlZ95BKVyxKFVyNqUQAZ411aItIKRX32y
         QdWgfVJ0rT4asjuHfUaRz5vufeQTFUzMc7X+u0XRaeN5WYRfHHM533oX81gZsvqRW82u
         H1cCfVmAnzWU0rocrC68TOJIWGBbH+NlTHIprDFsbfZL0VkQBCq+uHRmyChOo0yS7D0D
         j81RCHFPi+KroEydpIGuPCYcFCpq2x6w2NrSp8xJzoD5JbAA0c6BJFyhlayFwQNMKq/0
         pkqQriAdt1Or1ap7ShaAQsz4rzyRtzQEmK6RfK0N0V5P942kRDSYp+AmOE0270HnzJ2D
         L5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+A9AFi/ME4KguMimD45pgmcYawe31J+QCtjpAaqLpGYEl1MebJmfCmFl9GWYKKLdeJlqNWkSPow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cFxC6YaifT93C7f6RgMXqSdK8/EzUd+i4Iqds+ghtQvdNIp2
	JjN9Vq2yhJtfFaLOLBruaF8Nx1eyWue6JT2WxihQNRXYjXuvsx0nxMEeLw==
X-Gm-Gg: ASbGnct1QaUBXvoCsfCdlZS7+jXxvY5AzZhRPiwU/Kj9mPdlAW6UGjaeQMkSABvVvEg
	xmeetaCBdL2ne58upxNNXeeaIHqG//GADMS1ZKRvkMleik/MVasMqN8kT/tw5pjvtpF0N4J6VeJ
	aDrOE9NxSUMiSIPghoRYgPi8J1W3l6tAGkkGr897RN0Df92aJp3aQ/EeYfQmUuBMh3UCTXcMJVn
	y3P7punscq0Ut7bjtOWoD8SYV4PHGzdAMR90BuPNclMOclkGx5fqU8TLECL+obbCuGZVxL80t30
	L/+Wsojz+q7zEt1mpI/iSPxy6NY=
X-Google-Smtp-Source: AGHT+IEjA9T7bPBMknQukMJq9rMoiVN3GJAYRSTKKQb48mJuZN3ZcNbj/loN2dxk1WY9fGfJRjIWGA==
X-Received: by 2002:a05:6a21:3284:b0:1e0:d859:e1bd with SMTP id adf61e73a8af0-1e5e0458e81mr44164385637.1.1735351511096;
        Fri, 27 Dec 2024 18:05:11 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8163fdsm15224197b3a.6.2024.12.27.18.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 18:05:10 -0800 (PST)
Message-ID: <c21a45c46ce861b7f247590662c71dd37b66b8ba.camel@gmail.com>
Subject: Re: [PATCH v2] CodeSamples: Remove support for liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Cc: paulmck@kernel.org
Date: Fri, 27 Dec 2024 23:05:07 -0300
In-Reply-To: <5a25758a-4f5a-43e8-9aae-b6709d601c78@gmail.com>
References: <20241228012954.13874-1-leobras.c@gmail.com>
	 <5a25758a-4f5a-43e8-9aae-b6709d601c78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 10:54 +0900, Akira Yokosawa wrote:
> Hi,
>=20
> Looks like I didn't make my point clear enough...
>=20
> On 2024/12/28 10:29, Leonardo Bras wrote:
> > Gitlab-CI is failing[1] on building CodeSamples due to liburcu v0.15
> > deprecating[2] support for liburcu-signal:
> >=20
> > %%%
> >    * Deprecation of liburcu-signal
> >=20
> > Users can migrate to liburcu-memb with a kernel implementing the
> > membarrier(2) system call to have similar read-side performance without
> > requiring use of a reserved signal, and with improved grace period
> > performance.
> > %%%
> >=20
> > Also, from liburcu.org:
> >=20
> > %%%
> > Usage of liburcu
> > 1. #include <urcu.h>
> > 2. Link the application with -lurcu
> >=20
> > This is the preferred version of the library, in terms of grace-period
> > detection speed, read-side speed and flexibility. Dynamically detects
> > kernel support for sys_membarrier(). Falls back on urcu-mb scheme if
> > support is not present, which has slower read-side.
> > %%%
> >=20
> > Which tl;dr means for any system running a current version of liburcu,
> > liburcu-signal should not be needed to build/run the CodeSamples.
> >=20
> > Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it =
on
> > linking stage.
>=20
> No, this change will break builds with liburcu <0.15.
>=20
> What I wanted say was to keep building with liburcu <0.15 possible.
> Not to expand the changelog...
>=20
> I don't think it is reasonable to expect people install latest liburcu.
> right away.
>=20
> Please reconsider.

Oh, I see the point.

I understand the issue, and I think we could check for an older liburcu ver=
sion
to add the -lurcu-signal only for versions < 0.15.

On the other hand, sys_membarrier() was introduced in 2015 (5b25b13ab08f6),=
 and
no supported kernel (>v4.2) should still miss this syscall. Is it worth the
added complexity? Is so, let's do it.

Thanks!
Leo

>=20
>         Thanks, Akira
>=20
> >=20
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> >=20
> > [1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
> > [2] https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.ht=
ml
> >=20
> > ---
> >  CodeSamples/datastruct/Issaquah/Makefile  |  4 +--
> >  CodeSamples/datastruct/existence/Makefile | 32 +++++++++++------------
> >  CodeSamples/datastruct/hash/Makefile      |  6 ++---
> >  CodeSamples/datastruct/skiplist/Makefile  |  4 +--
> >  CodeSamples/defer/Makefile                |  6 ++---
> >  5 files changed, 26 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/dat=
astruct/Issaquah/Makefile
> > index c3b724d7..187d10a7 100644
> > --- a/CodeSamples/datastruct/Issaquah/Makefile
> > +++ b/CodeSamples/datastruct/Issaquah/Makefile
> > @@ -38,17 +38,17 @@ GCC_ARGS +=3D -fcommon
> >  #	 use something like jemalloc() instead of glibc malloc().
> >  #	 If you install jemalloc at /home/paulmck/jemalloc, you will
> >  #	 need the following additional arguments to cc:
> >  #		-I/home/paulmck/jemalloc/include
> >  #		-L/home/paulmck/jemalloc/lib
> >  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
> >  #		-DUSE_JEMALLOC
> >  #	 Verify by using the nm command and searching output for malloc.
> > =20
> >  existence_test: existence.c existence_test.c
> > -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthre=
ad -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthre=
ad -lurcu
> > =20
> >  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../a=
pi.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> > -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB=
)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB=
)/random.c -lpthread -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/da=
tastruct/existence/Makefile
> > index 19891c0f..027d54fb 100644
> > --- a/CodeSamples/datastruct/existence/Makefile
> > +++ b/CodeSamples/datastruct/existence/Makefile
> > @@ -37,47 +37,47 @@ all: $(PROGS)
> >  #	 need the following additional arguments to cc:
> >  #		-I/home/paulmck/jemalloc/include
> >  #		-L/home/paulmck/jemalloc/lib
> >  #		-Wl,--rpath,/home/paulmck/jemalloc/lib
> >  #		-DUSE_JEMALLOC
> >  #	 Verify by using the nm command and searching output for malloc.
> >  #
> >  #	So it is quite a bit easier to just use the default locations.  ;-)
> > =20
> >  existence_test: existence.h existence_test.c procon.h
> > -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -l=
urcu-signal
> > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
> > =20
> >  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3=
hash_test.c procon.h
> > -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthre=
ad -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthre=
ad -lurcu
> > =20
> >  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_=
3hash_uperf.c procon.h
> > -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3=
hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> > -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcm=
alloc -lpthread -lurcu -lurcu-signal
> > +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3=
hash_uperf.c -ltcmalloc -lpthread -lurcu
> > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcm=
alloc -lpthread -lurcu
> > =20
> >  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h exi=
stence_3skiplist_test.c procon.h
> > -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal
> > -	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test=
.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LI=
B)/random.c -lpthread -lurcu
> > +	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test=
.c $(LIB)/random.c -lpthread -lurcu
> > =20
> >  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existe=
nce_3skiplist_uperf.c procon.h
> > -	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existen=
ce_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-sig=
nal
> > -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf=
.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existen=
ce_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf=
.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > =20
> >  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> > -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lu=
rcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lu=
rcu
> > =20
> >  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kalei=
doscope_3hash_test.c procon.h
> > -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -=
lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -=
lpthread -lurcu
> > =20
> >  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue=
.h kaleidoscope_3skiplist_test.c procon.h
> > -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.=
c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > -	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplis=
t_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.=
c $(LIB)/random.c -lpthread -lurcu
> > +	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplis=
t_test.c $(LIB)/random.c -lpthread -lurcu
> > =20
> >  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.=
h kaleidoscope_skiphash_test.c procon.h
> > -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > -	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_=
test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c =
$(LIB)/random.c -lpthread -lurcu
> > +	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_=
test.c $(LIB)/random.c -lpthread -lurcu
> > =20
> >  procon_test: procon.h procon_test.c
> > -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> > -	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu=
-signal
> > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
> > +	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastr=
uct/hash/Makefile
> > index a56255a2..7d47485a 100644
> > --- a/CodeSamples/datastruct/hash/Makefile
> > +++ b/CodeSamples/datastruct/hash/Makefile
> > @@ -37,29 +37,29 @@ GCC_ARGS +=3D -fcommon
> >  hash_bkt: hash_bkt.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt hash_bkt.c $(LIB)/random.c -lp=
thread
> > =20
> >  hash_bkt_ref: hash_bkt_ref.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_ref hash_bkt_ref.c $(LIB)/rand=
om.c -lpthread
> > =20
> >  hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_=
bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> > =20
> >  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/rand=
om.c -lpthread -lurcu
> > =20
> >  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/ha=
zptr.h ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../..=
/defer/hazptr.c $(LIB)/random.c -lpthread
> > =20
> >  hash_global: hash_global.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random=
.c -lpthread
> > =20
> >  hash_resize: hash_resize.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random=
.c -lpthread -lurcu
> > =20
> >  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/ra=
ndom.c -lpthread -lurcu
> > =20
> >  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random=
.c -lpthread
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/dat=
astruct/skiplist/Makefile
> > index 3a555691..931c8c1c 100644
> > --- a/CodeSamples/datastruct/skiplist/Makefile
> > +++ b/CodeSamples/datastruct/skiplist/Makefile
> > @@ -26,17 +26,17 @@ include $(top)/depends.mk
> >  ifeq ($(strip $(target)),)
> >  all:
> >  	@echo "### None in datastruct/skiplist/ can be built on arch: '$(arch=
)'."
> >  else
> >  all: $(PROGS)
> >  endif
> > =20
> >  include $(top)/recipes.mk
> > =20
> >  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(=
LIB)/random.c -lpthread -lurcu
> > =20
> >  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplis=
t.h
> > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplis=
t_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplis=
t_glock.c $(LIB)/random.c -lpthread -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> > index 3cf3e5a5..8454a9ed 100644
> > --- a/CodeSamples/defer/Makefile
> > +++ b/CodeSamples/defer/Makefile
> > @@ -73,21 +73,21 @@ bug_rcu_dp: bug_rcu_dp.c ../api.h
> >  gettimestamp: gettimestamp.c ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o gettimestamp -DTEST gettimestamp.c -lpthread
> > =20
> >  gettimestampmp: gettimestampmp.c ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o gettimestampmp -DTEST gettimestampmp.c -lpthread
> > =20
> >  hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
> >  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> > =20
> >  ptxroute: ptxroute.c ../api.h
> > -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
> > =20
> >  rcu: rcu.c rcu.h ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> > =20
> >  rcu64: rcu64.c rcu64.h ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o rcu64 -DTEST rcu64.c -lpthread
> > =20
> >  rcu64_atomicgp: rcu64_atomicgp.c rcu64_atomicgp.h ../api.h rcutorture.=
h
> >  	cc $(GCC_ARGS) -o rcu64_atomicgp -DTEST rcu64_atomicgp.c -lpthread
> > =20
> > @@ -124,32 +124,32 @@ rcu_rcpls: rcu_rcpls.c rcu_rcpls.h ../api.h rcuto=
rture.h
> >  rcu_sig: rcu_sig.c rcu_sig.h ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o rcu_sig -DTEST rcu_sig.c -lpthread
> > =20
> >  rcu_ts: rcu_ts.c rcu_ts.h ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o rcu_ts -DTEST rcu_ts.c -lpthread
> > =20
> >  route_hazptr: route_hazptr.c hazptr.c hazptr.h ../api.h ../lib/random.=
h ../lib/random.c routetorture.h
> >  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.=
c -lpthread
> > =20
> >  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routet=
orture.h
> > -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -l=
urcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -l=
urcu
> > =20
> >  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c r=
outetorture.h
> >  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.=
c -lpthread  -lurcu-qsbr
> > =20
> >  route_refcnt: route_refcnt.c ../api.h ../lib/random.h ../lib/random.c =
routetorture.h
> >  	cc $(GCC_ARGS) -o route_refcnt route_refcnt.c ../lib/random.c -lpthre=
ad
> > =20
> >  route_seq: route_seq.c ../api.h ../lib/random.h ../lib/random.c routet=
orture.h
> >  	cc $(GCC_ARGS) -o route_seq route_seq.c ../lib/random.c -lpthread
> > =20
> >  route_seqlock: route_seqlock.c ../api.h seqlock.h ../lib/random.h ../l=
ib/random.c routetorture.h
> >  	cc $(GCC_ARGS) -o route_seqlock route_seqlock.c ../lib/random.c -lpth=
read
> > =20
> >  seqlocktorture: seqlocktorture.c seqlock.h ../api.h
> >  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> > =20
> >  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> > -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpt=
hread  -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpt=
hread  -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)

