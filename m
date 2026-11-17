Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883282;
	b=kyZ8WtVFRH2DRV6tRgOiGkMFFQlnjkSYUJWynXe8fWIt4mY4uNdsqeDQY+xCt2V5c2dD
	 zcL73FnezGzCqyXm2SSJS3uDj194B6Dy5J+NZmzpVIfCt03KFeI5jrZyEJcrXaTFghSY7
	 oTU9YuZcKkxWqF8INL1ER7IcS1+kRqlfbh8zjBJqc+NCK0MBRMEBizEZRhoDD1Jj8W6W5
	 ANMHmKssJn02GJQV5N6BIGvARNOP/GmgHrdl4ASCnlGhChPqhpZHEFYNowXjIDzM4axSE
	 m55GUW65ymAbCHwlvHJ69n7CVQfdPg67RvxPBXezlO6+I+/z2zzQhBTrWDg/CBKpMmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aVjhIe6oy0tXQKJfsaUf8I9br1xUoT30L3YFId2kTI4=;
	b=OrXonQvWmn+dB26Uc1uDLnQRxLd68j41DPnVEKLuw3uMwSzYxsk5NrLizVtGtJhxysaR
	 Fs5FMR/k8XB0+cpU4AnoFP5/nAkxaAb7IaeyoPKldIt9MyBPlX61/ud/rUZoa8FY9newW
	 r5sFglR3J6j8V8rV0Gskph/49313hmXVxb+3Pfgx8m0/Hxev+t6P/p00pgHDNZOmE1T6A
	 s2C5LaJxpKTpDT3Shb2DF7q4Y5qKtbeY6ymMxkmYIP/Ef0x2pB0pueJ4lYfKSnXxTVloO
	 k/RUx9KsekdcZjqWn0XVcTXmGdfzfOlhrTBR7ECza3GN14lUh4tdIsqtZm3zGZa3nMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqGHmWew;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B613606A323
	for <perfbook@vger.kernel.org>; Tue, 17 Nov 2026 02:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B613606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqGHmWew
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3988983a91.3
        for <perfbook@vger.kernel.org>; Mon, 16 Nov 2026 18:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794883282; x=1795488082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVjhIe6oy0tXQKJfsaUf8I9br1xUoT30L3YFId2kTI4=;
        b=mqGHmWewhYNnjZpXpON9y1PH58LzwzEyk3HrzVFd3CEM6K1S7M1WVsfK3bM4MR1xZk
         MStD+wUNTm9yuawErxd5dt9Z8QiXmaquIAJpnhHmW2UdVDTV0P0wJR3oIvzN1/DYPotY
         5OQikQmqgIw2wdevvycU1F/oaJ22FSUgLXupWxcsJar5dQNEfanS78R29VPHxnIkt+Fn
         jWgtM6q3T7Fr1sQAnSN/lxNmmB2e5W41skR1oHRkWLQgHKHyt2/sGc2ZiUoaXAnASR/m
         aBD+C6w48qu3LGkdB0auhO27aTEn918OdRJ3kxgFnc/HEA1JBGovC6PMwvrlDdZXw2mo
         ogwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883282; x=1795488082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVjhIe6oy0tXQKJfsaUf8I9br1xUoT30L3YFId2kTI4=;
        b=bL0a86tZDnAXIl/v6c+UQ044O/aJe7iB6R0O63Lx3HADhF5FINnqvlHy+XJMNg0cPI
         BuwFrp6yEoLIe39E+mWAHeZwH9hjriNJobBStKOBUziVgaCQSR5Zp28mR9EILxQAlOyb
         FDj7x3X9RjQQlJI/HwKtfwvI7atB0C7ed23PVbby8t+lQPwwEEwu+qzhgfTa1RZwaS2m
         TO9oWnN0dESADNtRSbvmCRBtjJInAopzrqEGFcjWmuijrcGVS+BaZ6hqzQYeoHcMlLvK
         wvCXkA+TTB3B8NwQNumXwVJ/+NkrNXplVZgF5iVz1RA3an9hC3yCWVry9spL7TxqTitp
         UYvg==
X-Forwarded-Encrypted: i=1; AL+hErG1htzpxR2TiBIwdnX1VLwrQkjABmB/5QSOA5SO2ugFMsd95zDmRGeuxpaRpRwNik4jJKIpmnSjjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+A/ZQIdSZdZaS7rvmauHkPuuZCAk4ff2eOjIUgIuWYX6S537P+
	VWjHCOwaFieqA5uMb6Bwgm2HomeREg4IJpO9qwi35a9qmO3FBPAjg8e3
X-Gm-Gg: AZFdTZcVq68Qf6WIQza6qWYUgOB/Fqz2fsqXFDbDPX8GTgJ82aPtAzIplPvejqeh9iT
	ejp1UseLewtEjVLHzd17tsEx8d4VGJMBRzG96++Z46McJpsKDJTt/GFejsVrsZHjdUfo/5B6+4E
	VWqjMwr6VZHUa3qstLiT9KxLy3okFoZyzI2h5EoGWvNE9VsXKyocl6yUXVbNR98nwYEAIPDJK/2
	hW9DKyCTMnuMg6qgwL2jjUbPtZjZVz1I4fFZOwANEzUD5uY+VMue/+p6jhwneC1ltyBqcuV9jOZ
	Ex0bqoIAlYwmO/4tTbH8M8WJbR4Om3/xSRryHqC2Ry4Oq0e0mQkjd8ozxRGS5BBKGNPCv8D1mpp
	LVU/enO9hL4x2G633lTcGG9xA5ahGMnZqJOqXdILgMQ/W5/W4J8fopsTNNL/OVCfeU3+cdYGOYA
	npRa2bpE8ATfZM7pfyFvFbF5OxX6uozDnw3D6uAjPGvY37fFTTvcJIwpDHBLqMFaGJfEfrVACEN
	B/duVDNqzCkpfGxCM1SvrFts9CPuFM6WJ9TgNDluh4fBQcu4WKkLDwThovfLR4zvqss5SPqGKQK
	tirp1rBA1jvfSPKvFL4LvN6Z5zmKB7DUnns8QZ2PDZ5Nl1uxdUOiJjV+Y+4VafAde3T80oIrhSA
	=
X-Received: by 2002:a17:90b:3f46:b0:3b0:cc6f:104d with SMTP id 98e67ed59e1d1-3b1b0a48d5fmr12800790a91.51.1794883281636;
        Mon, 16 Nov 2026 18:41:21 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3b3f7ae72sm611600a91.10.2026.11.16.18.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:41:21 -0800 (PST)
Message-ID: <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
Date: Tue, 17 Nov 2026 11:41:16 +0900
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
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/17/26 02:21, Ferenc Fejes wrote:
> On Mon, 2026-11-16 at 13:41 +0900, Akira Yokosawa wrote:
[...]

>> That said, I couldn't complete "make epub" with debian/testing's TeX
>> Live.
> 
> Sorry for that, I'm using Debian unstable which is a little bit ahead
> of tasting. I compiled it on Ubuntu 26.04 as well, but AFAIR there I
> have to install lwrap from source.

Tested "make html" under debian/unstable.  It aborts with:

------------
[...]
LATEX=pdflatex sh utilities/runlwarp.sh perfbook-epub html
pdflatex -draftmode for perfbook-epub # lwarp wrapper generation
pdflatex -draftmode for perfbook-epub_html # HTML pass 1
----- glossary generation failed for perfbook-epub_html -----
make: *** [Makefile:701: perfbook-epub_html.html] Error 2
------------

So, build_glossary in runlwarp.sh returned error.

Can't you reproduce it?

> 
>>
>> In perfbook-epub_html.log, there are a couple of warnings from lwarp
>> as follows:
>>
>> -----
>> (/usr/share/texlive/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
>> Package: fancyvrb 2026/08/13 4.7 verbatim text (tvz,hv)
>> \FV@CodeLineNo=\count416
>> \FV@InFile=\read5
>> \FV@TabBox=\box69
>> \c@FancyVerbLine=\count417
>> \FV@StepNumber=\count418
>> \FV@OutFile=\write7
>> )
>>
>> Package lwarp Warning: A definition has changed:
>> (lwarp)                fancyvrb: \FV@ListProcessLine
>> (lwarp)                (9A9947A55E3D6D1C92E99F16EDC0BC68)
>> (lwarp)                 on input line 118.
>> -----

I might have been confused by this warning.  This "Warning" is
actually an "Info"-level message from lwarp, isn't it?

>>
>> , and at the bottom of the log:
>>
>> --------------------------------
>> Package verifycommand Warning: Definitions have changed.
>> Patches for the following macros may need to be updated.
>> See the previous warnings for line numbers.
>>
>> Syntax:  Patching pkg -> Defining pkg: Macro (checksum)
>> -----
>> (verifycommand)  lwarp -> fancyvrb: \FV@ListProcessLine
>>                    (9A9947A55E3D6D1C92E99F16EDC0BC68)
>> -----
>> Look for updates to these packages.
>> --------------------------------

I have no idea if this warning from verifycommand can be ignored ...

In the log under debian/stable, this warning looks like this:

--------------------------------
Package verifycommand Warning: Definitions have changed.
Patches for the following macros may need to be updated.
See the previous warnings for line numbers.

Syntax:  Patching pkg -> Defining pkg: Macro (checksum)
-----
(verifycommand)  lwarp -> fancyvrb: \FV@ListProcessLine
                   (8FA4321A9DA36AB98D372ECA1C77A9A1)
(verifycommand)  lwarp -> siunitx: \siunitx_quantity:nn
                   (FF98A02B319EFF149546639C91E88F02)
-----
Look for updates to these packages.
--------------------------------

Thanks, Akira
