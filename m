Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3F3382D9
	for <perfbook@vger.kernel.org>; Fri, 27 Feb 2026 03:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164129; cv=none; b=bWscqoAJ17frdDDNH8UHGf01IgOVrvpldumz4Hp6Kmv/Ot2MZ2xGfDKJ8w1qLmo+qNiMfRORU8LkUK0Z5FlURea3LqdHfulr3ECVvNJzwTb7Y2futFNa5nDvX3hiu/ZT4ZQTJGfpykKksD35Za5fAppR9Zet3CM7HsI1IG3srC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164129; c=relaxed/simple;
	bh=fK0Ew43AdW2AG6Nna/WCUHc0Zc+WNZ6z0nWKP3EhPNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGtZG9owAFkdkjF5xUgJwEMJ8dX4qycb6Oxr/7o4a+vb/hasTwfxD9sMjWZ6kyFWJ+DYNuJ6p4ZQW3nMI3ZHrlVh+RSynI1kiYo/T/W4RkemX82EHyqILOCjTEj7jdPJe+9JVZedLMhl3ARJq/poNVKoPpXX+/6B9ZdcGVJ0C5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYYk4rTS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYYk4rTS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a9296b3926so12738745ad.1
        for <perfbook@vger.kernel.org>; Thu, 26 Feb 2026 19:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772164128; x=1772768928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69mTVqZt10HzQb6b2vaxxtolkYGK3/RvT8cJravzf4Y=;
        b=aYYk4rTSEPiaPV1UtZkCosPX3ouKybOJH68AieHaAoxxh8aduSTLSP/eiYxnXPJCni
         2dVJ9afhJgZIMDust+7Zda5YM7tzlrrackdJj/BK8ZlS96/9jzG+yyt71dt8NqRTuMxv
         D+hD2iTOi1r6+q6ijM28W1Pwwc1kTLy4zKEPXHO4dHpSMPkTf37oK4wA/YbvXVlSr2uR
         kkUDoL8AkwkTpckUfBS3fRlZk7B3rZ+tTYpemzdCvc3yBUgBHxoB3AL2acynxUw+fMDC
         5lDejdk9IDwu50ZDiVw9mTg49mFCm+6kjVWYbytoZMlUss1XAhZFIlENY7gGOUMjWe2F
         wPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164128; x=1772768928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69mTVqZt10HzQb6b2vaxxtolkYGK3/RvT8cJravzf4Y=;
        b=XsbHBj7h3E/Zok2avzBS/ZO9UEf4j7a4jICTyzYhzO394DrefBw8DXbBr7IWPwVrmn
         ruUPRmQctPO4iz5JHJiC5HpN0NogspOpx7ukjGQw6fLF27DKnzLNp0QN7g5Fp9FDZUWO
         WV1sragZcbZy3mbouFDIWAplXYZzpwuhIy5nhutWEt5QthzikS6eouxffxqy4PuI1I74
         m9GfL4zPHmwSB0CgiDRmjHAg3U7vQ13BRsLVg0pAquDxV/ILxtwA9bqKkdARFUCkG0AQ
         bhn6KciSIQQmrZKqmqWhy2cpdtFAhb+UcVRIYn5Ikqlpvog3ctJQh1vblUvixJNGKK/i
         TxsQ==
X-Gm-Message-State: AOJu0YzTs3JY5ioT+lOE2h7dkjIHXJsPu6E8RZi1vjYoy/6iqcMDPgAF
	z5pKsPLODUc9fhGvRc6ZpEGIhYXea/zgt24JVyOseluJfldlE63/QaWs
X-Gm-Gg: ATEYQzzIHm0XIMtX2EqpvxpA3Quhog3DJNUOM+skhsf2gndPez7sFqAznocMJeNkTcH
	kXM6BhFA5xVTUyqjaJdN5FDsTJv12FzWAAe9RhmOGjpPv2BcN/yPgpzekgBOE/1LZ+7afMKIEyb
	38jebihmon8eHqKwMN6QmJTdrD3UWPv7T1IkRR65YzGQb/x3Y097TYikVb160XHZN9fhtXVUTQA
	+iGBBU6PEMfFTphG8wfSZYQIpNFfFSLdj9S4/skRiwaDmoEYhb9LMky4RtDToPAM7qQ3Ch/Nlbw
	1gqhaxzHHitF0jeOqjxmAdWoTeVKQHuZVM0X1skzQldeDzqxH714X438Go38kfdD+kYPlKy5D3W
	7VH4n5CMS9frjazBEepDQzvlrdKWGhQ8mwROncdJgZu+NYfgZQ6BDvHZ6DsUh9zZmXYPNByB9mJ
	6PPU/kFHmuhzCgvYg8H8wxcyRtpd5giw/pMf4BpUfgStAqWwD7ks/wd/I8fEbq4ZRQto96
X-Received: by 2002:a17:903:350f:b0:2a9:322e:1964 with SMTP id d9443c01a7336-2ae2e3d67b5mr15892905ad.31.1772164127589;
        Thu, 26 Feb 2026 19:48:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b974csm37270365ad.65.2026.02.26.19.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 19:48:47 -0800 (PST)
Message-ID: <0058258d-0799-48b7-ab61-748b66828f15@gmail.com>
Date: Fri, 27 Feb 2026 12:48:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] defer: Fix grammar issues across Chapter 9 text
To: Kunwu Chan <kunwu.chan@linux.dev>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
References: <20260225124424.3325034-1-kunwu.chan@linux.dev>
 <f301d1e0-11be-4016-a85d-b0788fcde60c@paulmck-laptop>
 <f3515ef3292777bf756941333f552ea011a7ec51@linux.dev>
 <e55cfdd7-919f-46c8-b5b9-1d83e3aaefca@paulmck-laptop>
 <f55228123f7b2b1dd6c4fc0c25a8623ba692f771@linux.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f55228123f7b2b1dd6c4fc0c25a8623ba692f771@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Let me chime in.

On Fri, 27 Feb 2026 02:34:43 +0000, Kunwu Chan wrote:
[...]

> Hi Paul,
> 
> Sounds good. I went through the current PDF and gathered the occurrences 
> of "hinted at/on" that I could find. Here is the list for review:
> 
> Using PDF file: perfbook.2025.12.18a.pdf.
> 
> 1) PDF location:
>    p.98 (PDF page 110/686), Chapter 6 (Beyond Partitioning)
>    Source location: SMPdesign/beyond.tex (line 14)
> 
>    “This chapter has discussed how data partitioning can be used to
>    design simple linearly scalable parallel programs.
>    \Cref{sec:SMPdesign:Data Ownership} hinted at the possibilities of
>    data replication, which will be used to great effect in
>    \cref{sec:defer:Read-Copy Update (RCU)}.”
> 
> 2) PDF location:
>    p.142 (PDF page 154/686), Chapter 9.4 (Sequence Locks)
>    Source location: defer/seqlock.tex (lines 411–416)
> 
>    “As hinted on
>    \cpageref{sec:defer:Mysteries sequence locking},
>    both the read-side and write-side critical sections of a sequence
>    lock can be thought of as transactions, and sequence locking
>    therefore can be thought of as a limited form of transactional
>    memory, which will be discussed in
>    \cref{sec:future:Transactional Memory}.”
> 
> 3) PDF location:
>    p.155 (PDF page 167/686), Chapter 9.5 (RCU)
>    Source location: defer/rcufundamental.tex (lines 559–563)
> 
>    “In such cases, RCU readers can be considered to be fully ordered with
>    updaters, despite the fact that these readers might be executing the
>    exact same sequence of machine instructions that would be executed by
>    a single-threaded program, as hinted on
>    \cpageref{sec:defer:Mysteries RCU}.”
> 
> 4) PDF location:
>    p.184 (PDF page 196/686), Chapter 9.5.4.12 area
>    Source location: defer/rcuusage.tex (lines 2052–2054)
> 
>    “And so it is that RCU's use cases are conceptually more complex than
>    is RCU itself, as hinted on
>    \cpageref{sec:defer:Mysteries RCU Use Cases}.”
> 
> 5) PDF location:
>    p.533 (PDF page 545/686), Quick Quiz answers area
>    Source location: defer/rcuintro.tex (lines 141–145)
> 
>    “As hinted at in
>    \cref{sec:cpu:Hardware Optimizations,sec:cpu:Hardware Free Lunch?},
>    speed-of-light delays mean that a computer's data is always stale
>    compared to whatever external reality that data is intended to model.”
> 
> Please let me know which ones you’d prefer to keep as-is and 
> which should be adjusted, and I’ll prepare a patch accordingly.

Not a native speaker of English, but I don't see any need of changing them.

From 1)

  Section XXX hinted at the possibilities of data replication, ...

From 2), 3), and 4)
  
  As/as hinted on page YYY ...

From 5)

  As hinted at in Section ZZZ, ...

All of them sound pretty natural to me.

You might be missing the implication of "page XXX", which can mean
physical page in a book.  Saying "on page XXX" is quite natural.
OTOH, when you see "Section XXX hinted at <some ideas>", you should
consider "hint at" works as a synonym of "indicate" as a verb.

Hope this helps.

Thanks, Akira

> 
> 
> Thanx, Kunwu
