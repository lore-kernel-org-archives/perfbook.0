Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1615666
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFngIpUE"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so1585533a12.2
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 23:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703663402; x=1704268202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsKfS1USR3tFVs3EoZvj/z8rfJhmhD0wG7I63m/lzms=;
        b=EFngIpUE3ZisV+Dg1L9+mMIFm4ZzRpkhOx8/zAEW6RaIylEW9iehKgtyql6APOWQo1
         4aRqpX0K/c9Xw8WKkwE1U3iX3IGOS2aihJRoHtAf/uyDKz19aCtZ9Y2Mes5UiaOEfolY
         6kBLUwM1i5nebLXM6URMf1kfpH31mK5T5e3k+jem44PK7pOGLKr+pujXh/Dj/GJj7tDE
         ECL3ipdeJ79mYcHxNRYNp/4+5bTXLnyvNk1RpNP1uN2UqINkvWy3Rh0nDV7peQ2Xmbfg
         GBHrCST+hdgj7kuOMAt3AYDFOHNiqh9CaXdjWIB8CFbvwsiZP90Uk0ufctJvpxBV/Vdv
         LcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703663402; x=1704268202;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsKfS1USR3tFVs3EoZvj/z8rfJhmhD0wG7I63m/lzms=;
        b=kxgpCgyFk7DZyRo8/Ds4tQwp9yOEQaRiN510CS3sTaX0dMs2R5wnrDVX0MQVsAViI8
         ngtskUgPg+E98d0Q00Oj8lbHCLZFh/D0yBOsr0TnkqXQ1t2HKavQAolhO6xGlO0v5Wxa
         eIp9NxgORSM/scC5dH5A1CsKblK4CfMHUBHYwiSBPVxcOdLoV+YLLOJQzfNglrc7xNHZ
         Nb4P9JuRExwZrQKeRR1UW6LHnyiMNu4hAP9fkhc/Ag9F9yWm9UznhJAcDQtfgkLRw2ZL
         IyKPlGmSu1J6daK3B2p5sR8MO4/4aU0jYMgEVXi2UVhwhjoTzolTMP4eJFXoUqs95e1t
         qk4w==
X-Gm-Message-State: AOJu0YwTkoNEVVD7ZrQVZOl8oWfn63LF3q1n8jJi+zjsQ5pV36Bn/aFa
	xtdZ4vjc4GCokxNObGqPWgA=
X-Google-Smtp-Source: AGHT+IH6UcqdJ9NPskfQss/sd7q+mIloKn8HGtpKFzNItDNfjg5Br2WTaslZNjSoogtxqg0QpGBT1Q==
X-Received: by 2002:a05:6a21:6da2:b0:195:1caa:d78c with SMTP id wl34-20020a056a216da200b001951caad78cmr3505353pzb.52.1703663402125;
        Tue, 26 Dec 2023 23:50:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a1a4600b0028c94f78c07sm399509pjl.30.2023.12.26.23.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 23:50:01 -0800 (PST)
Message-ID: <33039676-e5dc-4ad1-8d4a-485c9844ed64@gmail.com>
Date: Wed, 27 Dec 2023 16:49:59 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook v3] howto: make ref to git archive explicit
To: zhouzhouyi@gmail.com
References: <1703659160-11466-1-git-send-email-zhouzhouyi@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1703659160-11466-1-git-send-email-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 27 Dec 2023 14:39:20 +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> Make "git archive" in answer to Quick Quiz 1.3 more explicit, so that reader can easily know where
> "git archive" is.
> 
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
> ---
> Hi Akira
> 
> This is version 3 of my patch "make ref to git archive explicit".
> 
> I fixed the problem of version 1 under your guidance.
> 
> The idea is originally proposed by our Chinese version editor Yunjing Li, but 
> she was too modest to be a patch author.

In that case, a Reported-by: or Suggested-by tag should work, that is
if Yunjing Li is OK with her reachable email address exposed.

> 
> I have forget to add "Signed-off-by" in version 2 of my patch, sorry for the inconvenience that I brought.
> 
> Thanks again
> 
> Zhouyi
> --
>  bib/syncrefs.bib | 8 ++++++++
>  howto/howto.tex  | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index 6ee50e3b..63a7a8bc 100644
> --- a/bib/syncrefs.bib
> +++ b/bib/syncrefs.bib
> @@ -2025,3 +2025,11 @@ Parallel Server on UNIX",
>   Month="September",
>   Note="Linux Plumbers Conference \url{https://lpc.events/event/16/contributions/1226/}",
>  }
> +
> +@unpublished{PaulmckPerfbookGit,
> + author="Paul E. McKenney",
> + title="Is Parallel Programming Hard, And, If So, What Can You Do About It? Git Archive",
> + year="2023",
> + note={\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git}},
> + lastchecked="December 27, 2023",
> +}
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 55270cba..e7cd5f3c 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -226,7 +226,7 @@ Here are a few possible strategies:
>  	only a blank sheet of paper.
>  \item	If you find the Quick Quizzes distracting but impossible
>  	to ignore, you can always clone the \LaTeX{} source for
> -	this book from the git archive.
> +	this book from the git archive~\cite{PaulmckPerfbookGit}.

Alternatively, you can put a footnote instead. For example:

  See \cref{sec:howto:Whose Book Is This?} for instructions to do this.

should also suffice.

Generally speaking, citations are suitable when you want readers
to read the referenced document/code and the like.  In this case,
presenting just the URL of Git repo won't give readers sufficient
info.

QQz 1.3 belongs to Section 1.2, while the instructions are in
Section 1.5.  So putting a footnote as a (kind-of) "forward reference"
looks more reasonable to me.

Can you try this alternative in v4 ?

If you are OK with it, please use

  Suggested-by: Akira Yokosawa <akiyks@gmail.com>

    Thanks, Akira
    
>  	You can then run the command \co{make nq}, which will
>  	produce a \co{perfbook-nq.pdf}.
>  	This PDF contains unobtrusive boxed tags where the Quick Quizzes

