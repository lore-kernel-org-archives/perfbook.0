Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D62E552
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735348773; cv=none; b=I013kG1t2cuxr66H8NgFjAr9Tq+AvWaeOlHlmygm5+L92lH0ND5drQS7SsT7qCddnCve9gP2J2IggIrIDMG2WzMjHGoxehJduBPqJu5wAAQL3oYuZkVaj3yaYq+n2oKXEl6gy0VlR6zyGJqJatCj4ZjKKi3IfvTXI5Nhtkl4FFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735348773; c=relaxed/simple;
	bh=S/dAUtK1YE9dSckY58P0A+KMj+H8UWpncdFGbyLwj7Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qm1HVQwHBRh3Br5qNfWUPGv7BlZAKg70Ox22b1dbUWpG/cxirGmmH8Mx1iIKXYBJlbdfeaPAXzzX09a7U/Ynvyg1kg5FlXyHTYk7wcujlMQU4razAQaUNShHwvuBshffI45MmThEQdlCfZEinmssC8AGsZz/KsAUcIbGGdpvWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7ejwaCl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7ejwaCl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216401de828so91199335ad.3
        for <perfbook@vger.kernel.org>; Fri, 27 Dec 2024 17:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735348771; x=1735953571; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VnU1yzOJY8X9IPCw6gsCDePmRbE2ZKc+QVldOltN534=;
        b=m7ejwaCl2Q6muYDBKMSxR/eBONTWojkwe+t6dYUpkdUWvIOElp01zdcJyHbxsBzYYu
         ozQZnlAMtNEOrAw+TzuE06pd6bcaejBOacg39kXeroypEtxZMO1qoCJ+ZEwuG/LJi48i
         PDQrwmJqhMaLJVSIxCmPoLiBlU+W9zKRJDkHefqOCLM82iYvp1b9jtmTc6TswsBKtWHA
         tIoyT7s4HD/5xSYG0J/qQXiGsLsc9MRUOMTH4dqx/Z5FSttVjjUquRI78ZhPars9uIq9
         riuJQY7365AT7f2VJvebfr1BkFCTzhw/MVxnk4KvY9wobPLkrnhEXoKx1EbSF/tAzhGc
         jBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735348771; x=1735953571;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VnU1yzOJY8X9IPCw6gsCDePmRbE2ZKc+QVldOltN534=;
        b=udUMd4d3lOwNDVIGMLfk5NPRGtm9qjFr8bOFDlqRGoysKOmc5Dmr4oMlZ3nQgEPu8F
         C+C2amajUVGDrngB5T2cW6emovQHudYeB83eX/TvJQilYi7dJt4EL+1AOWi6nHRWVUye
         nIIuaUFWhYfPbhysVt+qNsazSflMExSxf4+khtMBYl+fIPRXSTKSuaed69O8iypRrsQA
         N4mTUfssA88/q9tkC1ZGa4VoQXLM5J3ZDBLrd9NbJY00wVGDOei5PVw8nskATtKczgOK
         DGTI7+5OIWpgi9hnTJgHAusAkWxvYxdUGsMgyn1wYiYec0ancGstKx/hGjozZ5r+Z9WX
         w9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3517FHDL12NWRk/cmZz7q7/F6HypFzN4e4F30Sxz+iVKqjnXVgr+CsLpf4ah6A27N12Dp5mefBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfIjctyrNUzITRBslyqDNTShfEUP+vQ/gkWCf2JCGja6l3EXB
	Q++YpK4K3MR8cdx+mMrk0o4O7bFLcLbA93HAtb75vkpK/WQMq4Yp
X-Gm-Gg: ASbGncua7fZmNJ6UIJ4ssOaajkLejrA6wlD69U2NNbVjzl7KZBb/vfHyaRbFtvJWeOU
	PIUdgWqojNNkE7e7m28PJ9rbsvYd3pKXgcClveygUAFqcKEjcw5CDvWpM9wgaYAiXEcrKLEjMWT
	8CO/yadjsTPT2C/A44rzzcRIGoXo+pHdEpAvgyOUKflE53guaWGduyokPcpgw3gPpRNs4e1m93p
	xeBTWd9wgC7kISc8bTdmtcoRNIvvnN8Whjho7P4yiFbSqFEFV3QE1UzfFyi7dOa279dl4arGlLA
	SOGlLMummxdDdMiW7uPrOgqugXc=
X-Google-Smtp-Source: AGHT+IGOEy6o9+V7DEQ/dtiECD+E4ioumatMruwRMRohBsADIs0jb6F59LqOn1nF4TYl323FIHYIfA==
X-Received: by 2002:a17:903:182:b0:216:1eb9:4a48 with SMTP id d9443c01a7336-219e6f289a0mr322653055ad.56.1735348770596;
        Fri, 27 Dec 2024 17:19:30 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f7e49sm141398415ad.217.2024.12.27.17.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 17:19:30 -0800 (PST)
Message-ID: <f0438d5bc371625800e0e666e3047f8874d5d080.camel@gmail.com>
Subject: Re: [PATCH] CodeSamples: Remove support for liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Leonardo Bras <lsoaresp@redhat.com>, 
	perfbook@vger.kernel.org
Cc: paulmck@kernel.org
Date: Fri, 27 Dec 2024 22:19:26 -0300
In-Reply-To: <ded394ec-a98e-4a89-a1f7-513b1e4fdb3e@gmail.com>
References: <20241227225435.8119-1-leobras.c@gmail.com>
	 <ded394ec-a98e-4a89-a1f7-513b1e4fdb3e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Akira,

On Sat, 2024-12-28 at 10:11 +0900, Akira Yokosawa wrote:
> Hi,
>=20
> On 2024/12/28 7:52, Leonardo Bras wrote:
> > Gitlab-CI is failing[1] on building CodeSamples due to ArchLinux
> > deprecating support for liburcu-signal.
> >=20
> > Currently liburcu-signal is not needed anymore, since upstream liburcu
> > already include all needed symbols/functions to build CodeSamples.
> >=20
> > Remove -lurcu-signal from all CodeSamples/*/Makefile to avoid using it =
on
> > linking stage.
>=20
> So, this change is made in liburcu 0.15.0, right?
>=20
> And it breaks builds with liburcu <0.15, no?
>=20
> I'd like you to consider a more graceful approach considering non-ArchLin=
ux
> users.

Completely agree, thanks for pointing that out!

Last build with no error:
	liburcu 0.14.1-1
Current version (error):
	liburcu 0.15.0-1

According to relase e-mail:
https://lists.lttng.org/pipermail/lttng-dev/2024-December/030893.html


* Deprecation of liburcu-signal

Users can migrate to liburcu-memb with a kernel implementing the
membarrier(2) system call to have similar read-side performance without
requiring use of a reserved signal, and with improved grace period
performance.


I will add this info and generate a v2.

Thanks!
Leo


>=20
>         Thanks, Akira
>=20
> >=20
> > [1] https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799
> >=20
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
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

