Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF31A725C
	for <perfbook@vger.kernel.org>; Sat, 18 Jan 2025 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737233391; cv=none; b=dc0OPNZKCAcXqPemfhUazn6pmgJd4j8Vx3H49W0yFoQ6oaeGGU1+4moBdLSWTUEj233jv5cAapoQZUIMWupbd6zttCg+Hz67uMXgrGVhtj4vIIFSZu91IhRTESMICkSV9EPZu91JIzfmCpVYxCc8z9VWxmxEIazZuglN4UJlyeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737233391; c=relaxed/simple;
	bh=dp7eWCtp3msbP3WZe/Ickox4Z7afT7oIBUJGSX2BlT0=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=IM0bYH8S7/M7Tg5tydzMCF6oTw2XsKCI/eSkqJK2P81YHyTnjEpw8fZqlPEGbrXA1joq8JUfag42JreMATqhUf3uOfuXgOBaZgOK+2CvvBc0OK+5fGVe6DxJGUKhZA3Q3diHisRM+r6iZ7rOfHTjEPrvxZOnVDfG5OfHniZ036k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ey8UyWBp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ey8UyWBp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21680814d42so54045015ad.2
        for <perfbook@vger.kernel.org>; Sat, 18 Jan 2025 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737233389; x=1737838189; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=umDGs7+J6GxS/jDJ+bRGfszAx18RqItHwRxK7OV/2DE=;
        b=ey8UyWBp8K2CiKMe9uB1r/7g58KG6jbKFU1tk34QpQEGTlSrDtuJ2firJ/PADc3oVf
         UrjpzP76lXi3cy/J6wRD/g2d+yGHiOhc6fuDz2crKDE702GleKH/B/bxXOO47q87h3qS
         l1ffXOZS5fhwjB+V4HhMwWLBz6cmi4Oz1TPoBrv9jp0FI6VXqzNCh6LWder58u+VQrn1
         w8moljSnPLf4Vx1Zj8E+SpqLZlUB/xz+S01bvJpHWF5HuwjfL5dTYem4+xg+NSDA5WsU
         OCFDlc1xH8Qwc7GeM4F1LDzGRp/p6EgbC/hQJGA0AVwuAD0ehzB3+WFDvhVHNs52rtcb
         UIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737233389; x=1737838189;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umDGs7+J6GxS/jDJ+bRGfszAx18RqItHwRxK7OV/2DE=;
        b=jWUqNKro0DqPbNv8iWsBu+DS+9O27umX8Z1TClfadRn2OoKxgIiI36b4swt7e9Q3Mg
         CZl/CWVggnwWqrIhSR9wP0W3JYHwgLQn9Za37svWAgIOJd8Sm/KNRNIjk4W1vAxJ1w4c
         AYTiz2tODExuBuP5/p9c4swLUgo8UBkfYr4PkCBYSQvfU+xLZsGMpDVceUGWaZeIg1C0
         R8P9QdbDUEt5KmZAfZfgwMD6hHLApZVNTAkbIvJQev4xo6+019EkEGllUQxYs1rTA8vJ
         MO7JIm65gnXI06/H5U8HWoDd3S78nUBDR5o1XXSWnnlG3INcL6Jlx+mgiESjLx0KyzI5
         8sDA==
X-Forwarded-Encrypted: i=1; AJvYcCURcxdwH3MRrPuSXeSTExnOD93RglMmgWHx3VsiiKFzebpCdwvB2Imku6QFtBLdTW7EABHkPllC3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwencgnzXkm3QiNWzaRR8wGbqbpB3OXkZZgIYwSDOLdKp8K/WmV
	QKj5rGVjDHKPnOwNuR+vsNsGSmTiSKJC5msfff/fjQ5+7N3K4207
X-Gm-Gg: ASbGncuZBc3b7lzZi0wxNXBYgaHZI4T4MYX7hfGI9LtUgDjSktyHZvnM/UziIrwAFav
	K7uwrWEoSOWoXvuI702lP3BaW2ggqiHB87gcJV6NiRygV04+11kuJLp0jBsX0uQZwIv+1YLaVu0
	ecusi8AYBi5m20LrTHbFc8kyAZ64ITyxZZYkQTl4uNU+p5L9IYZDuFI0aJWRaV7RGjOer20tZER
	GvDprxMpeyhe9vUzoRfQvGDmWV/FkNCSFmkjIspg84rDcdmwjHi5UFTe2Bud0aOfd24jC3+kJ3d
	9Fn2af+UJcOr22r5CM5vSGjBSlLOqRQWBA8usw==
X-Google-Smtp-Source: AGHT+IGFmcizU1SSatU9IWjFzX8kyUM8uzTtFrjBsfflE4KqRh+ENpI/EyyKqP/z9v3Er3vrePbaMA==
X-Received: by 2002:a05:6a20:a110:b0:1e1:9fef:e959 with SMTP id adf61e73a8af0-1eb2159bf85mr10418784637.27.1737233389180;
        Sat, 18 Jan 2025 12:49:49 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:b5ab:bd8c:63b4:4a03:edd? ([2804:1b3:a800:b5ab:bd8c:63b4:4a03:edd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab812f21sm4161846b3a.43.2025.01.18.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 12:49:48 -0800 (PST)
Message-ID: <75e169509708600bc90db4cef897778929c4d4e2.camel@gmail.com>
Subject: Atomic Limit Counter Add and Subtract, and QQ about goto
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: paulmck@kernel.org, perfbook@vger.kernel.org
Date: Sat, 18 Jan 2025 17:49:43 -0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul,

I was reading the Counting Chapter in detail, and the QQ about avoiding a G=
oto
got my attention:

Listing 5.13: Atomic Limit Counter Add and Subtract
Quick Quiz 5.43: Yecch! Why the ugly goto on line 11 of
Listing 5.13? Haven=E2=80=99t you heard of the break statement???

And I was thinking on an alternate solution to those, by calling slowpath a=
s a
function in this simple change:

```
inline int add_count_slowpath(unsigned long delta)
{
	spin_lock(&gblcnt_mutex);
	globalize_count();

	if (globalcountmax - globalcount - globalreserve < delta) {
		flush_local_count();
		if (globalcountmax - globalcount - globalreserve < delta) {
			spin_unlock(&gblcnt_mutex);
			return 0;
		}
	}

	globalcount +=3D delta;
	balance_count();
	spin_unlock(&gblcnt_mutex);
	return 1;
}


int add_count(unsigned long delta)
{
	int c;
	int cm;
	int old;
	int new;

	do {
		split_counterandmax(&counterandmax, &old, &c, &cm);
		if (delta > MAX_COUNTERMAX || c + delta > cm)
			return add_count_slowpath(delta);
		new =3D merge_counterandmax(c + delta, cm);=09
	 while (atomic_cmpxchg(&counterandmax, old, new) !=3D old);

	return 1;

}
```

Does it make sense?
Does it introduce any overhead I couldn't see?

Thanks!
Leo


