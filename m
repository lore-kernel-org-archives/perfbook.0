Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C415990C
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735411215; cv=none; b=dUHVgdRfKOam4Jzx82Q6FK9qclIaRADZS94twbNrbLPjG5bFHUlcbX0VmNEA1JYK2uh+2hN39u4ptIjjAzzBQGaK7I1EJfuWQCwE7NSVFkF6LU6ajKXy2sL6PoEpTBn4KmfN79TQuP083nFndsVLbfS6S85v+9iuQmsJ0/bV6yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735411215; c=relaxed/simple;
	bh=zkm59zS+LgkI9TokolR5NRklKqfIU/C/ymXAZ3rBMi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OyO8SpYv6abTvGaxnoOXoF/qoReqcjRXdoymSME6xQqvGEa8QEVkEP2cm7z2C4+UYcmGUInyin0FpG30Aw3fvEprb2Xb8rrXIcHPo0ZosziqZLE+1K/Y9jjBFkqG+e7kRTAe54TP7nPckwWNGi26PDKlRwuR4SskeFQBYzNyxyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if0Z36VT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if0Z36VT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so8174990a91.2
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 10:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411213; x=1736016013; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=shBfuIGX7WGIA0bpKvJsJDb9m6KnK/DWXgG4Ya45IVI=;
        b=if0Z36VT5lM4W5rDlDIYf2HGggAgRTSGN65nFKYphG+YaRI11cH3iGi75s3YVXMc51
         0nN9wn3JrtFpO8DL7kTP7d4X0NTVYI3aGfENBu0dJefbhcOa8fjm/AUcgO9RA9zZTOIo
         7Go1rDITWsVspk7AY4TBSek0wo2pJa/qwEXCnj+qqXyXdeRIBa8EnNQHrojHB4DVHJ5C
         yZ57luvd4EONE73vEuFVzxbs54jtuQbvytUrj+ORGmZkVaPPbDDy78tk73DCnXM7q0jJ
         cHdW08lxOKadGlX5lHtaWSDdWug73+4e5KqtLTS/FygYQ1lsdR5c9H1olhbc47AnfT7j
         3lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411213; x=1736016013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shBfuIGX7WGIA0bpKvJsJDb9m6KnK/DWXgG4Ya45IVI=;
        b=rwd44vAKTe0393aCQmCaQp+GZnyw+I6TJ8SLbFAEAic5xe2Ip/uvaNXtEmiknMgcaU
         R8zMuz4m47Mgi2uXZuzWIsKiVEGkKE9mHTzUVVCM7LpVUakDi74S7hDd3xMmNpetHC9F
         6t8yy7aPAA6Q3CRzaP09i63+sNRyt0I2xcDLoRtUKarCa519vJXBSjCBEt8txJ+HBxtq
         2dB3kIcU9TK6S4chEiGjlR7uhEeCoP1T5br47uF0ISMIa8Pjt2+StwVaMPdxAOW2jGxI
         t2XiYp/1IRAHKUBbZQWgyou+4Zwd0JkmuE/wx5H3YtSc2hc2bz+NjZW/PR3elPocATb3
         wJvg==
X-Gm-Message-State: AOJu0Yxa3ang3ZIGEkBKg2xfKvarIG2veoucJY5FfAJxvtr+hhbpcmCK
	Yx8eNvt/XHownxYz6fBVAvgVi4LiOts4GYGWwQsOaFAwUVsL2VLYVW+jGw==
X-Gm-Gg: ASbGncsGS/JA4xezFaXZjpWer+/9ZLbxPztOBIVhSynJqo2mQNb5o2exqnjIreN1icZ
	BHjL9zv1kxVXIXyugUzgApGrBSlLeGM3ZNSPHMKHQRq397CAFVrUphuhEnzHKVh0EQf40G5E+wO
	qUQtzMbbwQ/pQWoINgeWp8tH33ZPAwx1G1M/yLQ+LmWqgRiRklxDdrn8jfd48yMPTgtbpOcvzl7
	nDUM0Uc5l3qTQpuz7wF+MuEZv2CMwQce5zCty8ESzaQshfnAUUtmg6GlgYS0TRHreexbNZfUcFZ
	DBu1VtGERUtJz9/ebokvUrVI2JM=
X-Google-Smtp-Source: AGHT+IGgxx3CT3AsE5Z0VqyRp7hqAyzMjmSRfa5LpD3128gbUXFU8VXsXP9maUNf+RCmTiKROWKEew==
X-Received: by 2002:a17:90b:2c83:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2f452eed943mr46952700a91.35.1735411212643;
        Sat, 28 Dec 2024 10:40:12 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2d9dc7342sm7465492a91.0.2024.12.28.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:40:12 -0800 (PST)
Message-ID: <0ad3978e979630eede90f193b9faeb809999a280.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 15:40:09 -0300
In-Reply-To: <bc05ad7f-c2ea-4051-85d2-49d7d38c5970@paulmck-laptop>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
	 <bc05ad7f-c2ea-4051-85d2-49d7d38c5970@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 10:04 -0800, Paul E. McKenney wrote:
> On Sat, Dec 28, 2024 at 04:12:40PM +0900, Akira Yokosawa wrote:
> > From: Leonardo Bras <leobras.c@gmail.com>
> >=20
> > liburcu 0.15.0 deprecated urcu-signal as a library.
> > This causes build errors in gitlab-CI [1]:
> >=20
> >     /usr/sbin/ld: cannot find -lurcu-signal: No such file or directory
> >     collect2: error: ld returned 1 exit status
> >=20
> > Work around them by adding command lines w/o "-lurcu-signal" as
> > fallbacks in relevant Makefile recipes.
> >=20
> > Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
> > [akiyks: rewrite changelog, restore compatibility with liburcu <0.15.0]
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi,
> >=20
> > Admittedly, this is one of the least elegant workaround for ArchLinux
> > and soon-to-be upgraded other rolling distros, but still looks straight
> > forward to me.
> >=20
> > Can you live with this?
>=20
> Thank you both for digging into this!!!
>=20
> I believe that we can, and I am inclined to take this.  But first,
> a couple of questions:
>=20
> 1.	Can this be some sort of macro or script so that we don't have
> 	to keep the arguments of the commands in each pair in sync?
>=20
> 2.	Is it possible to try the new version first, so that only old
> 	systems pay the double-compilation price?

While (2) is cleaner and quite possible by:
a) keeping a $VAR_COMPAT_SIGNAL variable that can get
	"-lurcu-signal" if a test compilation fails, and
	""              otherwise,
b) adding this variable instead of -lurcu-signal in every command,

I really doubt we need to add this complexity, as I don't think anyone is u=
sing
a 10 years old kernel to run those tests.

Also, there is the fallback option mentioned by Paul.

Honestly, I would go with v2 to avoid adding complexity.

Thanks!
Leo

>=20
> It is quite possible that the answer to the questions is "yes", but that
> the result is excessively complex, so please do not put too much time
> into this.  As I said above, I am inclined to take this.
>=20
> > This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
> > Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
> > and ArchLinux (liburcu 0.15.0).
>=20
> Thank you very much for testing all these possibilities!
>=20
> 							Thanx, Paul
>=20
> >         Thanks, Akira
> > --
> >  CodeSamples/datastruct/Issaquah/Makefile  |  6 +++--
> >  CodeSamples/datastruct/existence/Makefile | 30 +++++++++++++++--------
> >  CodeSamples/datastruct/hash/Makefile      |  9 ++++---
> >  CodeSamples/datastruct/skiplist/Makefile  |  6 +++--
> >  CodeSamples/defer/Makefile                |  9 ++++---
> >  5 files changed, 40 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/dat=
astruct/Issaquah/Makefile
> > index c3b724d7..75fd840b 100644
> > --- a/CodeSamples/datastruct/Issaquah/Makefile
> > +++ b/CodeSamples/datastruct/Issaquah/Makefile
> > @@ -45,10 +45,12 @@ GCC_ARGS +=3D -fcommon
> >  #	 Verify by using the nm command and searching output for malloc.
> > =20
> >  existence_test: existence.c existence_test.c
> > -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthre=
ad -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthre=
ad -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpthre=
ad -lurcu
> > =20
> >  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../../a=
pi.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> > -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB=
)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB=
)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(LIB=
)/random.c -lpthread -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/da=
tastruct/existence/Makefile
> > index 19891c0f..568e7c2d 100644
> > --- a/CodeSamples/datastruct/existence/Makefile
> > +++ b/CodeSamples/datastruct/existence/Makefile
> > @@ -44,39 +44,49 @@ all: $(PROGS)
> >  #	So it is quite a bit easier to just use the default locations.  ;-)
> > =20
> >  existence_test: existence.h existence_test.c procon.h
> > -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -l=
urcu-signal
> > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu -l=
urcu-signal || \
> > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
> > =20
> >  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence_3=
hash_test.c procon.h
> > -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthre=
ad -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthre=
ad -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpthre=
ad -lurcu
> > =20
> >  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existence_=
3hash_uperf.c procon.h
> >  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence_3=
hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> > -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcm=
alloc -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcm=
alloc -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -ltcm=
alloc -lpthread -lurcu
> > =20
> >  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h exi=
stence_3skiplist_test.c procon.h
> > -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LI=
B)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(LI=
B)/random.c -lpthread -lurcu
> >  	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_test=
.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > =20
> >  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h existe=
nce_3skiplist_uperf.c procon.h
> >  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf existen=
ce_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-sig=
nal
> > -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf=
.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf=
.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_uperf=
.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > =20
> >  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> > -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lu=
rcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lu=
rcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -lu=
rcu
> > =20
> >  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kalei=
doscope_3hash_test.c procon.h
> > -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -=
lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -=
lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c -=
lpthread -lurcu
> > =20
> >  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyvalue=
.h kaleidoscope_3skiplist_test.c procon.h
> > -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.=
c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.=
c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_test.=
c $(LIB)/random.c -lpthread -lurcu
> >  	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skiplis=
t_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > =20
> >  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalue.=
h kaleidoscope_skiphash_test.c procon.h
> > -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.c =
$(LIB)/random.c -lpthread -lurcu
> >  	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphash_=
test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > =20
> >  procon_test: procon.h procon_test.c
> > -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal
> > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-signal=
 || \
> > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
> >  	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lurcu=
-signal
> > =20
> >  clean:
> > diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastr=
uct/hash/Makefile
> > index a56255a2..a558dfee 100644
> > --- a/CodeSamples/datastruct/hash/Makefile
> > +++ b/CodeSamples/datastruct/hash/Makefile
> > @@ -44,7 +44,8 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtorture=
.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr hash_=
bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> > =20
> >  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/rand=
om.c -lpthread -lurcu
> > =20
> >  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/ha=
zptr.h ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../..=
/defer/hazptr.c $(LIB)/random.c -lpthread
> > @@ -53,10 +54,12 @@ hash_global: hash_global.c ../../api.h hashtorture.=
h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/random=
.c -lpthread
> > =20
> >  hash_resize: hash_resize.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random=
.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/random=
.c -lpthread -lurcu
> > =20
> >  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/ra=
ndom.c -lpthread -lurcu
> > =20
> >  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
> >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/random=
.c -lpthread
> > diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/dat=
astruct/skiplist/Makefile
> > index 3a555691..8cf9d47a 100644
> > --- a/CodeSamples/datastruct/skiplist/Makefile
> > +++ b/CodeSamples/datastruct/skiplist/Makefile
> > @@ -33,10 +33,12 @@ endif
> >  include $(top)/recipes.mk
> > =20
> >  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c $(=
LIB)/random.c -lpthread -lurcu
> > =20
> >  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skiplis=
t.h
> > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplis=
t_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplis=
t_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skiplis=
t_glock.c $(LIB)/random.c -lpthread -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> > diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> > index 3cf3e5a5..b4af17db 100644
> > --- a/CodeSamples/defer/Makefile
> > +++ b/CodeSamples/defer/Makefile
> > @@ -80,7 +80,8 @@ hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
> >  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> > =20
> >  ptxroute: ptxroute.c ../api.h
> > -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signal =
|| \
> > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
> > =20
> >  rcu: rcu.c rcu.h ../api.h rcutorture.h
> >  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> > @@ -131,7 +132,8 @@ route_hazptr: route_hazptr.c hazptr.c hazptr.h ../a=
pi.h ../lib/random.h ../lib/r
> >  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/random.=
c -lpthread
> > =20
> >  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c routet=
orture.h
> > -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -l=
urcu -lurcu-signal
> > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -l=
urcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  -l=
urcu
> > =20
> >  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c r=
outetorture.h
> >  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/random.=
c -lpthread  -lurcu-qsbr
> > @@ -149,7 +151,8 @@ seqlocktorture: seqlocktorture.c seqlock.h ../api.h
> >  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> > =20
> >  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> > -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpt=
hread  -lurcu -lurcu-signal
> > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpt=
hread  -lurcu -lurcu-signal || \
> > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -lpt=
hread  -lurcu
> > =20
> >  clean:
> >  	rm -f $(PROGS)
> >=20
> > base-commit: 4c0afec5a7081227adc768fb8d3fb35aa1981d55
> > --=20
> > 2.34.1
> >=20

