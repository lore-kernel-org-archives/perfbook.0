Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34433 "EHLO
 mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751607AbcDBCju (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 1
 Apr 2016 22:39:50 -0400
Received: by mail-oi0-f67.google.com with SMTP id q133so15333328oib.1 for
 <perfbook@vger.kernel.org>; Fri, 01 Apr 2016 19:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc;        bh=Gbb41/NKMqtXBA+XP6bS++wWNIXEcmVTIR/byiQFmuI=;
 b=YwHe3y/0eNvrWwPBZWtFcesfeHIWHgA6EYg55+gIV8Y7EZVtwjPyo9Me2zswNzO7Dl
 S6mqCM9udPBh6VDFwT2rEf0OiF4jbyobSKHPXzdBplRg/Gh1Rswt6yovwxV6ruqLD+5I
 jxAly+LK7Cqa0Q9YbYm27iJqnr0tNyTKRsw9J1uO4FofX/97+XGDEyogMnE/ihd5bzaL
 H5vwEX09widx/YUuJB4xRbWPEQgr1M6hMyr2sw6VrJdlgi6258Lbd39age0UQPtq4N4G
 YyRRjn3Ej5KjGLwtVaW2fKHDO04IaBkLoq/oLUQQ2mTuHaIQAh4n4iirqQ2JNegY86Ut
 oR+Q==
MIME-Version: 1.0
In-Reply-To: <1459556911-11538-5-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-5-git-send-email-sj38.park@gmail.com>
Date: Sat, 2 Apr 2016 11:39:49 +0900
Message-ID: 
 <CADj5ksQFv7pCx1WLdWRtNQwff7LBg+BspASL5dhbJAJVC2qeUQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] advsync: fix wrong code example
From: Yokosawa Akira <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

Sorry, I missed cc: to the list. Reposting...

-- 
Hi,

2016-04-02 9:28 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
> The code means `Y = *(A + 4)` but it is written as `Y = *A`. This commit
> fixes the typo.
>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index ee9312d..b1f49d3 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>  \begin{minipage}[t]{\columnwidth}
>  \scriptsize
>  \begin{verbatim}
> -*A = X; Y = *A;
> +*A = X; Y = *(A + 4);

I think

+ *A = X; *(A + 4) = Y;

is what meets the possible combination given below.

STORE *A = X; STORE *(A + 4) = Y;
STORE *(A + 4) = Y; STORE *A = X;
STORE {*A, *(A + 4) } = {X, Y};

Regards,


--
Akira Yokosawa <akiysw@gmail.com>


>  \end{verbatim}
>  \end{minipage}
>  \vspace{5pt}
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
