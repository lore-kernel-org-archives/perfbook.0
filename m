Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024583;
	b=A/9wBVDpvp14M5A9JP5Pu0nwmV51mrkh86YOeZQBrTeGhvD9D1tVbbsFduK3B4zxcO9D
	 gra3MXUwzVH6fZ/ipDszG9aD/bXj4Og+Nv4RAEUjeBaqtM3whuRYurtux0QZAnlEs/ejl
	 BH/g/8t2XnX/sFiwV7js6pTy9dZBf5JNx/Hqh4RpOzpVDOnd6TYVguy5SBZioVAKUZMxD
	 LOA2LK661tShojClG7spRRnzwFxZ8deqT9L+UlkumtHEVqIpGQ/I2EHEE0b60XHDLlTS0
	 u4mLvyryZIFSNLOOz/hMblvTgGklVn5RjY8WFAuuGD2amkhaYT6uPN40joxgHGq5cPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024583;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=dxcmKXLHplpzEIoNvdGdU7GE9R7wfnQku1YAPWzGoLE=;
	b=sfZS3EJhhOOIWlPhhH0fT0UNNIgxIPaM0jqJisM2VrUQsOTI7ODXD8fh64vMRsQw0kXP
	 A6AizJKDa2gNe6WOwFCg+DA1iKTEWaQ6qVW7qRm1Et473d/Zw9hBCdz8xaxtsurvc8uAf
	 SlybWjZPDr7XROowl+O3FMyvTWZLxJUijm1YSiC41KL6St5qe/7fUn043yHIWQTri+nN4
	 GTM4T1I+nF8RpWfNfIEmlO14JGiZD2Udxvy/sDI4TbdPRhKSOOn2NJNftQy2LgsmEWxy3
	 ote/JzaVwZ8zkb1BiSB6wZiFT03jFZs9qUwmKN1cIGQqIg9Nmm9m6bpKoeIT+1zsx2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F32606A31C
	for <perfbook@vger.kernel.org>; Wed, 18 Nov 2026 17:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so97953eec.0
        for <perfbook@vger.kernel.org>; Wed, 18 Nov 2026 09:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024582; x=1795629382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxcmKXLHplpzEIoNvdGdU7GE9R7wfnQku1YAPWzGoLE=;
        b=d010HBJWBQHpRVqrDgzrcW1vfStb9hXCjpMhv+5FobajOedfPnYF0MpzuFoartxyou
         EdZGbiPJizWDGMsGknZCsdpDLQC9ZmQhPUsTGlbl9hHLlEWe2MGtrYhCUAbYLg/IJAL7
         28ireHJzmRbcM9yTPP4BEHYP+w1RkejDTkb3OTbKWi7Zx6uehQXERW0Ri9LX345VON4T
         e+DIT1oUeHGnn20IDLk6F3NjdOMtqi3GB3dEqhNB2DidHwbh/zAf/utrk9udKUY0iR62
         x36pa5n15ERUicvoNeJnX6GF6pxQCpdsENB7jWdiSYZkIQAFb4Ooa1Vliq5tTNQoq+6X
         M6Yw==
X-Forwarded-Encrypted: i=1; AL+hErGZYnNvNZxM5LjOyu97gjxnbq2T3JegxWU2DwdahA3oY3oli3wVlEsulaOazWTljUgASt1Jtw1gOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4G2Mztx0Xkc4yR3dNQ2VXYgIFczEo93MnOA5rrIjxQjxSFDIX
	7/6OsLxbeU1abZEJqkXe5LO4RJFVB4rwfYHFwmmrbM3Tl0qFfENdBzHB
X-Gm-Gg: AYBFou2OggU8Gn8TssQrVXoemYLVAAc513flaRwAMQ9sZZyMAyIjf0LiU6IoC7XrPff
	iDuX6lmlipv9UMg296Br2LgPMiGjZByNTA5E6+5Gux1m+egJBDKhJwcnfGj0V12DXg1EISPHnsx
	XbHsjyQrVpZe638FXKvyf0Emd7+2xgMvFQtcSMMS3DwElYI2lgqBlkngbAhUKurrjBpA8MxDQgF
	x44ZLQkgSsj1lZLJHLrw6ivxWO7dUqSPuZVsxKlZWq02D3NyK4tEDo/xK1NJvXXVlLZktL+FSCX
	jXFXTRtEV5Qw0BNz0tUwIxZKkrdDcxDRGBAlsobMmLzGUFSAap9+UuQetp7i+xPXn3o6DmlAwPs
	yc7P58hXTUU/EOAokwYTPvrYjqD9is6vXENISoA9AcklAzTzxtJLdo6CSzvTyIzhxzKY6Kwzq4H
	2Kbk4cmG2v3p/Knd6BPC52UAQzxK7kee4CnAAwFKp1dnwnm9Z8dwpfbNmWsOofOY2oq9SfSzMZZ
	TVdn0WnP7+7Q+B0EavWaKutoqd+q9hjgMpqnyA+uQB3SiDgssv9R+7PX8AWmPb/XWmbVip1Xa8J
	rqR1oTBHB6oKGJx/H+5ZxgDPSPaqRSVeK3i7cg0UCXqjdpAKvA5EIBY2n5kqaQZrNHWzLcD0+Jk
	rLvX7jRUhDcKX3cH80C8uixXTfLPsHkURcSLtuWBaCfAoKJZaGQDey2h1BTNWMN1esJDUhpJn3G
	aGsXBylz17pJYbLISZyO9gpJuxNBTYO/qZlhHESBwElW8aWsEi0QiAeg5nkomyyNn/dlCGjA==
X-Received: by 2002:a05:7301:92e:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-383ef9ba583mr182946eec.26.1795024582097;
        Wed, 18 Nov 2026 09:56:22 -0800 (PST)
Received: from ?IPv6:2001:67c:370:128:4595:f7da:56c1:448d? ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm10367988eec.24.2026.11.18.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:56:21 -0800 (PST)
Message-ID: <41edcd751d101bab611a3a123419e18a4ceddae4.camel@fejes.dev>
Subject: Re: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
From: Ferenc Fejes <ferenc@fejes.dev>
To: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Leonardo Bras
	 <leobras.c@gmail.com>
Date: Wed, 18 Nov 2026 18:56:20 +0100
In-Reply-To: <58a73032-86a4-4a19-8e07-e30110117edd@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
	 <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
	 <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
	 <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
	 <6a18ce59-d2b2-4397-8d8a-f55b11d7b309@gmail.com>
	 <ceea81feffcb33c0749230e9b0bd8ed555027514.camel@fejes.dev>
	 <58a73032-86a4-4a19-8e07-e30110117edd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

On Wed, 2026-11-18 at 19:32 +0900, Akira Yokosawa wrote:
> On Wed, 18 Nov 2026 04:55:54 +0100, Ferenc Fejes wrote:
> > Hi,
> >=20
> > On Tue, 2026-11-17 at 18:44 +0900, Akira Yokosawa wrote:
> > > On 11/17/26 11:41, Akira Yokosawa wrote:
> [...]
>=20
> > > > So, build_glossary in runlwarp.sh returned error.
> > > >=20
> > > > Can't you reproduce it?
> >=20
> > Unfortunately I cannot reproduce it. It builds cleanly both on my
> > machine and with a small docker build I put together. Its a bit
> > complicated because I dont wanted to install and configure docker
> > on my
> > machine, nor put an alternative texlive on to my disk. But feel
> > free to
> > use only the docker file and build the image with docker, if you
> > have
> > it installed already.
> >=20
> > Here I use podman, the script grab a pre-built binary from github,
> > build the dockerfile to a debian:unstable container then build the
> > epub
> > target. It works within the /tmp folder,=C2=A0 I put here the content o=
f
> > both file s/verbatim:
> >=20
> > Dockerfile.debian-unstable
> >=20
> > FROM docker.io/library/debian:unstable
> >=20
> > ENV DEBIAN_FRONTEND=3Dnoninteractive
> > RUN apt-get update && apt-get install -y --no-install-recommends \
> > =C2=A0=C2=A0=C2=A0 ca-certificates locales tzdata && \
> > =C2=A0=C2=A0=C2=A0 localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
> > =C2=A0=C2=A0=C2=A0 rm -rf /var/lib/apt/lists/*
> > ENV LANG=3Den_US.utf8
> >=20
> > RUN apt-get update && apt-get install -y --no-install-recommends \
> > =C2=A0=C2=A0=C2=A0 fig2ps inkscape xfig graphviz psutils \
> > =C2=A0=C2=A0=C2=A0 texlive-publishers texlive-pstricks texlive-science =
texlive-
> > fonts-
> > extra \
> > =C2=A0=C2=A0=C2=A0 texlive-latex-extra texlive-lang-japanese tex-gyre x=
indy \
>=20
> Wait!=C2=A0 There is no mention of xindy anywhere in your changes ...

Apologize, sorry for that! Yes, I missed to put this into the new FAQ-
BUILD part. Will do.

>=20
> "make html" and "make epub" complete on my side after I added xindy
> in the prereq list.
>=20
> Now I can build and inspect HTML and EPUB output.


Excellent! I'm looking forward for your impressions, take your time. I
dont have Kindle or other popular devices, I have a BOOX 7" epub
reader, but on small devices or large fontsizes I do not expect nice
looking tables and listings.

The purpose of my RFC to find out if this epub/html target worth to
pursue, or its not desired?=20

>=20
> Thanks!
>=20
> Akira
>=20
> [...]

Best,
Ferenc
