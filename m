Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211962AE84
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735410402; cv=none; b=YhjSWHFgNNFzue3oEFmvqw3m8xGYq6H5W1SI5f52Kc6+xHgnvMnYik4J+RaPgIzuyNwYJM4srEn1gvPsU+aitHuNRgAPH8wrFWDLUsU8PZkW6N/OqRP+HIkBHqTyQG+BwduESvIAg9km4JF34lMEt64QAyKIySGjffjyZEr1xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735410402; c=relaxed/simple;
	bh=oG1+RnHgbT719vO3NtLwTkd07eGSy0PhrFiKGmKZgqU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cgpYgCBzoOso5cbhkOEV5eM65GagP0hlNpEHRoB6yV8ThhrftSnHMJ6vhDq5OI1bfD2heiE/u8YXqvKup6g9l3t1LH5W+OAVjTQ6qWu9xpG6mi6WXo1u4r6myUAjzSK1weSVmd74ekV+JgCFZPH0vt7XzxkniU4UZdNmKmJnzGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMwgwr/t; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMwgwr/t"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166f1e589cso122710785ad.3
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 10:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735410399; x=1736015199; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rc9J10GQ1vxSCQEPSNM7aSMZgDuxl8nl61Bnx+VtQjc=;
        b=IMwgwr/t6qqnAqDcjCytSrnro1RlJJlum4cFkVxtsIW8ApYE2uX0nGA6ThsEGSWo0A
         WoBk1VQVd2biDYmjuEMEy1jwwV3vLLdhuIbyN/85B9z6xNlJPcsVSQZJ/szE3ypa1MWm
         lfLdLdhGO9OtAqb3TEsmZx/ENN7wSNl6O4w9osHFJlRKcKyiTIB1ZnxYjPDbt0bYJJjb
         PQwPwZd2A7dAnCtJcjKgytP7fcISo0Vfw5bPvxkTSKUsiCsZVZsiDwCSBAZtPeToo9pX
         k7+6NbQ3oaiG27C2rDETE7U74TaaOFFwZuTG+EyHbDIvFjRM+vj3PFxRgZIhZIP/r3Wq
         huTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735410399; x=1736015199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rc9J10GQ1vxSCQEPSNM7aSMZgDuxl8nl61Bnx+VtQjc=;
        b=TmyxnI02dBxko0/BWYx5+QMIsjEFrqnQuyWtVQOFt8Cv0UP12NocvPbn6so8LNHR/1
         yCtI8jmFp+rgzshGhhj9byzcvGkvqzhvVYhx157yD/QMyk0/jmYK82j1ptzViGTZWR7g
         CfsNzn5ZVrwhh8ybmcpZhy0Yive3XoX4mc+77YUCTD26PS8Txbmp7bQ3rdy2b+BIOJ8F
         durYmQ8dd5wbHYcmQcfni6IqIG3UF9dMytdzDZoX2/H0axOQAeQ7FnFZWULvsCtF+Woe
         ILTaM/QkGb/syMvAeATWQ20KjJmNdDFa5iqrDouXP2Zg6mW17csz8t4kckdlxG1Kxekj
         qpiw==
X-Gm-Message-State: AOJu0Yxc8whCWYWNCNV6lXoxyPRTE2eUhKjNhXkQ1wMJFJ0J7ThPjK/b
	Aq7F2XJ9VDqxe/nLwdhhuxAKaKZGBO4s1z8KEOoi0Ku7P4V8SwYW/cUPxw==
X-Gm-Gg: ASbGncsuI/EUCXFVdb1UvXNOT51+y+8C0RFOHouiDNJTOat3umwV5Qwccd4DUMJTnZ5
	8gcCOLFenUQzLDIm4bytX5q5Fi4c+XRMcINLYgnDV+aq7p4qSygfGmQN+buDkQwTEe/pUK6T+bp
	idhlvkY+pIMmhmYv2hG/U1CVfXlaVErZcOdvtkTsKBdNaGR7v5O3Wkgv7RfxiWrXCDro65YUIht
	Q+u0hJ2L7bo8udwCpLcTta+kXwN2mrpWVT0mOlsnPDmb72ZeJqz2UxD1y7cZktrRcploWN6iw4S
	/cUAUGT80V9PeThY9RlsMMAX9ms=
X-Google-Smtp-Source: AGHT+IEbUz7Z1otsdmqYozEkTL0+cPatAiYPbcMSt60dbf4tdSBWsFCB1+qRghUhkudcfGwehRyJEQ==
X-Received: by 2002:a17:902:ec86:b0:216:7ee9:222c with SMTP id d9443c01a7336-219e6e8c980mr261425335ad.7.1735410398814;
        Sat, 28 Dec 2024 10:26:38 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6c17sm152671055ad.221.2024.12.28.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:26:38 -0800 (PST)
Message-ID: <3ba48d72c81ae3aaa6dbfc9bd44fd30f455cd157.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 15:26:34 -0300
In-Reply-To: <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
	 <e55c82dec3d28d2a88dc60c680d04b25de18ea87.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 15:23 -0300, Leonardo Br=C3=A1s wrote:
> On Sat, 2024-12-28 at 16:12 +0900, Akira Yokosawa wrote:
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
> >=20
> > This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
> > Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
> > and ArchLinux (liburcu 0.15.0).
> >=20
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
>=20
> Hi Akira,
>=20
> That's a creative way of dealing with this issue, but if we want to add t=
hat
> complexity, I would rather use $(pkg-config --libs liburcu).=20
>=20
> Wouldn't this fix the issue as well?
>=20
> Thanks!

Also, according to Paul's comment on v2 patch it shouldn't be needed:

> > On the other hand, sys_membarrier() was introduced in 2015 (5b25b13ab08=
f6),
> > and no supported kernel (>v4.2) should still miss this syscall. Is it w=
orth
> > the added complexity? Is so, let's do it.

> If the -lurcu-signal is left off for old versions of the userspace RCU
> library, doesn't it simply fall back to using explicit memory barriers?
> Or am I yet again misremembering?

>					Thanx, Paul

Isn't the above correct?

Thanks!
Leo

