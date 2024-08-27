Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34E19EEA2
	for <perfbook@vger.kernel.org>; Tue, 27 Aug 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724773038; cv=none; b=oBK7OnSZmSJpECw9/5d9I2bW4NYPwlwPr4KFMY3ClwDVtcsobZImNCRMtKLp3qSbHfqEfU8HX/BSkRi6qp7qqbbu4e+V6cgb27NjxSYVedEmbUI+v/J6J+b9sXmkGyU7NOpqPBc//AQpllHeDFPxptaOam/8KbSSSPMckMeAGAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724773038; c=relaxed/simple;
	bh=iPwOpMQhuRFd0FXvVuqNcsRTdDtsksW+rBPTrKrorgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoFi/mQjlaaK9onaPfxGgeqE6UPCkDqOUkdGzpNewR9jbTe9/xHW1RuEjopM5MDWUs+kJAd4xq8RpibHL09b8HtL3Jdvs8IMXzoJYX4PGsym0rAMRrLcIzwFr+WiC9QZJGkfSlKOc2lokei9yrOP23dtkHugpB6iWXpByCkb2z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe0/xp5u; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe0/xp5u"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141285db14so4903699b3a.1
        for <perfbook@vger.kernel.org>; Tue, 27 Aug 2024 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724773036; x=1725377836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qiC6k8RAnBYSnZ2OUFxnZiJwSgnwbY0Z8LvleSrymk=;
        b=fe0/xp5ujYU9d4v+fILQlmy6/SUTn/4eS8/ASl7Om6KQG0k/k6WNOZ/RkGbT68Idwz
         rUHfDoomyguQ6d9BYVuolS9600Ulgeode/P6jTZlszhyilw53KNwfL7K+3+Dj2khyx41
         X1+12kCCXg+mrs3tGC1LT9r8uCg0N3B7s+rjfwK5NQJqAd2i8ntsl0fHg0uAoRFTJMe6
         KwILnJ/shITP9pnXtyqIk5sCCpxFDkOhG3t6V/w0CYUs2IAqtvmxxA79vdSTb70CL7zL
         GOtNGmjjkUZBY5yISZjhtRZCQN+SqSRW5hyNR2Lwzu9GHhQ6/GC4RL7YrxTDqZHyBsJ/
         OOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724773036; x=1725377836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qiC6k8RAnBYSnZ2OUFxnZiJwSgnwbY0Z8LvleSrymk=;
        b=BeMlg09BIv1OmDiGaXTJ7rLLewPu+t8IujcroActKI/Xhmro/jUdSBOWptKjdCOF+Q
         Ii6ONYW6X/FL1OqpcRr3iXHm2q1lgTEu9BkStvd4ELbfXdi1MAOXlmQi7htNfcja1WaX
         CJA8Oqk5Q7bdzjjFqTBUVbNZ2WnyeIPlA4U8g6xw3pI588oKdrNDDK7CoK7od+1o5+19
         XFyG9dkp2tM/16qXg9UbF3cluRu4Mtgk9WDEFneHiDMfJ8azVtlyZ0pDgs+2F/5MJKkN
         QNzbmW0TTvqPXiL530p7lwJGP8Ymi7Db6ed+GCUxpAEcgZyw1fPODASTo8C038hn2Bc7
         ACMQ==
X-Gm-Message-State: AOJu0Yy9F2EId0Z+BtMU1Ori7Zx1G2NQvE6cV6HAtC9py7i+UGo0YR3c
	s5VYmt96chm2gpFWTkeZekuHFb7XUcD/1IF87hGVQXKb1to5SuLm
X-Google-Smtp-Source: AGHT+IErZ+55ET3qKW0Ov32Tex67mlmBr4Pjdr5IH2ZIJKee+FdlrnKbBZeXhstyPVly8GY/6tOHOw==
X-Received: by 2002:a05:6a20:e687:b0:1c8:b10d:eadb with SMTP id adf61e73a8af0-1cc8b4855b3mr16437012637.17.1724773036133;
        Tue, 27 Aug 2024 08:37:16 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143425492fsm8670916b3a.58.2024.08.27.08.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 08:37:15 -0700 (PDT)
Message-ID: <59df9d95-9f8d-4eab-afd9-0552ed6f054b@gmail.com>
Date: Wed, 28 Aug 2024 00:37:18 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Figure 3.13 is too tall in -eb size builds
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>
References: <5974cbc2-3436-41bc-84a5-b7f1b22ab4a5@gmail.com>
 <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c973c3a1-f321-417b-83e0-b5a4dc521857@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 27 Aug 2024 04:02:32 -0700, Paul E. McKenney wrote:
> On Tue, Aug 27, 2024 at 01:50:56PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Leo's latest CI build of perfbook-eb.pdf failed as you can see at:
>>
>>     https://gitlab.com/linux-kernel/perfbook/-/jobs/7668105673
>>
>> This is because the new Figure 3.13, or cpu/SimpleWrite.svg, is
>> optimized for -2c builds and too tall for -eb size.
> 
> Guilty to charges as read!  ;-)
> 
> And thank you for checking!!!
> 
>> A quick fix would be to shrink the figure for -eb builds,
>> but that would result in a small diagram hard to read.
> 
> Agreed.
> 
>> Also, the new figure is not yet mentioned in the text.
>>
>> Furthermore, the corresponding enum list talks about
>> CPU 0 doing a store, whose cache line is transferred from
>> CPU 7's cache, while the figure presents a cache line transfer
>> between CPU 1 and CPU 6.
>>
>> My guess is you are planning to adjust either of the list or the
>> figure.
> 
> You got it!  I have pen-on-paper adjustments to the list, and to the
> rest of the chapter.  I will get that done by the end of this weekend
> at the latest.  And in a few minutes, I will be going to the gym with a
> printout of Chapter 5 ("Counting") to review it, for updates, but mostly
> to prepare for an upcoming talk at Kernel Recipes on counting.
> 
>> Tweaking the width of the figure can wait a while. I suppose.
> 
> How much shorter do I need to make it?  If a 20% reduction suffices
> (which looks to be the case over here), I can simply reduce the amount
> of space between rows.  If 30% is needed, I could reduce that space
> further and shade alternating rows, like we currently do for some tables.
> If more than that is needed, I could do a full-page-width figure with the
> first half of the rows on the left and the remaining rows on the right.
> Or split it into two figures, perhaps doing so only for -eb builds.
> 

So, current version of the SVG has this dimension:

>    width="382.58057mm"
>    height="819.60443mm"
>    viewBox="0 0 382.58057 819.60443"

If you stick with the width of "3in" in the \resizebox,  reducing the
height to less than "706.00mm" should make it fit in -eb builds.

If you are thinking of changing the width as well, you need some
math to keep the aspect ratio.  :-)

> For -2c builds, I am considering doing a 10-20% reduction in the space
> between the blocks for the two CPUs, which would make the text easier
> to read.  Maybe also embolden the fonts.
> 
> Or is there a better way to adjust this figure, for -eb as well as for
> other builds?

I don't see the need of having multiple versions of the figure.
There has been no figure which needs such special tweaks so far.
An example of tall one is Figure 9.14, which looks reasonable in
-eb builds.

Hope this helps, Akira

> 
> 							Thanx, Paul

