Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633A44362
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 10:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAVBsj2C"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9a79a1ad4so616796b3a.2
        for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 02:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703673252; x=1704278052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUTx6hVB+t3AWUxpzbQgfJwzssu3QKw1qamT26CX88I=;
        b=YAVBsj2C/wl4OjtZnVth64OAltdOOLnkXFI7RrDnBNIORlsKl9ykFeVRziSNBA7X+s
         agq0uI3AL5AzzPQWIMr7ULGXVygiatUAMTOFjDpTHjTT2ZA0fQmycoICtCn/EvdQJoHL
         jSq5+UFogGsxMmJ35qYhIkyQbQ5qgJ8Rw7RWukJDIGdjiujLEqSHoHCMBjm9OcYVuBWV
         fcXuiWImZ/h2pSOwaRVmms+kA62kCGAx2fAWis6HEs8Xk/cPCC0KABPDfreY/eghhbcH
         mrxhjVI8tXX4TCuD1YIZqF8EfkQRWoBP9Q4l3NmhNCFVOWBtuPNNH1AvEi5H5u8i+eas
         JVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703673252; x=1704278052;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUTx6hVB+t3AWUxpzbQgfJwzssu3QKw1qamT26CX88I=;
        b=MI42uPzzwcUTBqPx/8B/CGKSe1bm7z1zctnm8JHPO70DdPFyKedOk80fiC2edPitVp
         xgnGKUbEFQ0m0qqFCFGoM0sR99RtYgkgPcQizJnATBI3ckuMNxwAwBos7W+Ynj7vIiop
         H17hTirBNuw1UlTDhmIFJUoN+Au/rhG056QaIlaajv1A789T1rukP5/tlHE1alXceOkw
         P6P+g4HoRARoM7Dbks7HPf1H/Tcbcz2k+2BFPQwO/mlsgWHtg5TwlgYr9C7DXTV9AwTY
         WdfnNFpam+v7kM9LbU1T/3a2fXuRxk2yfWsjlkbHQ9rKvYIpmckLMCakILaPEC+xSjO+
         CsEA==
X-Gm-Message-State: AOJu0YxDOH2Wiu37vAfFcQoeheD7vRs/0JCZgrXT6U3IAu3DO7sWrh6h
	KM8cHGmdEfaZyORbP15KYuI=
X-Google-Smtp-Source: AGHT+IHoUbPCRy+m3scE8qpTr15CEjtbgSNys3smas9jA3v2DQdx1UFEB3WSjbjnO+3u/2YvorFI8Q==
X-Received: by 2002:a05:6a20:2583:b0:196:2ee6:ac27 with SMTP id k3-20020a056a20258300b001962ee6ac27mr182206pzd.39.1703673252579;
        Wed, 27 Dec 2023 02:34:12 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902dad100b001d3eff0728asm11629610plx.78.2023.12.27.02.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 02:34:12 -0800 (PST)
Message-ID: <59dc36ad-16f3-4424-b698-0a1678c3a48e@gmail.com>
Date: Wed, 27 Dec 2023 19:34:09 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook v4] howto: make ref to git archive explicit
Content-Language: en-US
To: zhouzhouyi@gmail.com, paulmck@kernel.org
References: <1703669665-21764-1-git-send-email-zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1703669665-21764-1-git-send-email-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 27 Dec 2023 17:34:25 +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
> "git archive" is.

Now that this patch adds just a footnote mentioning Section 1.5,
commit log can use some adjustments.

How about:

    Make "git archive" in answer to Quick Quiz 1.3 more explicit by
    adding a footnote, so that a first-time reader, who have never
    read Section 1.5, can easily know how to clone the Git repo and
    build PDFs.

That said, I'm beginning to wonder how many of first-time readers
would bother trying -nq builds without having got annoyed by those
lots of QQz's in perfbook. ;-)

> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

    Thanks, Akira

> ---
> Hi Akira
> 
> Thank you for your valuable suggestions and guidances, I learned a lot
> during this process ;-)
> 
> And I invoke make -j 20 in my ubuntu 22.04, everything works great!
> 
> Our editor Yunjing Li is still too modest to provide her email, sorry.
> 
> Thanks for your patient and hard work.
> 
> Thanks
> Zhouyi
> --
>  howto/howto.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 55270cba..8d678644 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -226,7 +226,9 @@ Here are a few possible strategies:
>  	only a blank sheet of paper.
>  \item	If you find the Quick Quizzes distracting but impossible
>  	to ignore, you can always clone the \LaTeX{} source for
> -	this book from the git archive.
> +	this book from the git archive.\footnote{
> +		See \cref{sec:howto:Whose Book Is This?}
> +		for instructions to do this.}
>  	You can then run the command \co{make nq}, which will
>  	produce a \co{perfbook-nq.pdf}.
>  	This PDF contains unobtrusive boxed tags where the Quick Quizzes
