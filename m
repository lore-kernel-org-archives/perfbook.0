Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6CF198E78
	for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735411800; cv=none; b=EhvyyPbukOt1/oLvMdezK7exJRThiDqOKulw8boF3bPlXkKGnSkjhLVVXb0ZDypVrB5vdqeFAaZInjRXH6JqU2ftGWIH3sv8jT/GfOBZKtTxDWS31oSfiaXOHO2J4/iYYVyV+rdhllItIs5EAZfwsf1oEBSQk4lCrjUKmqke/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735411800; c=relaxed/simple;
	bh=ndyqwCLw2Xncog3fihp69DzFpYX2rLnarmcOKGC5UeE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHoWcCoEkDi9cT+RT+2EHai0558wvDUeACTTBVOe8pf8yOdVeicYXv7ncrc3zhZoHm87es5qHbsKUhR4lw6jQXE3bcM8cj4rRLbNuKywlu0jJH+G1q5KzMDE4GvwHTczaZ4a3nXAt9MsW7lU7iByV7rDL70hj27zScwKL8eKaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKf0VOVH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKf0VOVH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so10096883a91.3
        for <perfbook@vger.kernel.org>; Sat, 28 Dec 2024 10:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411798; x=1736016598; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uCGjDRtKduKg0mqdfLLNZqcdX0XrUXX9jb3INfpYBKU=;
        b=FKf0VOVHFm2U3Fk9VkNn5+maWOJiRfN8LWGpylokfbkPRKibcULLJUdkFv9bk5h7kV
         Bb/3NZTi6fg3hVOvfrCnOo0Vx+aUxjcrCIlf0xozc120iwMf5u7Ga7P08A9feW1MSfWU
         acGCoXSwBs07CXtKMipV8oev8nI78ureF53l0HeBLeYulLTBmcgmIcdbJfAnkbKdEizF
         MNzX9wwSkkFZhz/oMoZIBsf/tahytVp6RJmNQk6MTdF03+ruPJzclOTRTSUnrCEZdC7v
         nNQzhqHyrmDTolgUWE+dAdLplbXM1/S3cFKqEmqRLCy9UmrOTotkdkw+6mMwv5jWGrwk
         xB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411798; x=1736016598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCGjDRtKduKg0mqdfLLNZqcdX0XrUXX9jb3INfpYBKU=;
        b=u8dR9bD0O/gxHOLzwGBwG5JxmnQRRoOo/UlqjIndA52WeiKd9k6LOrfnFPFWCpYNOY
         FiV9tvu4nggZxhU49VqXrK/dqaFOlkE27YaxmbJed82NpyATcZPmkAw+n0ZKtOMsyIyY
         PiXWchfRRbO7nBvI7UVXkp0GhsENOUm//0e+max2pVd+KY9MGesDpjyZM1O7F+YSI6zT
         RMVpXZjjzXgOxgSQi6PVzZLAMs6jms9LugDHjOPG0PJYcYiNrQTcpn1ZNXFWEqgCiTGI
         9LSuRSzit/iUpbvR8eSoBqyePBzkg7gZHeJYOtsiSabbzvDSnhoFP16ef9CwLYjTG8kx
         mPxg==
X-Gm-Message-State: AOJu0YwcI3nnldwYC9RZfiLtiYsHExoC+zpswLQa3bm9ifVrIKObrVKi
	lrpUgxW1LAfm1/JRKkiEgIl8R25lpFBd2G1mm0M515ZK14Ptx5BW
X-Gm-Gg: ASbGncuJhYnNOhMSZRGuSgtq00aKhFoZJI+IlAPrTU86O7e2dDm4Ie/5EHZhuEbQnfa
	Dr9Zqmfugmxh3UZaeeoaCO++NnIctYmE73dG/kDWApxwfd5HwftJRZNMViPft48KtBoaj8xLX/m
	HTIwO3NCzGLuzCpJssQwHfqE/1Ac80dQp+b8gSfazdAyB4uMGNnX8f4rDQO+SSuP3F55fOL51P4
	VFGc9MhAeABH+9pLnyxhqplvE6HKqtCxQEQkE/nJ1DwrsgUDCjLJfn5aeRUQNEzDl2sHAW7270t
	+o6xFzkFQcqkeo0EpEWg2sTNJgQ=
X-Google-Smtp-Source: AGHT+IHxenl7rLt8/9yW4EEp2X/eIdvy2Sjl3jjB9vN5Fun3qmxCj0EnLbJcW8dhpdZguu5oM2fUOQ==
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f452dfcd26mr43141915a91.6.1735411798095;
        Sat, 28 Dec 2024 10:49:58 -0800 (PST)
Received: from ?IPv6:2804:7f0:b769:e86b:6238:d468:d566:2780? ([2804:7f0:b769:e86b:6238:d468:d566:2780])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cf9esm21647806a91.8.2024.12.28.10.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:49:57 -0800 (PST)
Message-ID: <bab2f5b7588a3e84c6d1eacbf20702045af6a5a6.camel@gmail.com>
Subject: Re: [PATCH v3] CodeSamples: Work around removal of liburcu-signal
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Date: Sat, 28 Dec 2024 15:49:54 -0300
In-Reply-To: <0ad3978e979630eede90f193b9faeb809999a280.camel@gmail.com>
References: <672873fa-5e2a-4ef3-88ea-35e980305e2f@gmail.com>
		 <bc05ad7f-c2ea-4051-85d2-49d7d38c5970@paulmck-laptop>
	 <0ad3978e979630eede90f193b9faeb809999a280.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-12-28 at 15:40 -0300, Leonardo Br=C3=A1s wrote:
> On Sat, 2024-12-28 at 10:04 -0800, Paul E. McKenney wrote:
> > On Sat, Dec 28, 2024 at 04:12:40PM +0900, Akira Yokosawa wrote:
> > > From: Leonardo Bras <leobras.c@gmail.com>
> > >=20
> > > liburcu 0.15.0 deprecated urcu-signal as a library.
> > > This causes build errors in gitlab-CI [1]:
> > >=20
> > >     /usr/sbin/ld: cannot find -lurcu-signal: No such file or director=
y
> > >     collect2: error: ld returned 1 exit status
> > >=20
> > > Work around them by adding command lines w/o "-lurcu-signal" as
> > > fallbacks in relevant Makefile recipes.
> > >=20
> > > Link: https://gitlab.com/linux-kernel/perfbook/-/jobs/8732944799 [1]
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
> > > [akiyks: rewrite changelog, restore compatibility with liburcu <0.15.=
0]
> > > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > ---
> > > Hi,
> > >=20
> > > Admittedly, this is one of the least elegant workaround for ArchLinux
> > > and soon-to-be upgraded other rolling distros, but still looks straig=
ht
> > > forward to me.
> > >=20
> > > Can you live with this?
> >=20
> > Thank you both for digging into this!!!
> >=20
> > I believe that we can, and I am inclined to take this.  But first,
> > a couple of questions:
> >=20
> > 1.	Can this be some sort of macro or script so that we don't have
> > 	to keep the arguments of the commands in each pair in sync?
> >=20
> > 2.	Is it possible to try the new version first, so that only old
> > 	systems pay the double-compilation price?
>=20
> While (2) is cleaner and quite possible by:
> a) keeping a $VAR_COMPAT_SIGNAL variable that can get
> 	"-lurcu-signal" if a test compilation fails, and
> 	""              otherwise,

or simply=C2=A0
VAR_COMPAT_SIGNAL=3D$(pkg-config --libs liburcu-signal)

(which results on an empty string if liburcu-signal is not available and=
=20
"-lurcu-signal" otherwise)

> b) adding this variable instead of -lurcu-signal in every command,
>=20
> I really doubt we need to add this complexity, as I don't think anyone is=
 using
> a 10 years old kernel to run those tests.
>=20
> Also, there is the fallback option mentioned by Paul.
>=20
> Honestly, I would go with v2 to avoid adding complexity.
>=20
> Thanks!
> Leo
>=20
> >=20
> > It is quite possible that the answer to the questions is "yes", but tha=
t
> > the result is excessively complex, so please do not put too much time
> > into this.  As I said above, I am inclined to take this.
> >=20
> > > This is tested against Ubuntu 20.04 LTS (liburcu 0.11.1),
> > > Ubuntu 24.04 LTS (liburcu 0.14.0), Fedora 41 (liburcu 0.14.1),
> > > and ArchLinux (liburcu 0.15.0).
> >=20
> > Thank you very much for testing all these possibilities!
> >=20
> > 							Thanx, Paul
> >=20
> > >         Thanks, Akira
> > > --
> > >  CodeSamples/datastruct/Issaquah/Makefile  |  6 +++--
> > >  CodeSamples/datastruct/existence/Makefile | 30 +++++++++++++++------=
--
> > >  CodeSamples/datastruct/hash/Makefile      |  9 ++++---
> > >  CodeSamples/datastruct/skiplist/Makefile  |  6 +++--
> > >  CodeSamples/defer/Makefile                |  9 ++++---
> > >  5 files changed, 40 insertions(+), 20 deletions(-)
> > >=20
> > > diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/d=
atastruct/Issaquah/Makefile
> > > index c3b724d7..75fd840b 100644
> > > --- a/CodeSamples/datastruct/Issaquah/Makefile
> > > +++ b/CodeSamples/datastruct/Issaquah/Makefile
> > > @@ -45,10 +45,12 @@ GCC_ARGS +=3D -fcommon
> > >  #	 Verify by using the nm command and searching output for malloc.
> > > =20
> > >  existence_test: existence.c existence_test.c
> > > -	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpth=
read -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpth=
read -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o existence_test existence.c existence_test.c -lpth=
read -lurcu
> > > =20
> > >  treetorture: tree.c existence.c spinlockmult.c $(LIB)/random.c ../..=
/api.h treetorture.h treetorturetrace.h $(LIB)/random.h existence.h tree.h
> > > -	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(L=
IB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(L=
IB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o treetorture tree.c existence.c spinlockmult.c $(L=
IB)/random.c -lpthread -lurcu
> > > =20
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/datastruct/existence/Makefile b/CodeSamples/=
datastruct/existence/Makefile
> > > index 19891c0f..568e7c2d 100644
> > > --- a/CodeSamples/datastruct/existence/Makefile
> > > +++ b/CodeSamples/datastruct/existence/Makefile
> > > @@ -44,39 +44,49 @@ all: $(PROGS)
> > >  #	So it is quite a bit easier to just use the default locations.  ;-=
)
> > > =20
> > >  existence_test: existence.h existence_test.c procon.h
> > > -	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu =
-lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu =
-lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o existence_test existence_test.c -lpthread -lurcu
> > > =20
> > >  existence_3hash_test: existence.h hash_exists.h keyvalue.h existence=
_3hash_test.c procon.h
> > > -	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpth=
read -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpth=
read -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o existence_3hash_test existence_3hash_test.c -lpth=
read -lurcu
> > > =20
> > >  existence_3hash_uperf: existence.h hash_exists.h keyvalue.h existenc=
e_3hash_uperf.c procon.h
> > >  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3hash_uperf existence=
_3hash_uperf.c -ltcmalloc -lpthread -lurcu -lurcu-signal
> > > -	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -lt=
cmalloc -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -lt=
cmalloc -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o existence_3hash_uperf existence_3hash_uperf.c -lt=
cmalloc -lpthread -lurcu
> > > =20
> > >  existence_3skiplist_test: existence.h skiplist_exists.h keyvalue.h e=
xistence_3skiplist_test.c procon.h
> > > -	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(=
LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc -g -O0 -o existence_3skiplist_test existence_3skiplist_test.c $(=
LIB)/random.c -lpthread -lurcu
> > >  	# cc $(GCC_ARGS) -o existence_3skiplist_test existence_3skiplist_te=
st.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > =20
> > >  existence_3skiplist_uperf: existence.h hash_exists.h keyvalue.h exis=
tence_3skiplist_uperf.c procon.h
> > >  	# cc -O0 -Wall -ggdb -fno-inline -o existence_3skiplist_uperf exist=
ence_3skiplist_uperf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-s=
ignal
> > > -	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_upe=
rf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_upe=
rf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o existence_3skiplist_uperf existence_3skiplist_upe=
rf.c -ltcmalloc $(LIB)/random.c -lpthread -lurcu
> > > =20
> > >  kaleidoscope_test: kaleidoscope.h kaleidoscope_test.c procon.h
> > > -	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -=
lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -=
lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o kaleidoscope_test kaleidoscope_test.c -lpthread -=
lurcu
> > > =20
> > >  kaleidoscope_3hash_test: kaleidoscope.h hash_exists.h keyvalue.h kal=
eidoscope_3hash_test.c procon.h
> > > -	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c=
 -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c=
 -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o kaleidoscope_3hash_test kaleidoscope_3hash_test.c=
 -lpthread -lurcu
> > > =20
> > >  kaleidoscope_3skiplist_test: kaleidoscope.h skiplist_exists.h keyval=
ue.h kaleidoscope_3skiplist_test.c procon.h
> > > -	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_tes=
t.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_tes=
t.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc -g -O0 -o kaleidoscope_3skiplist_test kaleidoscope_3skiplist_tes=
t.c $(LIB)/random.c -lpthread -lurcu
> > >  	# cc $(GCC_ARGS) -o kaleidoscope_3skiplist_test kaleidoscope_3skipl=
ist_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > =20
> > >  kaleidoscope_skiphash_test: kaleidoscope.h skiplist_exists.h keyvalu=
e.h kaleidoscope_skiphash_test.c procon.h
> > > -	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.=
c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.=
c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc -g -O0 -o kaleidoscope_skiphash_test kaleidoscope_skiphash_test.=
c $(LIB)/random.c -lpthread -lurcu
> > >  	# cc $(GCC_ARGS) -o kaleidoscope_skiphash_test kaleidoscope_skiphas=
h_test.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > =20
> > >  procon_test: procon.h procon_test.c
> > > -	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-sign=
al
> > > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu -lurcu-sign=
al || \
> > > +	cc -O0 -g -o procon_test procon_test.c -lpthread -lurcu
> > >  	# cc $(GCC_ARGS) -o procon_test procon_test.c -lpthread -lurcu -lur=
cu-signal
> > > =20
> > >  clean:
> > > diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datas=
truct/hash/Makefile
> > > index a56255a2..a558dfee 100644
> > > --- a/CodeSamples/datastruct/hash/Makefile
> > > +++ b/CodeSamples/datastruct/hash/Makefile
> > > @@ -44,7 +44,8 @@ hash_bkt_qsbr: hash_bkt_rcu.c ../../api.h hashtortu=
re.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -DPERFBOOK_RCU_QSBR -o hash_bkt_qsbr has=
h_bkt_rcu.c $(LIB)/random.c -lpthread -lurcu -lurcu-qsbr
> > > =20
> > >  hash_bkt_rcu: hash_bkt_rcu.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/ra=
ndom.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_rcu hash_bkt_rcu.c $(LIB)/ra=
ndom.c -lpthread -lurcu
> > > =20
> > >  hash_bkt_hazptr: hash_bkt_hazptr.c ../../defer/hazptr.c ../../defer/=
hazptr.h ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_bkt_hazptr hash_bkt_hazptr.c ../=
../defer/hazptr.c $(LIB)/random.c -lpthread
> > > @@ -53,10 +54,12 @@ hash_global: hash_global.c ../../api.h hashtortur=
e.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_global hash_global.c $(LIB)/rand=
om.c -lpthread
> > > =20
> > >  hash_resize: hash_resize.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/rand=
om.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize hash_resize.c $(LIB)/rand=
om.c -lpthread -lurcu
> > > =20
> > >  hash_resize_s: hash_resize_s.c ../../api.h hashtorture.h
> > > -	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/=
random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/=
random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -DTEST_HASH -o hash_resize_s hash_resize_s.c $(LIB)/=
random.c -lpthread -lurcu
> > > =20
> > >  hash_unsync: hash_unsync.c ../../api.h hashtorture.h
> > >  	cc $(GCC_ARGS) -DTEST_HASH -o hash_unsync hash_unsync.c $(LIB)/rand=
om.c -lpthread
> > > diff --git a/CodeSamples/datastruct/skiplist/Makefile b/CodeSamples/d=
atastruct/skiplist/Makefile
> > > index 3a555691..8cf9d47a 100644
> > > --- a/CodeSamples/datastruct/skiplist/Makefile
> > > +++ b/CodeSamples/datastruct/skiplist/Makefile
> > > @@ -33,10 +33,12 @@ endif
> > >  include $(top)/recipes.mk
> > > =20
> > >  skiplist: skiplist.c ../../api.h skiplisttorture.h skiplist.h
> > > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c =
$(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist skiplist.c =
$(LIB)/random.c -lpthread -lurcu
> > > =20
> > >  skiplist_glock: skiplist_glock.c ../../api.h skiplisttorture.h skipl=
ist.h
> > > -	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skipl=
ist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skipl=
ist_glock.c $(LIB)/random.c -lpthread -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -DTEST_SKIPLIST -I $(LIB) -g -o skiplist_glock skipl=
ist_glock.c $(LIB)/random.c -lpthread -lurcu
> > > =20
> > >  clean:
> > >  	rm -f $(PROGS)
> > > diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
> > > index 3cf3e5a5..b4af17db 100644
> > > --- a/CodeSamples/defer/Makefile
> > > +++ b/CodeSamples/defer/Makefile
> > > @@ -80,7 +80,8 @@ hazptr: hazptr.c hazptr.h ../api.h hazptrtorture.h
> > >  	cc $(GCC_ARGS) -o hazptr -DTEST hazptr.c -lpthread
> > > =20
> > >  ptxroute: ptxroute.c ../api.h
> > > -	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signa=
l
> > > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu -lurcu-signa=
l || \
> > > +	cc $(GCC_ARGS) -o ptxroute ptxroute.c -lpthread -lurcu
> > > =20
> > >  rcu: rcu.c rcu.h ../api.h rcutorture.h
> > >  	cc $(GCC_ARGS) -o rcu -DTEST rcu.c -lpthread
> > > @@ -131,7 +132,8 @@ route_hazptr: route_hazptr.c hazptr.c hazptr.h ..=
/api.h ../lib/random.h ../lib/r
> > >  	cc $(GCC_ARGS) -o route_hazptr route_hazptr.c hazptr.c ../lib/rando=
m.c -lpthread
> > > =20
> > >  route_rcu: route_rcu.c ../api.h ../lib/random.h ../lib/random.c rout=
etorture.h
> > > -	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  =
-lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  =
-lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -o route_rcu route_rcu.c ../lib/random.c -lpthread  =
-lurcu
> > > =20
> > >  route_rcu_qsbr: route_rcu.c ../api.h ../lib/random.h ../lib/random.c=
 routetorture.h
> > >  	cc $(GCC_ARGS) -o route_rcu_qsbr -DDO_QSBR route_rcu.c ../lib/rando=
m.c -lpthread  -lurcu-qsbr
> > > @@ -149,7 +151,8 @@ seqlocktorture: seqlocktorture.c seqlock.h ../api=
.h
> > >  	cc $(GCC_ARGS) -o seqlocktorture seqlocktorture.c -lpthread
> > > =20
> > >  singleton: singleton.c ../api.h ../lib/random.h ../lib/random.c
> > > -	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -l=
pthread  -lurcu -lurcu-signal
> > > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -l=
pthread  -lurcu -lurcu-signal || \
> > > +	cc $(GCC_ARGS) -Wall -g -o singleton singleton.c ../lib/random.c -l=
pthread  -lurcu
> > > =20
> > >  clean:
> > >  	rm -f $(PROGS)
> > >=20
> > > base-commit: 4c0afec5a7081227adc768fb8d3fb35aa1981d55
> > > --=20
> > > 2.34.1
> > >=20
>=20

