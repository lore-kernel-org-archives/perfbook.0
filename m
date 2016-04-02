Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-ob0-f193.google.com ([209.85.214.193]:36705 "EHLO
 mail-ob0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751183AbcDBDJa (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 1
 Apr 2016 23:09:30 -0400
Received: by mail-ob0-f193.google.com with SMTP id c1so18085858obw.3 for
 <perfbook@vger.kernel.org>; Fri, 01 Apr 2016 20:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc;        bh=ZtwKMmOLGseg8YE+DIrv0gxozDo9oiQQ9z7c8ZqVVYM=;
 b=g2VyyfzAEEpqsBpp9WfrsVSLUD6MkE8wC5jVXKZTcVxQ5n0qpOuuyZV+0LaguA0OVw
 De3PLzj8BEQMwZdI3GZI75RO8ZekeVreLsrRXxB+ZYcEztdB0x2l1ivlO9uDGNu+ry+K
 9YuaO0KCbDfjMyEe4ekHyGLRUPFEwIcIP2ZzdMqxgEXCp2xpP7idy4O+GljPBnT1aKV0
 KJfkiIwMEJgx5aXukqPlZ3WiqL5QO6bI+TDcu4K3qfrArlUPrkkzi3YXR8Ki+iMN03H3
 958JxsIinx8Pm9d3N5pSIWervX6cMDOvFFyijxgivlD+f5S8GUnebfTNNxJJl2JHe43V
 FzeA==
MIME-Version: 1.0
In-Reply-To: <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
References: <alpine.DEB.2.10.1604021149350.22948@hxeon>
 <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
Date: Sat, 2 Apr 2016 12:09:29 +0900
Message-ID: 
 <CADj5ksQtF0fNB7oPrT5JYq5hA1nieEo-UaVCif4g-TgN52DY+g@mail.gmail.com>
Subject: Re: [PATCH] advsync: fix wrong code example
From: Yokosawa Akira <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

Oh, You have already added the tag.
Thanks!

2016-04-02 12:03 GMT+09:00 SeongJae Park <sj38.park@gmail.com>:
> The code means `*(A + 4) = Y` but it is written as `Y = *A`. This commit
> fixes the typo.
>
> Suggested-by: Akira Yokosawa <akiysw@gmail.com>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index ee9312d..8e9c876 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>  \begin{minipage}[t]{\columnwidth}
>  \scriptsize
>  \begin{verbatim}
> -*A = X; Y = *A;
> +*A = X; *(A + 4) = Y;
>  \end{verbatim}
>  \end{minipage}
>  \vspace{5pt}
> --
> 1.9.1
>
