Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7884403
	for <perfbook@vger.kernel.org>; Wed, 27 Dec 2023 04:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLjSyAGc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so1159164b3a.1
        for <perfbook@vger.kernel.org>; Tue, 26 Dec 2023 20:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703652804; x=1704257604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCrTOBXD7t5OpHnGdABZP/9Ih5JFve5h7l791bj6w4k=;
        b=BLjSyAGcibvsqwLNrVvWEsT4kyWZEX36WzFXLoSBVMEcWXrBUXZKfATbjv1XXiUcQ7
         OGeXYlnJ+sT/UGuwgLKfBl/v+mRN241BcK1P48p5L/DS0/bVwVsZIAAs4fdsAxk9IvGr
         ZoYwiinTKl3Y5sDrcy/JJLSex1lQtC9WPoZmsSRgpRUE1G5/+kSPasvElWcO1uhAEY/r
         5Zt1cHupR318UeJ/biBXloi6VvpGXn/2N/zWJVKvkOdZht2VHvZawHi4id/UptOSLVbn
         kIryymw+UyAjkKy7uhOg0Dc/FLR4j32r2jFvWaqo4e6VSXMKiSNzVsDiRPJHSkQCC71Y
         KKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703652804; x=1704257604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCrTOBXD7t5OpHnGdABZP/9Ih5JFve5h7l791bj6w4k=;
        b=wt6JveegIYaLP45LfzHH1LuvsVuhv66F/NgRP7WQ4WEAmClwLkwq8BHEcdWv19dSYS
         iY6zVrx5+SvsLkPT/5L8Nw1CxJjfVuPGDgsIJqR6e24LUZ6ZyO/IvnL4WF2tIL2SzOYK
         Lb46ioCPtopz58IQ9qCs1Bor3IbtODaO+9c+yFBk/+DInyt4CAJPVUwXFJTi3EA6sg3r
         3rO4lBTPls3buktijowRJZ+l6Umg3xrDOqs382VI8BuzttDzR4s8ghHls1JY2BI5YRL+
         rxQKiQj6FV8l6omw70/FGQPQrLVWMnCogJ+njypVI4OI2L9cZpvRVP5J7k9tQ7Hi4Laf
         KB7A==
X-Gm-Message-State: AOJu0Yy7iG5LK2K+grn2TmbzdK3BHnkHf0CvnwKv1FxcGVF/cI/FrsJi
	xBn2BbTgsVU7VElJb9QCETo=
X-Google-Smtp-Source: AGHT+IGOUU37R/jaf397SAZAsfM5hPKgQlXtAFSxHY5mUrOehzAbR8sa7FrH4OjcrPyYNNzJvWkXxg==
X-Received: by 2002:a05:6a20:3d1a:b0:18f:97c:384e with SMTP id y26-20020a056a203d1a00b0018f097c384emr10498973pzi.40.1703652803932;
        Tue, 26 Dec 2023 20:53:23 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q23-20020a056a0002b700b006d9a4a4b14dsm6625835pfs.68.2023.12.26.20.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 20:53:23 -0800 (PST)
Message-ID: <b2d6fa0c-efe1-4c4f-af1b-3d850bc34c9f@gmail.com>
Date: Wed, 27 Dec 2023 13:53:21 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH perfbook] bib: make ref to git archive explicit
Content-Language: en-US
To: zhouzhouyi@gmail.com
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
References: <1703645394-30331-1-git-send-email-zhouzhouyi@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1703645394-30331-1-git-send-email-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Zhouyi,

[Dropping YunJing Li's unreachable address]

On Wed, 27 Dec 2023 10:49:54 +0800, zhouzhouyi@gmail.com wrote:
> From: 周洲仪 <8241764+zhouyizhousihai@user.noreply.gitee.com>

No, we can't accept a patch from an author whose email address is
unreachable (tested from my gmail account).
Please use YunJing Li's globally accessible email address please
if you would like to keep the credit.

> 
> According to our Chinese version editor Yunjing Li's advice,
>  make reference to perfbook's git archive explicit.

Please describe what Yunjins Li's advice was.
Honestly speaking, I don't see much point in this update.

>  
> Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>

We need a Signed-off-by: tag from the author as well ...

One more minor nit below:

> ---
>  bib/syncrefs.bib | 8 ++++++++
>  howto/howto.tex  | 2 +-
>  legal.tex        | 5 ++---
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> index 6ee50e3b..4f347488 100644
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
> \ No newline at end of file

Need to be fixed.

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
>  	You can then run the command \co{make nq}, which will
>  	produce a \co{perfbook-nq.pdf}.
>  	This PDF contains unobtrusive boxed tags where the Quick Quizzes
> diff --git a/legal.tex b/legal.tex
> index f443df37..ca21ecaf 100644
> --- a/legal.tex
> +++ b/legal.tex
> @@ -42,12 +42,11 @@ Source code is covered by various versions of the GPL\@.\footnote{
>  Some of this code is GPLv2-only, as it derives from the Linux kernel,
>  while other code is GPLv2-or-later.
>  See the comment headers of the individual source files within the
> -CodeSamples directory in the git archive\footnote{
> -	\url{git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git}}
> +CodeSamples directory in the git archive~\cite{PaulmckPerfbookGit}

I think Legal pages should better be self-contained if at all possible.
IOW, the URL should better be somewhere in the Legal pages.

>  for the exact licenses.
>  If you are unsure of the license for a given code fragment,
>  you should assume GPLv2-only.
>  
>  Combined work {\textcopyright}~2005--\commityear\ by Paul E. McKenney.
>  Each individual contribution is copyright by its contributor at the time
> -of contribution, as recorded in the git archive.
> +of contribution, as recorded in the git archive~\cite{PaulmckPerfbookGit}.

Do we really need this?

    Regards, Akira

> -- 
> 2.34.1
> 

