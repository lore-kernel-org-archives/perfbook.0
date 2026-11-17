Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908690;
	b=jr8agWDAmT4yha/epIWthw4LIeoXk/N11SSiN4zszjOkB+Rj7bkPyTAM9qYySCRzveue
	 bI/2F3uuU5ZGFm5RoSxNuHnHcNCrEfHyuMFtcFjME5JoSFYa16hjv/2uqT+HXpwLeHZRt
	 nGinakkJjBCZBeSvE1OmjVDh1vyd9by5xl1zl1d/LTbdUh7ctOgOFaPdmFgfo0sw9PTAv
	 C8naJZr9lOKDZ7Tg1JadYJdNh5bq5X4lW2Xfx7n6GENHAKShNTWknDeMSyIxnFfyGEOAb
	 u98WrEX7Be95Yt8c/IIKNiNRvFvx+ZvzOpJ7kRUV9Y8N7qG98x0TcB2tp3Dne8ZgxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BsseRipL6m56e082IfWnjLwldefyPmowJIWQDtrQj8Y=;
	b=d5IyrmJ7KZ1EG3Lifwm18STcFNlpXpSta/HZ1hrahRz7TKBgmMagnXUAKTgGzXnD8EHY
	 eyuYM0c5fJJA4hB6qTH9Rvm/dbb61aEs11MIiKtleASsrPiMdgFVfugMNCQ4ZxkXEiH/8
	 352AEdGuCtLG9ndvDU/UMP6ApOXT1v9vQ8+Ml43oHR+y7Qa0Cn5TW6TpwBIKL7B6FMk/U
	 ZW12+mg6xDMhazhvOcbbI5RIy5sxhU1/ChgPvFmIXfbvOPKlnjRRWhBLTvzJW/VBRjSOz
	 7+UEkTvk8ArBSMjL8xozRJb6Pv8Ee/4JwO5eqApUVlw0zxdxv2rtVfTdiPSxxg4ACjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/Ql8/z4";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0E606A882
	for <perfbook@vger.kernel.org>; Tue, 17 Nov 2026 09:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD0E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/Ql8/z4
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b2f59de176so4718998b3a.2
        for <perfbook@vger.kernel.org>; Tue, 17 Nov 2026 01:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908689; x=1795513489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BsseRipL6m56e082IfWnjLwldefyPmowJIWQDtrQj8Y=;
        b=y/Ql8/z4OLKQvhpqRgkCnAAOM+JsVc82bv+7vuH2kepSCOFTB+R/VdaBR6qCXyLlAc
         4Qy6cO4dQjpcnCsEP1Mn0q41yEhi0owdCFEopvZ30bPdsefpJf1F1QFehGLbHmYSkPUa
         2CrRYHfP3p3ck61ULn0mgbFXfl1W1Gt3UufdWcKCe/tV8lVqQyBCH8kMjehmVasmqIRq
         ZSJPNm1I4iYoifP6ukcT2oYyK9AjHeRu5Iv7SydRlKYr/hmTnYKyNNGG2Ntcwz4yBWDP
         KEUzK887vBOpKY1n4Nbtg+y73nEDdGSXIyDz8/fIhPkrd/Q8LS5Z4g9Lfur6tbzkcnvI
         AiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908689; x=1795513489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsseRipL6m56e082IfWnjLwldefyPmowJIWQDtrQj8Y=;
        b=U8VRsSuXtoXP3nFZY/ZQVGWstdpiqapdCtf5pr+ss7WYRxZPJN8GZ4lpyh0B9joTti
         VF9RshnS4RpRTSL7NFlyCmMia4fHqB58IoluGLf9CYZZW1ZK6RWBEnJg+XTxNHb4EINY
         v2gSw0/ZLoF2QpnDzJOffLPBogMTPIwejQbVSGWN3S/KTY42YWxxO4sqSCqO5qJ9yMMD
         k6SQB2Ica8hmaw2ZRaZ0zRXxKAl9fNc3dWsOrlreZclHvn67/aLaIoNEl2Vk2t3Km8LH
         nhT8MVEQz1QkBnsz+ktlTwLt/m79T0UGU3j2Wj+fhrZ/Jqin+eHXQeWn9LlF9Ttg7CL2
         M4Ig==
X-Forwarded-Encrypted: i=1; AL+hErF4dJhMAQYP9CnFD7O8hyXHL/DI4hJ+pPAI0B9okpfW8FayDNYbpGOn8gnQ7HwEIPygxIVtXXTARA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84uK702rwfztyTdQUHZe2zjR+slc7iE3X29ksucqBwwb1BgmgU
	yQCFPyYzJb2+ULEhFVrp037XK9x+gG540kIMibeJP+7CqVK05ruUc93j
X-Gm-Gg: AYBFou2J2xtt0IxNheMS+gXTsk4RLXbyYwlhoov6B7+XcNO+p/hKwGnwjOgX0G15JV6
	2GYHC3gVARP1gP3epwcg5QzMhmJ+Cb5OJdezpbgyJQ1OLKqpEEIsL3y7UBSVZfxvD9YCmMThbPA
	Iq8giUBG9suPZxv5kvM+ECeBVr+TxYj6d+CO4mTUi762J/2oD6v3PqMzjM5IO+bDZ6z68JTRuI+
	2r0VMUjgGb2YyVOGsjjhXBMrGUTsyIuFpIqfNGRIcC4QGD5ElgHuoiyvyEXfGUSbIEhEPenOxNw
	9R0A2sBIQzT5dPlI6WvG0o397L04OScj/GMtNQB3uzVZOXk6V1yqxm+nsE2/V0SUSPoc78QL6pG
	F72/i1taeF1AZq6NNQap28oK9PwHtiKtzyMYQZVkv4gHHISVCqVtSAJLAniXF4X7TJSKfKe1EzS
	sz/bd1HdpGJbbzj+Y30lnhKe+Mp3gvQWM3M5wW8pCCmt//kBTdF+m6L10Sl+kypPbM41idvvIBI
	DjcDhR3iLjJ2wdrePhOS/j0uPCy1wGPNqiKcJgAsXIGvTJpj8ZN6KBrQYF5asQUE4jUOSCT7UKc
	tacQB+IY7XGdA1bVS0aN1Tr3FJWhDc/1mWEkS+Lok8tkuJxWBHtiCbCtv8tM0Rx8ubO0saBdSQ=
	=
X-Received: by 2002:a05:6a21:180a:b0:3eb:b103:6eb1 with SMTP id adf61e73a8af0-3f7a83b9fdemr13157645637.44.1794908689174;
        Tue, 17 Nov 2026 01:44:49 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a902esm4887369b3a.16.2026.11.17.01.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:44:48 -0800 (PST)
Message-ID: <6a18ce59-d2b2-4397-8d8a-f55b11d7b309@gmail.com>
Date: Tue, 17 Nov 2026 18:44:46 +0900
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
From: Akira Yokosawa <akiyks@gmail.com>
To: Ferenc Fejes <ferenc@fejes.dev>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Leonardo Bras <leobras.c@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
 <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
 <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
 <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
Content-Language: en-US
In-Reply-To: <1029ce85-ed7b-410f-9512-c0f8189cf066@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 11:41, Akira Yokosawa wrote:
> Hi,
> 
> On 11/17/26 02:21, Ferenc Fejes wrote:
>> On Mon, 2026-11-16 at 13:41 +0900, Akira Yokosawa wrote:
> [...]
> 
>>> That said, I couldn't complete "make epub" with debian/testing's TeX
>>> Live.
>>
>> Sorry for that, I'm using Debian unstable which is a little bit ahead
>> of tasting. I compiled it on Ubuntu 26.04 as well, but AFAIR there I
>> have to install lwrap from source.
> 
> Tested "make html" under debian/unstable.  It aborts with:
> 
> ------------
> [...]
> LATEX=pdflatex sh utilities/runlwarp.sh perfbook-epub html
> pdflatex -draftmode for perfbook-epub # lwarp wrapper generation
> pdflatex -draftmode for perfbook-epub_html # HTML pass 1
> ----- glossary generation failed for perfbook-epub_html -----
> make: *** [Makefile:701: perfbook-epub_html.html] Error 2
> ------------
> 
> So, build_glossary in runlwarp.sh returned error.
> 
> Can't you reproduce it?
> 
>>
>>>
>>> In perfbook-epub_html.log, there are a couple of warnings from lwarp
>>> as follows:
>>>
>>> -----
>>> (/usr/share/texlive/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
>>> Package: fancyvrb 2026/08/13 4.7 verbatim text (tvz,hv)
>>> \FV@CodeLineNo=\count416
>>> \FV@InFile=\read5
>>> \FV@TabBox=\box69
>>> \c@FancyVerbLine=\count417
>>> \FV@StepNumber=\count418
>>> \FV@OutFile=\write7
>>> )
>>>
>>> Package lwarp Warning: A definition has changed:
>>> (lwarp)                fancyvrb: \FV@ListProcessLine
>>> (lwarp)                (9A9947A55E3D6D1C92E99F16EDC0BC68)
>>> (lwarp)                 on input line 118.
>>> -----
> 
> I might have been confused by this warning.  This "Warning" is
> actually an "Info"-level message from lwarp, isn't it?
> 
>>>
>>> , and at the bottom of the log:
>>>
>>> --------------------------------
>>> Package verifycommand Warning: Definitions have changed.
>>> Patches for the following macros may need to be updated.
>>> See the previous warnings for line numbers.
>>>
>>> Syntax:  Patching pkg -> Defining pkg: Macro (checksum)
>>> -----
>>> (verifycommand)  lwarp -> fancyvrb: \FV@ListProcessLine
>>>                    (9A9947A55E3D6D1C92E99F16EDC0BC68)
>>> -----
>>> Look for updates to these packages.
>>> --------------------------------
> 
> I have no idea if this warning from verifycommand can be ignored ...
> 
> In the log under debian/stable, this warning looks like this:

I meant            debian/unstable

Akira

> 
> --------------------------------
> Package verifycommand Warning: Definitions have changed.
> Patches for the following macros may need to be updated.
> See the previous warnings for line numbers.
> 
> Syntax:  Patching pkg -> Defining pkg: Macro (checksum)
> -----
> (verifycommand)  lwarp -> fancyvrb: \FV@ListProcessLine
>                    (8FA4321A9DA36AB98D372ECA1C77A9A1)
> (verifycommand)  lwarp -> siunitx: \siunitx_quantity:nn
>                    (FF98A02B319EFF149546639C91E88F02)
> -----
> Look for updates to these packages.
> --------------------------------
> 
> Thanks, Akira
