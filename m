Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD941A725C
	for <perfbook@vger.kernel.org>; Sat, 18 Jan 2025 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737233528; cv=none; b=kbGhQQBHa4TYwE3gqKBbCYjulAKm4r0IuBEpVN37Pywxwq4/ArxvtvmxZcoY3FSDVrPky505gQeltrvSr/vzf3dYqROAyRdOS3dfVOkyF0IvPTNAucQa964LJ5BYaXHqkHyX3MZqPGJ9PdHL9FjXMl2C5vl3Ft3mS8NoMLYz2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737233528; c=relaxed/simple;
	bh=nq+117BBOPgEz1GVTUNSsvlTrJ7k6FQoo6UfRuCaKGU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3aO4r7CmeEAiRKSnpiSQgQBG0MwjYXz+4CoSqDXD2kA02bY8Kn1Zb1OuG1mEbUoWozc+GD59az0ACKL8xPb6ESaYgPAAODpArI/25+GfS3vpIJqqPpwNKHgS0IZmnM4QvvR6tUom5xAzqCH0JRrmPowMVo2sOQ+QhNlVsCe9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNfz6RKf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNfz6RKf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso2079974a91.0
        for <perfbook@vger.kernel.org>; Sat, 18 Jan 2025 12:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737233527; x=1737838327; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt0pkVVycilnWFiSE/Qa68ViMA8aezp7kodBRO2vetQ=;
        b=VNfz6RKfBbrDbTT7UshleuLUKMJQILjKBczmzt/OH/6AcrrBJZ1dg93Hs/eQtOuCfK
         jCfgY/ZWjOk51w7UHQFDaLKpx5qari6+Ybswx3RzoTK99ORbvorujZRja329IMmX0UXy
         z9BShd5gOFubzs7in9bywkL9xJbD1LrAFFzKoAZujEzX26l2JtblxeNlUhYX96Q7acT2
         DfgCOEwlDbME0EErtSmZOA4ZU881bs4RSe6brQO/gjMcVY64b8KT5JYrnLTkBJfkQjh1
         O+vjZoqqAuECuQriFSvKKHlauBBjRkz4YFWIKJ2SyMntaqQr7jTNQr+ScvUxGizG0wN6
         iSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737233527; x=1737838327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pt0pkVVycilnWFiSE/Qa68ViMA8aezp7kodBRO2vetQ=;
        b=aYUj3pFD+HT3gJZzHGB74iyayEP6sKtVAG3v5ETzLY5PQKD/BF44+ct8P5Nx4moG6W
         1g0VP+GFNhI6LXJkI+BTp9Nd0yjr2SKJUoAGTa5HzIUgdE0MJzkNuz8qAo1gdS7iPgcA
         /h1fxRF4Q2CdkMPMVJwE7Bc/QYPQrZ6gQhKPCzV2TYhGxNfVq99Cj7TCYCjZB/WueZwU
         nYjRW8mE0V1uW6Owtjohk+LwNGU6+bGEDMdj+/FBuEqzCxu9LPmTrQhonFz/gd+F1huL
         AKX+yWfP9PCgdb70cFxkGsH0zlN6CaWppfVTvlBrY1MRZMrSwwGBYIL1xcFhkeb3o2Ao
         /SFw==
X-Forwarded-Encrypted: i=1; AJvYcCWipkxGE20Mm2Fx9q1chLJ51UkBXyyxShWViWgjc5yWmo815kAZY4dEuEvJETonydDLINnxiRCtrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRt0EKXmkiAMY+9VHC0AlKl2OnPE2OCjT6FuA4NXI3HXNCp2AF
	yHVpSetFm9mVD23zT+b2lqL72WTUqwz5XG6YHf/8LyLqKARysWtA5g2P8A==
X-Gm-Gg: ASbGncs+5j2DjKw5clqDYpj0JZz/6XFdskGqKhZF9HVby9MvcDEEnK9YFOphl74a3iG
	gwpURWTUoSQDJYnOSaNHcdCXofcVGpwyUYoXijYswd21EbUS/DunKIkiZi89q5iHsPoOZr93fRL
	nkXxfwqyWgXUh6Wr9t4MTZjaU45giJoDYsbdmANpkolxoaH7tAxDk2GrcyiDDHJGMttJwNf9hHN
	6cYCdHl0JTLSckS4g6SRC4dpEvCnbNjV/DDzqQlNlWmVnrsdrZDir1e/1l2wkGgjDCjGbg40puK
	sN1BaOE8unuaCfsLuRq+PFDv6yNDTMA0qB9kZg==
X-Google-Smtp-Source: AGHT+IG9NmsnNw0AYKcYj09MFKds8WkCfW6G/eZSFG0S6kA2LCNZUU2YLhfUOlpz0ag7Ew5juXJ0fw==
X-Received: by 2002:a17:90b:3a46:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-2f782c519e2mr9835319a91.3.1737233526624;
        Sat, 18 Jan 2025 12:52:06 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:b5ab:bd8c:63b4:4a03:edd? ([2804:1b3:a800:b5ab:bd8c:63b4:4a03:edd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2f6a12sm7668695a91.41.2025.01.18.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 12:52:06 -0800 (PST)
Message-ID: <14e20db14385717ef5bd02468900f5e7afc194bf.camel@gmail.com>
Subject: Re: Atomic Limit Counter Add and Subtract, and QQ about goto
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: paulmck@kernel.org, perfbook@vger.kernel.org
Date: Sat, 18 Jan 2025 17:52:00 -0300
In-Reply-To: <75e169509708600bc90db4cef897778929c4d4e2.camel@gmail.com>
References: <75e169509708600bc90db4cef897778929c4d4e2.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-01-18 at 17:49 -0300, Leonardo Br=C3=A1s wrote:
> Hi Paul,
>=20
> I was reading the Counting Chapter in detail, and the QQ about avoiding a=
 Goto
> got my attention:
>=20
> Listing 5.13: Atomic Limit Counter Add and Subtract
> Quick Quiz 5.43: Yecch! Why the ugly goto on line 11 of
> Listing 5.13? Haven=E2=80=99t you heard of the break statement???
>=20
> And I was thinking on an alternate solution to those, by calling slowpath=
 as a
> function in this simple change:
>=20
> ```
> inline int add_count_slowpath(unsigned long delta)
> {
> 	spin_lock(&gblcnt_mutex);
> 	globalize_count();
>=20
> 	if (globalcountmax - globalcount - globalreserve < delta) {
> 		flush_local_count();
> 		if (globalcountmax - globalcount - globalreserve < delta) {
> 			spin_unlock(&gblcnt_mutex);
> 			return 0;
> 		}
> 	}
>=20
> 	globalcount +=3D delta;
> 	balance_count();
> 	spin_unlock(&gblcnt_mutex);
> 	return 1;
> }
>=20
>=20
> int add_count(unsigned long delta)
> {
> 	int c;
> 	int cm;
> 	int old;
> 	int new;
>=20
> 	do {
> 		split_counterandmax(&counterandmax, &old, &c, &cm);
> 		if (delta > MAX_COUNTERMAX || c + delta > cm)
> 			return add_count_slowpath(delta);
> 		new =3D merge_counterandmax(c + delta, cm);=09
> 	 while (atomic_cmpxchg(&counterandmax, old, new) !=3D old);
>=20
> 	return 1;
>=20
> }
> ```
>=20
> Does it make sense?
> Does it introduce any overhead I couldn't see?
>=20
> Thanks!
> Leo
>=20
>=20

Oh, just to be clear, I like goto, and IMO the above is a perfectly accepta=
ble
way of using goto, and I would not change it. Just thinking about the QQ an=
d
added complexity.
