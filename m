Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377E7ED
	for <perfbook@vger.kernel.org>; Mon,  1 Jan 2024 01:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6jWoGZg"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3ba14203a34so8311723b6e.1
        for <perfbook@vger.kernel.org>; Sun, 31 Dec 2023 17:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704070838; x=1704675638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oIh4o85JQ014cFhmqXJoeZTKAaru/qu0NLmXp2nxYA=;
        b=T6jWoGZgZ4oMJ5EuvIH2WQQXabHITuQnhoCZm+HDAYjo+CdsGdql3MzHRxEtTNa6SB
         JAlmHJL1bDn3P22csr+nv+oFuHTg+cx1R8ruygdI9k2Nn1KE+zgYR8tra4dwH4JWr4lZ
         XJ+SzWnLRq9Egm/yRIpQA1xYQLSQfS7Jj37p6UhOKzRN/7oIrIDGbaPgq7epQEmb8Mrq
         81035NRoeossxkrUgvIUfteEdsTuLj0VesnBmXkO5iclUMXe4NqDqU98lYx4wTwpvoMn
         jKIRICkQUJGtYleeBtA9r5RJ0Mi0Qr3dLrjPFBNSO1J2h+RXRFwPPRYYbkc6uvUnSE9Y
         MMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704070838; x=1704675638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oIh4o85JQ014cFhmqXJoeZTKAaru/qu0NLmXp2nxYA=;
        b=CExxkjnvU3k4DR2UHePylWRFV0z7pZ1tk4wjusLFqLs0ffxxR+MaYlnCCKogCIkjCW
         ZJ92RJml9vpHDt67+/ru2JIagpfuKyI1DIA2ZSzYPGqEcA5Yco/ZifTo8PyAn6NZHV49
         kNpSGHh5YuB9lnn7/EgLJT6OKTBrzeORKfLFlvcnEy7c4+peX2meoK5VuOQcqLEzsPrn
         FhQoyBcKdlbkio80NR+7MrZYG61qbEVEpg/aRvNerXKUjhFpI3U2jugNzdDGFGE6nLll
         yDzG3jGUDED+3zrYw7WPYqkviI5f0gpMD4H1gTgY4dzKVm5Xj+40UFLqhSM+4Js0O5Uz
         06pA==
X-Gm-Message-State: AOJu0YwrI7rwCLyYS5l+SnXVaJrBfBk54TMv/9bUzcGizqCWa43YWL1t
	cO8bPEGlHT8lzhh3p4Y1vxw=
X-Google-Smtp-Source: AGHT+IHvsIXjzizpivStfi+GVdJ6mPG0E4zSgtiE0L6WuZlOlmexEJQqN4drFDDC1NPPpqQXFslNHg==
X-Received: by 2002:a05:6808:1211:b0:3bb:9761:7f7d with SMTP id a17-20020a056808121100b003bb97617f7dmr18203741oil.68.1704070838457;
        Sun, 31 Dec 2023 17:00:38 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x13-20020a1709027c0d00b001d4910ff835sm6621018pll.3.2023.12.31.17.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 17:00:37 -0800 (PST)
Message-ID: <17245b81-9294-47bd-8ae7-a3bd8963a5c7@gmail.com>
Date: Mon, 1 Jan 2024 10:00:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook] toolsoftrade: fix a typo: manpages should be
 man pages
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>,
 paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <1703926769-5124-1-git-send-email-zhouzhouyi@gmail.com>
 <cfa2e0c6-f3fc-45b0-a11a-2ebb5537f8c8@paulmck-laptop>
 <CAABZP2wZ=eJu2ymJpD667ivFn+w1isVA+gmw9ewT4OD8T3PGZA@mail.gmail.com>
 <24c0a06b-d0e9-4c15-a0a7-9ccafecf3e79@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <24c0a06b-d0e9-4c15-a0a7-9ccafecf3e79@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Zhouyi,

On 2023/12/31 9:25, Paul E. McKenney wrote:
> On Sun, Dec 31, 2023 at 08:11:07AM +0800, Zhouyi Zhou wrote:
>> On Sun, Dec 31, 2023 at 7:59 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>>>
>>> On Sat, Dec 30, 2023 at 04:59:29PM +0800, zhouzhouyi@gmail.com wrote:
>>>> From: Zhouyi Zhou <zhouyi.zhou@ucas.com.cn>
>>>>
>>>> According to [1][2], manpages should be man pages or man-pages.
>>>>
>>>> [1] https://en.wikipedia.org/wiki/Man_page
>>>> [2] https://www.kernel.org/doc/man-pages/
>>>> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

You used mismatching email addresses in From: and Signed-off-by:
Technically, they need to match.

My guess is you intended the one at @ucas.com.cn for this patch.

If this is the case, you need to provide a Signed-off-by: with
the right address.

    Thanks, Akira

>>>
>>> I am happy either way, having seen it spelled both ways for some decades.
>>> But those two references are good standardization points.
>> Thanks Paul for supporting my point of view ;-)
>>>
>>> And before I queue this, did this also come from our Chinese editor?
>>> If so, should she be credited?
>> This modification was proposed by me independently ;-)
> 
> Very good, queued and pushed, thank you!
> 
> 
>                                                         Thanx, Paul
> 
>> Thanx, Zhouyi
>>>
>>>> ---
>>>>  toolsoftrade/toolsoftrade.tex | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
>>>> index 645ee74b..097c18d6 100644
>>>> --- a/toolsoftrade/toolsoftrade.tex
>>>> +++ b/toolsoftrade/toolsoftrade.tex
>>>> @@ -308,7 +308,7 @@ Parent process sees x=0
>>>>       (such as \co{mmap()} and \co{shmget()}).
>>>>       In the meantime, there are any number of textbooks that cover
>>>>       these primitives in great detail,
>>>> -     and the truly motivated can read manpages, existing parallel
>>>> +     and the truly motivated can read man pages, existing parallel
>>>>       applications using these primitives, as well as the
>>>>       source code of the Linux-kernel implementations themselves.
>>>>
>>>> --
>>>> 2.34.1
>>>>
