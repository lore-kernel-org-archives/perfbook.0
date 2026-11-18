Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997980;
	b=t4yhSbdJv3oVKwAngYnYMXnHe60Aqf8orpJUBc681Osyvx/jxmRCVss2vVpTm6Jqorvl
	 cAP25xz0Wo0Lj9CNIQEKmZxooEaBO/le2R+1uD9+61mvQBmriWiGUT/mn4K8MbNgllwYa
	 N0vEDM4zZtFIv10AIeDGN/DlBLs5LwexL6igf4ur3OTsBNYGQSNYxpaF7ZhUb6b3UGuby
	 zZcD/zDZKwcDgR94g92pOHD5ml/B4orAf+92PVAkifXwILzOe1hCl8f283UVMlA+8VRbr
	 6PbUqjE2Yqy+4anGyXc7pUUhLzWzNZEmn20vdbQ6UNcczA/NA73aCXwAE4cVf7oxtGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JVdAI1adhy0+xyfCQ7baIKA1dDnrEYEwh3AsH+n7svI=;
	b=ZADg6vASmHi1Rdm4M+Ae4UJhM2HF6WlICWxgjC60VQAf9floeE1PbIo+Hue1TqzWfRKj
	 QGpkrKlgfqZpaAIAHYLs8xQwGiVovcbG3vu/9pCvQ53+evsNWps4AbXITMwtFOJ+9tCMQ
	 UUvKDMrAjSaOPjMeUYjHuwAYN3KJXDkOgozXdn7gjWFkS4xt/OjBF7l0o8Zcm3rf4x/p9
	 XgKbqLPehzn+V1WF4JQsM+s5M/P0TyDbZAS+SFl4tAI9b+A+DhkWhVtim1QaMF0YHvxJf
	 AEVIPF8ybMQNbm2EpFMm+BA/yxIoviuV8DfGCCME9AHXW8zgGaMhpy3cA8xrqvH/tiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AzlP0/pH";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815CA606A31C
	for <perfbook@vger.kernel.org>; Wed, 18 Nov 2026 10:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzlP0/pH
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so474881a91.1
        for <perfbook@vger.kernel.org>; Wed, 18 Nov 2026 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997980; x=1795602780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVdAI1adhy0+xyfCQ7baIKA1dDnrEYEwh3AsH+n7svI=;
        b=AzlP0/pHglv0uwIXEORontrX6n2CRR26LLn1F1V5XWdbZMqrvRJdUNbaPcnUt3H6Wz
         XZ9i23FFPQMR8pnhdTfu8dPYMz1FKrRBjv+VHHo550vShDgCbqvCgxNBVrxz7aibH+S5
         SC8NCi317nhVptk10FfCbUs0rO1+34gNkGg6T/hYKVumT5AVj72ko8sBmLICJJztO/dG
         WyIvQChkO1EDOTaTAtn+jCtBrmxa2TU+fN20MWs2UB05BmpuUG44WhSZKKBYrkJlvKsg
         DpRMVXqmlWpI3daivQ8+83kyCE5k3+jpcQeCih5+juJjUY8U8iw2gGFJvqTiiBIwKrnH
         f1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997980; x=1795602780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVdAI1adhy0+xyfCQ7baIKA1dDnrEYEwh3AsH+n7svI=;
        b=sspXR4MpWmyJc7m7piNhBNzyGbRxIcd3rDxWmp/1OQ49yw2FYXWpxtkL9t0K1a86i7
         WfOhmuK8cA9wQkwraVf2zyOSc8XS64FpF/2M0y14cux8YP0Khsj39ChGi/qXtQVbYcgT
         mrDMmWDqa8k3Y7ATzqM+duoMiMo0vPXa2wr8WLvH2Jv0O+qvXnwuuR+2N3Ec3vx/+Axd
         +iddA0pdrR1+eQzIhNx4QdbKUAH0swykZH2j/r0cNjRRatuO72qaaGWr9LQErSTIALOV
         Wm15shkjuFXlzo0ShV+DaHWbwXALNQivmqmNotSJVtilevOQAYdTy65Vqme4aERaEmQ0
         Xytg==
X-Forwarded-Encrypted: i=1; AL+hErEqWicft+79oGwvL0YqxWEQbOxbkK4bnTrn20Ip8kgvf/rECLTfRWRzr+OiX+ou8t+cKJYzw6WU8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z800sCoRkzjBVG8VCrf5JdqAiljutgc4F4XnJazF+rmJSum8Vpp
	Dyvym8vNlIrhP5IiJv4rqqy3JmqyyLseaXKkGO71M32nevik70U1Oek/VedQkw==
X-Gm-Gg: AZFdTZcIIdVDqY6xbqDk5zMS2oiKVopaSUVp5LA5aC+MvcQTGw/iUFNgc1T7xs+cxeJ
	ZHkQb4j6pOkMb2BQYIzIG51/C6Ew4nlf1zVaRqw52JLiwKLLDeqeili60oKtT85slsHKJM9QH2a
	imlnkXNLwf6TGZJI3b5orRUkjR1Z8K6Qc1vN0EnH8F6h2J6TpwZpm6SQAU0zeTYMdekIXrCNDeR
	yCnto52hx9HmHyYKuSBqT9vPGQegbJlSaQ/1lrot35srmSly6PyPdTcKx7gtofN+YCmAmJfUdLi
	YmZXwxo/9ZiV+FwhpTcg/t7qkbJWJBGvJ0BqgbzGJnQN3HtIxh8I7W0PSSkbm4peTvKGkWrUe1k
	rFwGMDQBk4mPv658rBKuF+zMUQoUUNlvSD6Ql+xhUG9uU/PNVSrXs5EfJouZ3ViCvJiIOQ+eKZ0
	1jvykl3NTqN5csgJJsftTSAqvWaZjA3ruWRNOrO3SuezdYAsvNwH56ZRhUtGV8rkjIcbkw6zKSS
	u6I95pMzGvJBOI9zMrsp06Mq6O8b2tRlUCqKPp5lKUuyxmjanRpDIquNUJAiYncag0DusKoFQpB
	W3Tic8ybTFl/OLTk9a14aKYKVWnT7G1ajHV/0BbPTTrbaMHNBwgbBKudQzi0ly1npq3JG1h5PWa
	tjxcsbnFtHUEhQTmMyTU=
X-Received: by 2002:a17:90a:d2d0:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3b3d051ac2cmr2161168a91.0.1794997979789;
        Wed, 18 Nov 2026 02:32:59 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ec725sm1410671a91.4.2026.11.18.02.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:32:59 -0800 (PST)
Message-ID: <58a73032-86a4-4a19-8e07-e30110117edd@gmail.com>
Date: Wed, 18 Nov 2026 19:32:58 +0900
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
To: Ferenc Fejes <ferenc@fejes.dev>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Leonardo Bras <leobras.c@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
 <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
 <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
 <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
 <6a18ce59-d2b2-4397-8d8a-f55b11d7b309@gmail.com>
 <ceea81feffcb33c0749230e9b0bd8ed555027514.camel@fejes.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ceea81feffcb33c0749230e9b0bd8ed555027514.camel@fejes.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 04:55:54 +0100, Ferenc Fejes wrote:
> Hi,
> 
> On Tue, 2026-11-17 at 18:44 +0900, Akira Yokosawa wrote:
>> On 11/17/26 11:41, Akira Yokosawa wrote:
[...]

>>> So, build_glossary in runlwarp.sh returned error.
>>>
>>> Can't you reproduce it?
> 
> Unfortunately I cannot reproduce it. It builds cleanly both on my
> machine and with a small docker build I put together. Its a bit
> complicated because I dont wanted to install and configure docker on my
> machine, nor put an alternative texlive on to my disk. But feel free to
> use only the docker file and build the image with docker, if you have
> it installed already.
> 
> Here I use podman, the script grab a pre-built binary from github,
> build the dockerfile to a debian:unstable container then build the epub
> target. It works within the /tmp folder,  I put here the content of
> both file s/verbatim:
> 
> Dockerfile.debian-unstable
> 
> FROM docker.io/library/debian:unstable
> 
> ENV DEBIAN_FRONTEND=noninteractive
> RUN apt-get update && apt-get install -y --no-install-recommends \
>     ca-certificates locales tzdata && \
>     localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
>     rm -rf /var/lib/apt/lists/*
> ENV LANG=en_US.utf8
> 
> RUN apt-get update && apt-get install -y --no-install-recommends \
>     fig2ps inkscape xfig graphviz psutils \
>     texlive-publishers texlive-pstricks texlive-science texlive-fonts-
> extra \
>     texlive-latex-extra texlive-lang-japanese tex-gyre xindy \

Wait!  There is no mention of xindy anywhere in your changes ...

"make html" and "make epub" complete on my side after I added xindy
in the prereq list.

Now I can build and inspect HTML and EPUB output.

Thanks!

Akira

[...]
